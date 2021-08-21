import 'dart:async';
import 'package:dstore/dstore.dart';
import 'package:dstore/src/action.dart';
import 'package:dstore/src/extensions.dart';
import 'package:dstore/src/middlewares/async_middleware.dart';
import 'package:dstore/src/selector.dart';

typedef Dispatch = dynamic Function(Action<dynamic> action);

typedef Middleware<State extends AppStateI<State>> = dynamic Function(
    Store<State> store, Dispatch next, Action<dynamic> action);

typedef StoreErrorHandle = void Function(DStoreError derror);

typedef Callback = dynamic Function();

typedef VoidCallback = void Function();

typedef SelectorUnSubscribeFn = dynamic Function(UnSubscribeOptions? options);
typedef StoreOnReadyListenerFn = void Function(Object? error, Object? st);

class Store<S extends AppStateI<S>> {
  final String appVersion;
  final Map<String, PStateMeta<PStateModel<dynamic>>> internalMeta;
  final Map<String, List<_SelectorListener>> selectorListeners = {};
  late final List<Dispatch> _dispatchers;
  final Map<String, String> _pStateTypeToStateKeyMap = {};
  final Map<String, Timer> internalDebounceTimers = {};
  late S _state;
  var isReady = false;
  final StorageOptions? storageOptions;
  StoreOnReadyListenerFn? _onReadyListener;
  final bool useEqualsComparision;
  final StoreErrorHandle handleError;
  late final internalMocksMap = <String, Action>{};
  late final NetworkOptions? networkOptions;
  late final VoidCallback? _unsubscribeNetworkStatusListener;
  final _offlineActions = <Action<dynamic>>[];
  bool? networkStatus;
  dynamic? navHistory;

  PersitantStorage? get storage => storageOptions?.storage;
  Store(
      {required this.internalMeta,
      this.storageOptions,
      required this.appVersion,
      this.useEqualsComparision = false,
      NetworkOptions? networkOptions,
      required S Function() stateCreator,
      required this.handleError,
      List<Middleware<S>>? middlewares,
      List<Middleware<S>>?
          beforeMiddlewares, // by default dstore appends few middlewares before your list of middlewares ,if you want something to be upfront provide them here
      S? initialState}) {
    final ms = <Middleware<S>>[];
    ms.addAll(beforeMiddlewares ?? []);
    ms.addAll([
      debounceMiddleware,
      psHistoryMiddleware,
      asyncMiddleware,
      streamMiddleware
    ]);
    ms.addAll(middlewares ?? []);
    _dispatchers = _createDispatchers(ms);
    _setNetworkOptions(networkOptions);
    if (storageOptions != null) {
      _prepareStoreFromStorage(stateCreator);
    } else {
      _prepareNormalStore(stateCreator);
    }
  }

  void _setNetworkOptions(NetworkOptions? op) {
    networkOptions = op;
    _unsubscribeNetworkStatusListener =
        op?.statusListener.listen(_handleNetworkStatusChange);
  }

  void _handleNetworkStatusChange(bool status) {
    print("status changed to $status");
    this.networkStatus = status;
    if (status) {
      _processOfflineActions();
    }
  }

  void _processOfflineActions() async {
    print("processing offline actions $_offlineActions");
    if (_offlineActions.isNotEmpty) {
      final ac = [..._offlineActions];
      _offlineActions.clear();
      if (storage != null) {
        await storage!.clearOfflineActions();
      }
      ac.forEach((action) {
        dispatch(action);
      });
    }
  }

  Future<void> addOfflineAction(Action<dynamic> action) async {
    assert(networkOptions != null);
    action = action.copyWith(internal: null);
    _offlineActions.add(action);
    if (storage != null) {
      final psm = getPStateMetaFromAction(action);
      final httpMeta = psm.httpMetaMap?[action.name];
      final data = action.toJson(httpMeta: httpMeta);
      await storage!.setOfflineAction(action.id, data);
    }
  }

  void listenForReadyState(StoreOnReadyListenerFn fn) {
    _onReadyListener = fn;
  }

  S get state => _state;

  void _prepareStoreFromStorage(S Function() stateCreator) async {
    try {
      final storage = storageOptions!.storage;
      print("preparing store from storage");
      await storage.init();
      print("after init");
      final sState =
          await storage.getKeys(internalMeta.values.map((e) => e.type));
      print("state from storage $sState");
      if (sState == null) {
        // meaning running app first time or user deleted app data
        await storage.setversion(appVersion);
        _prepareNormalStore(stateCreator);
      } else {
        final AppStateI<S> s = stateCreator();
        final map = <String, PStateModel<dynamic>>{};
        final oldAppVersion = await storage.getVersion();
        await Future.wait(internalMeta.entries.map((e) async {
          final key = e.key;
          final psm = e.value;
          if (_pStateTypeToStateKeyMap[psm.type] != null) {
            throw ArgumentError.value(
                "You already selected same PState before with key ${_pStateTypeToStateKeyMap[psm.type]}  ");
          }
          _pStateTypeToStateKeyMap[psm.type] = key;
          dynamic sData = sState[psm.type];
          var ds = psm.ds();
          if (sData != null) {
            final sm = psm.sm!;
            if (sm.migrator != null) {
              sData = sm.migrator!(
                  oldAppVersion ?? "", sData as Map<String, dynamic>, ds);
              await storage.set(
                  key: psm.type,
                  value:
                      sData); // store new value back to disk to be updated with appVersion number
            }
            ds = sm.deserializer(sData);
          }

          _setStoreDepsForPState(ds, this);
          map[key] = ds;
        }));
        print("copying map $map");
        _state = s.copyWithMap(map);
        await storage.setversion(appVersion);
      }
      final offA = await storage.getOfflineActions();
      if (offA.isNotEmpty) {
        final actions = offA.map((e) {
          final sk = _pStateTypeToStateKeyMap[e["type"]]!;
          final psm = internalMeta[sk]!;
          final httpMeta = psm.httpMetaMap?[e["name"]];
          return Action.fromJson<dynamic>(e, httpMeta);
        });
        _offlineActions.addAll(actions);
      }
      isReady = true;
      _onReadyListener?.call(null, null);
      _processOfflineActions();
    } catch (e, st) {
      print("Error in storage setup $e");
      print(st);
      _onReadyListener?.call(e, st);
      storageOptions!.onReadError(e);
    }
  }

  void _prepareNormalStore(S Function() stateCreator) {
    final s = stateCreator();
    final map = <String, PStateModel<dynamic>>{};
    internalMeta.forEach((key, psm) {
      if (_pStateTypeToStateKeyMap[psm.type] != null) {
        throw ArgumentError.value(
            "You already selected same PState before with key ${_pStateTypeToStateKeyMap[psm.type]}  ");
      }
      _pStateTypeToStateKeyMap[psm.type] = key;
      final ps = psm.ds();
      _setStoreDepsForPState(ps, this);
      map[key] = ps;
    });
    _state = s.copyWithMap(map);
    isReady = true;
  }

  void _setStoreDepsForPState(PStateModel m, Store? store) {
    print("_setStoreDepsForPState ${m.runtimeType} store $store");
    if (m is PStateStoreDepsMixin) {
      final m1 = m as PStateStoreDepsMixin;
      print("Setting store value for model $m store : $store");
      (m as PStateStoreDepsMixin).dontTouchMeStore2(store);
    }
  }

  List<Dispatch> _createDispatchers(List<Middleware<S>> middlewares) {
    final dispatchers = <Dispatch>[]..add(_defaultDispatch);
    middlewares.reversed.forEach((m) {
      final next = dispatchers.last;
      dispatchers.add((Action<dynamic> action) {
        print("executing dispatcher");
        m(this, next, action);
      });
    });
    return dispatchers.reversed.toList();
  }

  dynamic _defaultDispatch(Action<dynamic> action) {
    dynamic processDefaultDispatch(Action action) {
      final sk = getStateKeyForPstateType(action.type);
      final psm = internalMeta[sk]!;
      final gsMap = _state.toMap();
      final currentS = gsMap[sk]!;
      var newS = currentS;
      if (action.isProcessed) {
        // processed by middlewares
        if (action.internal?.type == ActionInternalType.FIELD) {
          final csMap = currentS.toMap();
          csMap[action.name] = action.internal!.data;
          newS = currentS.copyWithMap(csMap) as PStateModel;
        } else if (action.internal!.type == ActionInternalType.PSTATE) {
          newS = action.internal!.data as PStateModel;
        }
      } else {
        if (DstoreDevUtils.isDebugMode) {
          if (action.ws != null) {
            throw ArgumentError.value(
                "action ${action.id} is a websocket action , looks like you didnt added websocket middleware while creating store!");
          }
          if (action.http != null) {
            throw ArgumentError.value(
                "action ${action.id} is a http action , looks like you didnt added http middleware while creating store!");
          }
          if (action.form != null) {
            throw ArgumentError.value(
                "action ${action.id} is form action , looks like you didnt added form middleware while creating store!");
          }

          if (action.stream != null) {
            throw ArgumentError.value(
                "action ${action.id} is stream action , looks like you didn't added stream middleware while creating store!");
          }
        }
        dynamic mock = internalMocksMap[action.id];
        if (mock != null) {
          mock = mock as ToMap;
          newS = currentS.copyWithMap(mock.toMap()) as PStateModel;
        } else {
          newS = psm.reducer!(currentS, action) as PStateModel;
        }
      }
      if (action.beforeStateUpdate != null) {
        final proceed = action.beforeStateUpdate!(newS);
        if (!proceed) {
          return;
        }
      }
      if (action.silent) {
        print("Silent Action");
        _handleSilentActionStateChange(
            stateKey: sk,
            previousState: currentS,
            psm: psm,
            action: action,
            newGlobalStateMap: gsMap,
            newState: newS);
      } else if (!identical(newS, currentS)) {
        gsMap[sk] = newS;
        _handleStateChange(
            stateKey: sk,
            previousState: currentS,
            psm: psm,
            action: action,
            newGlobalStateMap: gsMap,
            newState: newS);
      }
    }

    DstoreDevUtils.handleUnCaughtError(
        store: this,
        action: action,
        callback: () => processDefaultDispatch(action));
  }

  void _handleStateChange(
      {required String stateKey,
      required PStateModel<dynamic> previousState,
      required PStateMeta psm,
      required Action<dynamic> action,
      required Map<String, dynamic> newGlobalStateMap,
      required PStateModel<dynamic> newState}) async {
    if (psm.sm != null) {
      print("_handleStateChange");
      assert(storageOptions != null);
      final so = storageOptions!;
      if (so.writeMode == StorageWriteMode.DISKFIRST) {
        try {
          final dynamic data = psm.sm!.serializer(newState);
          await storage!.set(key: psm.type, value: data);
        } on StorageError catch (e) {
          final sa = await so.onWriteError(e, this, action);
          if (sa == StorageWriteErrorAction.ignore) {
            _setStoreDepsForPState(previousState, null);
            _setStoreDepsForPState(newState, this);
            _state = _state.copyWithMap(newGlobalStateMap);
            _notifyListeners(
                stateKey: stateKey,
                previousState: previousState,
                currentState: newState);
            if (action.afterComplete != null) {
              action.afterComplete!(newState);
            }
          }
        } catch (e) {
          rethrow;
        }
      } else {
        _state = _state.copyWithMap(newGlobalStateMap);
        _notifyListeners(
            stateKey: stateKey,
            previousState: previousState,
            currentState: newState);
        try {
          final dynamic data = psm.sm!.serializer(newState);
          await storage!.set(key: psm.type, value: data);
        } on StorageError catch (e) {
          print("catched storage error in disk last $e");
          final sa = await so.onWriteError(e, this, action);
          if (sa == StorageWriteErrorAction.revert_state_changes) {
            newState = previousState;
            previousState = newState;
            newGlobalStateMap[stateKey] = newState;
            _setStoreDepsForPState(previousState, null);
            _setStoreDepsForPState(newState, this);
            _state = _state.copyWithMap(newGlobalStateMap);
            _notifyListeners(
                stateKey: stateKey,
                previousState: previousState,
                currentState: newState);
          }
        } catch (e) {
          print("uncaught error $e");
          rethrow;
        }
        if (action.afterComplete != null) {
          action.afterComplete!(newState);
        }
      }
    } else {
      _setStoreDepsForPState(previousState, null);
      _setStoreDepsForPState(newState, this);
      _state = _state.copyWithMap(newGlobalStateMap);
      if (newGlobalStateMap.containsKey("redditPS")) {
        final v = newGlobalStateMap["redditPS"];
        print("redditPs2 $v ${v.runtimeType}");
        if (v is PStateStoreDepsMixin) {
          print("store : ${v.dontTouchMeStore}");
        }
      }
      if (action.name == "ping") {
        print("Ping state changed ${action.name} ${action.afterComplete}");
      }
      _notifyListeners(
          stateKey: stateKey,
          previousState: previousState,
          currentState: newState);
      if (action.afterComplete != null) {
        action.afterComplete!(newState);
      }
    }
  }

  void _handleSilentActionStateChange(
      {required String stateKey,
      required PStateModel<dynamic> previousState,
      required PStateMeta psm,
      required Action<dynamic> action,
      required Map<String, dynamic> newGlobalStateMap,
      required PStateModel<dynamic> newState}) async {
    if (psm.sm != null) {
      print("_handleStateChange");
      assert(storageOptions != null);
      final so = storageOptions!;
      if (so.writeMode == StorageWriteMode.DISKFIRST) {
        try {
          final dynamic data = psm.sm!.serializer(newState);
          await storage!.set(key: psm.type, value: data);
        } on StorageError catch (e) {
          final sa = await so.onWriteError(e, this, action);
          if (sa == StorageWriteErrorAction.ignore) {
            _setStoreDepsForPState(previousState, null);
            _setStoreDepsForPState(newState, this);
            _state = _state.copyWithMap(newGlobalStateMap);
            if (action.afterComplete != null) {
              action.afterComplete!(newState);
            }
          }
        } catch (e) {
          rethrow;
        }
      } else {
        _state = _state.copyWithMap(newGlobalStateMap);
        try {
          final dynamic data = psm.sm!.serializer(newState);
          await storage!.set(key: psm.type, value: data);
        } on StorageError catch (e) {
          final sa = await so.onWriteError(e, this, action);
          if (sa == StorageWriteErrorAction.revert_state_changes) {
            newState = previousState;
            previousState = newState;
            newGlobalStateMap[stateKey] = newState;
            _setStoreDepsForPState(previousState, null);
            _setStoreDepsForPState(newState, this);
            _state = _state.copyWithMap(newGlobalStateMap);
          }
        } catch (e) {
          rethrow;
        }
        if (action.afterComplete != null) {
          action.afterComplete!(newState);
        }
      }
    } else {
      _setStoreDepsForPState(previousState, null);
      _setStoreDepsForPState(newState, this);
      _state = _state.copyWithMap(newGlobalStateMap);
      if (action.afterComplete != null) {
        action.afterComplete!(newState);
      }
    }
  }

  void _notifyListeners(
      {required String stateKey,
      required PStateModel<dynamic> previousState,
      required PStateModel<dynamic> currentState}) {
    final ls = selectorListeners[stateKey];
    final psMap = previousState.toMap();
    final csMap = currentState.toMap();
    if (ls != null) {
      ls.forEach((sl) {
        if (_isSelectorDependenciesChanged(
            selector: sl.selector as Selector<S, dynamic>,
            prevState: psMap,
            currentState: csMap,
            stateKey: stateKey)) {
          sl.listener();
        }
      });
    }
  }

  bool _isSelectorDependenciesChanged(
      {required Selector<S, dynamic> selector,
      required Map<String, dynamic> prevState,
      required Map<String, dynamic> currentState,
      required String stateKey}) {
    var result = false;
    final deps = selector.deps[stateKey];
    if (deps != null) {
      if (deps.isEmpty) {
        result = true;
      } else {
        for (final prop in deps) {
          if (!useEqualsComparision &&
              !identical(prevState[prop], currentState[prop])) {
            result = true;
            break;
          } else if (useEqualsComparision &&
              prevState[prop] != currentState[prop]) {
            result = true;
            break;
          }
        }
      }
    }
    return result;
  }

  List<String> _getAllPropertyNamesOfStateKey(String sk) {
    final s = internalMeta[sk]!;
    return s.ds().toMap().keys.toList();
  }

  void _handleUnsubscribe(
      Selector<S, dynamic> selector, UnSubscribeOptions? options) async {
    final process = selector.wsDeps != null ||
        selector.sfDeps != null ||
        (options != null && options.resetToDefault == true);
    if (process) {
      final sMap = _state.toMap();
      dynamic _getFieldFromStateKey(String stateKey, String prop) {
        final currentS = sMap[stateKey]!;
        return currentS.toMap()[prop];
      }

      Map<String, dynamic> _unsubscribeWsDeps(
          String stateKey, List<String> deps) {
        final result = <String, dynamic>{};
        deps.forEach((prop) {
          final field = _getFieldFromStateKey(stateKey, prop) as WebSocketField;
          field.internalUnsubscribe?.call();
          result[prop] = field.copyWith(internalUnsubscribe: null);
        });
        return result;
      }

      Map<String, dynamic> _unsubscribeSFDeps(
          String stateKey, List<String> deps) {
        final result = <String, dynamic>{};
        deps.forEach((prop) {
          final field = _getFieldFromStateKey(stateKey, prop) as StreamField;
          field.internalSubscription?.cancel();
          result[prop] = field.copyWith(internalSubscription: null);
        });
        return result;
      }

      Future<void> _updatePersitance(
          Iterable<String> keys, List<Callback>? listenrsToFire) async {
        if (storageOptions != null) {
          final so = storageOptions!;
          //TODO handle reveret back if store fails or inform user
          final result = <String, dynamic>{};
          keys.forEach((sk) {
            final psMeta = internalMeta[sk]!;
            if (psMeta.sm != null) {
              // this key is persitable
              final value = sMap[sk]!;
              result[sk] = psMeta.sm!.serializer(value);
            }
          });
          if (result.isNotEmpty) {
            try {
              await storageOptions!.storage.setAll(result);
            } on StorageError catch (e) {
              final sa = await so.onWriteError(e, this,
                  Action<dynamic>(name: "unsubscribe", type: "GeneralStore"));
            } catch (e) {
              rethrow;
            }
          }
        }
      }

      final keysToReset = <String>[];
      final propsOfKeysToReset = <String, List<String>>{};
      final websocketPropsOfKeysToUnsubscribe = <String, List<String>>{};
      final streamPropsOfKeysToUnsubscribe = <String, List<String>>{};
      final stateKeysModified = <String>[];
      selector.deps.forEach((sk, values) {
        final slsa = selectorListeners[sk];
        final webSocketValues = selector.wsDeps?.getOrElse(sk, []) ?? [];
        final streamValues = selector.sfDeps?.getOrElse(sk, []) ?? [];
        if (slsa != null) {
          final existingStateKeyProps = <String>{};
          slsa.where((element) => element.selector != selector).forEach((sls) {
            existingStateKeyProps.addAll(sls.selector.deps[sk]!);
          });
          propsOfKeysToReset[sk] = [];

          websocketPropsOfKeysToUnsubscribe[sk] = [];
          streamPropsOfKeysToUnsubscribe[sk] = [];
          if (values.isEmpty) {
            // depnds on all fields
            values = _getAllPropertyNamesOfStateKey(sk);
          }
          values.forEach((skp) {
            if (!existingStateKeyProps.contains(skp)) {
              propsOfKeysToReset[sk]!.add(skp);
              if (webSocketValues.contains(skp)) {
                websocketPropsOfKeysToUnsubscribe[sk]!.add(skp);
              }
              if (streamValues.contains(skp)) {
                streamPropsOfKeysToUnsubscribe[sk]!.add(skp);
              }
            }
          });
          if (propsOfKeysToReset[sk]!.isNotEmpty) {
            stateKeysModified.add(sk);
          }
        } else {
          // no listeners
          keysToReset.add(sk);
          stateKeysModified.add(sk);
          websocketPropsOfKeysToUnsubscribe[sk] = webSocketValues;
          streamPropsOfKeysToUnsubscribe[sk] = streamValues;
        }

        if (options?.resetToDefault == true) {
          // reset close websocket abd stream connections
          keysToReset.forEach((sk) {
            final wsDeps = websocketPropsOfKeysToUnsubscribe[sk]!;
            _unsubscribeWsDeps(sk, wsDeps);
            final sfDeps = streamPropsOfKeysToUnsubscribe[sk]!;
            _unsubscribeSFDeps(sk, sfDeps);
            sMap[sk] = internalMeta[sk]!.ds();
          });
          propsOfKeysToReset.forEach((sk, props) {
            if (props.isNotEmpty) {
              final wsDeps = websocketPropsOfKeysToUnsubscribe[sk]!;
              _unsubscribeWsDeps(sk, wsDeps);
              final sfDeps = streamPropsOfKeysToUnsubscribe[sk]!;
              _unsubscribeSFDeps(sk, sfDeps);
              final rm = sMap[sk]!;
              final rmMap = rm.toMap();
              final rmDSMap = internalMeta[sk]!.ds().toMap();
              props.forEach((prop) {
                rmMap[prop] = rmDSMap[prop];
              });
              sMap[sk] = rm.copyWithMap(rmMap) as PStateModel;
            }
          });
        } else {
          // close websocket and stream subscriptions
          final wsFieldsMapForStateKey = <String, Map<String, dynamic>>{};
          final streamFieldsMapForStateKey = <String, Map<String, dynamic>>{};
          keysToReset.forEach((sk) {
            final wsDeps = websocketPropsOfKeysToUnsubscribe[sk]!;
            wsFieldsMapForStateKey[sk] = _unsubscribeWsDeps(sk, wsDeps);
            final sfDeps = streamPropsOfKeysToUnsubscribe[sk]!;
            streamFieldsMapForStateKey[sk] = _unsubscribeSFDeps(sk, sfDeps);
          });
          propsOfKeysToReset.forEach((sk, props) {
            if (props.isNotEmpty) {
              final wsDeps = websocketPropsOfKeysToUnsubscribe[sk]!;
              wsFieldsMapForStateKey[sk] = _unsubscribeWsDeps(sk, wsDeps);
              final sfDeps = streamPropsOfKeysToUnsubscribe[sk]!;
              streamFieldsMapForStateKey[sk] = _unsubscribeSFDeps(sk, sfDeps);
            }
          });
          selector.deps.keys.forEach((sk) {
            final newMap = <String, dynamic>{
              ...wsFieldsMapForStateKey.getOrElse(sk, <String, dynamic>{}),
              ...streamFieldsMapForStateKey.getOrElse(sk, <String, dynamic>{})
            };
            final ps = sMap[sk]!;
            sMap[sk] = ps.copyWithMap(newMap) as PStateModel;
          });
        }
      });
      // if persitance is enabled and following state keys are persitable then update values
      await _updatePersitance(stateKeysModified, []);
      _state = _state.copyWithMap(sMap);
    }
  }

  /* public methods  */

  void internalAddMock(Action action) {
    if (action.mock == null) {
      throw ArgumentError.value(
          "mock action should contain mock field not null");
    }
    internalMocksMap[action.id] = action;
  }

  void internalRemoveMock(Action action) {
    internalMocksMap.remove(action.id);
  }

  String getStateKeyForPstateType(String psType) {
    final sk = _pStateTypeToStateKeyMap[psType];
    if (sk == null) {
      throw ArgumentError.value(
          "You already selected same PState before with key ${psType}  ");
    }
    return sk;
  }

  PStateModel<dynamic> getPStateModelFromAction(Action<dynamic> action) {
    return getPStateModelFromPSType(action.type);
  }

  PStateModel<dynamic> getPStateModelFromPSType(String psType) {
    final sk = getStateKeyForPstateType(psType);
    final gsMap = state.toMap();
    return gsMap[sk]!;
  }

  PStateModel<dynamic> getDefaultStateForAcion(Action<dynamic> action) {
    final psm = getPStateMetaFromAction(action);
    return psm.ds();
  }

  dynamic getFieldFromAction(Action<dynamic> action) {
    final currentS = getPStateModelFromAction(action);
    return currentS.toMap()[action.name];
  }

  PStateMeta getPStateMetaFromAction(Action<dynamic> action) {
    final sk = getStateKeyForPstateType(action.type);
    return internalMeta[sk]!;
  }

  dynamic dispatch(Action<dynamic> action) {
    print("Dispatching Action $action");
    print("dispatchers length ${_dispatchers.length}");
    _dispatchers[0](action);
  }

  SelectorUnSubscribeFn subscribeSelector(
      Selector<S, dynamic> selector, Callback listener) {
    final keys = selector.deps.keys;
    keys.forEach((sk) {
      final sls = selectorListeners[sk];
      final v = _SelectorListener(selector: selector, listener: listener);
      print("sls $sls");
      if (sls != null) {
        if (!sls.contains(v)) {
          sls.add(v);
        }
      } else {
        print("selector added $sk");
        selectorListeners[sk] = [v];
      }
    });
    var isSubscribed = true;
    return ([UnSubscribeOptions? options]) {
      if (!isSubscribed) {
        return;
      }
      keys.forEach((sk) {
        final sla = selectorListeners[sk]!;
        final index = sla.indexWhere(
            (sl) => sl.selector == selector && sl.listener == listener);
        if (index >= 0) {
          sla.removeAt(index);
        }
      });
      _handleUnsubscribe(selector, options);
      isSubscribed = false;
    };
  }

  void cleanup() {
    _unsubscribeNetworkStatusListener?.call();
    _state.toMap().forEach((key, value) {
      _setStoreDepsForPState(value, null);
    });
  }
}

// enum ResetToDefault { FORCE, IF_NOT_USED_BY_OTHER_WIDGETS }

class UnSubscribeOptions {
  final bool resetToDefault;

  UnSubscribeOptions({this.resetToDefault = false});
}

class _SelectorListener {
  final Selector<dynamic, dynamic> selector;
  final Callback listener;
  _SelectorListener({
    required this.selector,
    required this.listener,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is _SelectorListener &&
        other.selector == selector &&
        other.listener == listener;
  }

  @override
  int get hashCode => selector.hashCode ^ listener.hashCode;
}

@optionalTypeArgs
abstract class AppStateI<S> {
  S copyWithMap(Map<String, dynamic> map);
  Map<String, PStateModel<dynamic>> toMap();
}
