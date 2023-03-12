// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tabs_nav.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

class TabsNestedStack extends NestedNavStateI<TabsNestedStack>
    with PStateStoreDepsMixin, NavCommonI {
  final Page? page;

  final BeforeLeaveFn? beforeLeave;

  final NavConfigMeta meta;

  final NavOptions? navOptions;

  @override
  void initialSetup() {
    throw UnimplementedError(
        "This method stubbed out as action TabsNestedStackActions.initialSetup() , use that action instead");
  }

  @override
  List<NestedNavStateMeta> getNestedNavs() {
    NestedNavStateMeta getMeta(String psType, String url, Action action) {
      final state =
          dontTouchMeStore.getPStateModelFromPSType(psType) as NestedNavStateI;
      state.dontTouchMe.rootUrl = url;
      return NestedNavStateMeta(state: state, rootAction: action);
    }

    return [
      getMeta('/store/pstates/nav/tabs_nav/TabsNestedStack_Nested', '/tab2',
          TabsNestedStackActions.tab2())
    ];
  }

  _$TabsNestedStackCopyWith<TabsNestedStack> get copyWith =>
      __$TabsNestedStackCopyWithImpl<TabsNestedStack>(this, IdentityFn);

  TabsNestedStack(
      {this.page, this.beforeLeave, NavConfigMeta? meta, this.navOptions})
      : meta = meta ?? NavConfigMeta();

  @override
  TabsNestedStack copyWithMap(Map<String, dynamic> map) => TabsNestedStack(
      page: map.containsKey("page") ? map["page"] as Page? : this.page,
      beforeLeave: map.containsKey("beforeLeave")
          ? map["beforeLeave"] as BeforeLeaveFn?
          : this.beforeLeave,
      meta: map.containsKey("meta") ? map["meta"] as NavConfigMeta : this.meta,
      navOptions: map.containsKey("navOptions")
          ? map["navOptions"] as NavOptions?
          : this.navOptions);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "page": this.page,
        "beforeLeave": this.beforeLeave,
        "meta": this.meta,
        "navOptions": this.navOptions
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is TabsNestedStack &&
        o.page == page &&
        o.beforeLeave == beforeLeave &&
        o.meta == meta &&
        o.navOptions == navOptions;
  }

  @override
  int get hashCode => Object.hash(page, beforeLeave, meta, navOptions);

  @override
  String toString() =>
      "TabsNestedStack(page: ${this.page}, beforeLeave: ${this.beforeLeave}, meta: ${this.meta}, navOptions: ${this.navOptions})";
}

abstract class $TabsNestedStackCopyWith<O> {
  factory $TabsNestedStackCopyWith(
          TabsNestedStack value, O Function(TabsNestedStack) then) =
      _$TabsNestedStackCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions});
}

class _$TabsNestedStackCopyWithImpl<O> implements $TabsNestedStackCopyWith<O> {
  final TabsNestedStack _value;
  final O Function(TabsNestedStack) _then;
  _$TabsNestedStackCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable}) {
    return _then(_value.copyWith(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?));
  }
}

abstract class _$TabsNestedStackCopyWith<O>
    implements $TabsNestedStackCopyWith<O> {
  factory _$TabsNestedStackCopyWith(
          TabsNestedStack value, O Function(TabsNestedStack) then) =
      __$TabsNestedStackCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions});
}

class __$TabsNestedStackCopyWithImpl<O> extends _$TabsNestedStackCopyWithImpl<O>
    implements _$TabsNestedStackCopyWith<O> {
  __$TabsNestedStackCopyWithImpl(
      TabsNestedStack _value, O Function(TabsNestedStack) _then)
      : super(_value, (v) => _then(v));

  @override
  TabsNestedStack get _value => super._value;

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable}) {
    return _then(TabsNestedStack(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?));
  }
}

const _TabsNestedStack_FullPath = "/store/pstates/nav/tabs_nav/TabsNestedStack";
dynamic TabsNestedStack_SyncReducer(
    dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as TabsNestedStack;
  final name = _DstoreAction.name;
  switch (name) {
    case "tab2":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        _DStore_page = MaterialPage<dynamic>(
            child: NestedRouter(selector: AppSelectors.tabsNested_nested));
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/tab2';

        return newState;
      }

    case "tab3":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        _DStore_page = MaterialPage<dynamic>(child: Tab3());
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/tab3';

        return newState;
      }

    case "initialSetup":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        _DStore_page = MaterialPage<dynamic>(child: Tab1());
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = null;

        return newState;
      }

    default:
      {
        return _DStoreState;
      }
  }
}

TabsNestedStack TabsNestedStack_DS() {
  final state = TabsNestedStack(
      page: null, beforeLeave: null, meta: NavConfigMeta(), navOptions: null);

  state.dontTouchMe.staticMeta = {
    '/tab2': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(TabsNestedStackActions.tab2());
        },
        url: '/tab2',
        isProtected: false),
    '/tab3': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(TabsNestedStackActions.tab3());
        },
        url: '/tab3',
        isProtected: false)
  };
  state.dontTouchMe.dynamicMeta = {};
  state.dontTouchMe.typeName = '/store/pstates/nav/tabs_nav/TabsNestedStack';
  state.dontTouchMe.initialSetup =
      TabsNestedStackActions.initialSetup(silent: true);
  state.dontTouchMe.historyMode = HistoryMode.tabs;

  return state;
}

final TabsNestedStackMeta = PStateMeta<TabsNestedStack>(
    type: _TabsNestedStack_FullPath,
    reducer: TabsNestedStack_SyncReducer,
    ds: TabsNestedStack_DS);

abstract class TabsNestedStackActions {
  static Action<dynamic> tab2({bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "tab2",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions,
            rawUrl: '/tab2',
            nestedNavTypeName:
                '/store/pstates/nav/tabs_nav/TabsNestedStack_Nested',
            isProtected: false),
        type: _TabsNestedStack_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> tab3({bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "tab3",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions, rawUrl: '/tab3', isProtected: false),
        type: _TabsNestedStack_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> initialSetup(
      {bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "initialSetup",
        silent: silent,
        nav: NavPayload(navOptions: navOptions, isProtected: false),
        type: _TabsNestedStack_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }
}

class TabsNestedStack_Nested extends NestedNavStateI<TabsNestedStack_Nested>
    with PStateStoreDepsMixin, NavCommonI {
  final Page? page;

  final BeforeLeaveFn? beforeLeave;

  final NavConfigMeta meta;

  final NavOptions? navOptions;

  final String? tItem;

  @override
  void initialSetup() {
    throw UnimplementedError(
        "This method stubbed out as action TabsNestedStack_NestedActions.initialSetup() , use that action instead");
  }

  @override
  List<Page> buildPages() {
    return [
      MaterialPage<dynamic>(child: Tab2StackHome()),
      if (tItem != null) MaterialPage<dynamic>(child: Tab2StackItemDetails())
    ];
  }

  _$TabsNestedStack_NestedCopyWith<TabsNestedStack_Nested> get copyWith =>
      __$TabsNestedStack_NestedCopyWithImpl<TabsNestedStack_Nested>(
          this, IdentityFn);

  TabsNestedStack_Nested(
      {this.page,
      this.beforeLeave,
      NavConfigMeta? meta,
      this.navOptions,
      this.tItem})
      : meta = meta ?? NavConfigMeta();

  @override
  TabsNestedStack_Nested copyWithMap(
          Map<String, dynamic> map) =>
      TabsNestedStack_Nested(
          page: map.containsKey("page") ? map["page"] as Page? : this.page,
          beforeLeave:
              map.containsKey("beforeLeave")
                  ? map["beforeLeave"] as BeforeLeaveFn?
                  : this.beforeLeave,
          meta: map.containsKey("meta")
              ? map["meta"] as NavConfigMeta
              : this.meta,
          navOptions: map.containsKey("navOptions")
              ? map["navOptions"] as NavOptions?
              : this.navOptions,
          tItem:
              map.containsKey("tItem") ? map["tItem"] as String? : this.tItem);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "page": this.page,
        "beforeLeave": this.beforeLeave,
        "meta": this.meta,
        "navOptions": this.navOptions,
        "tItem": this.tItem
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is TabsNestedStack_Nested &&
        o.page == page &&
        o.beforeLeave == beforeLeave &&
        o.meta == meta &&
        o.navOptions == navOptions &&
        o.tItem == tItem;
  }

  @override
  int get hashCode => Object.hash(page, beforeLeave, meta, navOptions, tItem);

  @override
  String toString() =>
      "TabsNestedStack_Nested(page: ${this.page}, beforeLeave: ${this.beforeLeave}, meta: ${this.meta}, navOptions: ${this.navOptions}, tItem: ${this.tItem})";
}

abstract class $TabsNestedStack_NestedCopyWith<O> {
  factory $TabsNestedStack_NestedCopyWith(TabsNestedStack_Nested value,
          O Function(TabsNestedStack_Nested) then) =
      _$TabsNestedStack_NestedCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions,
      String? tItem});
}

class _$TabsNestedStack_NestedCopyWithImpl<O>
    implements $TabsNestedStack_NestedCopyWith<O> {
  final TabsNestedStack_Nested _value;
  final O Function(TabsNestedStack_Nested) _then;
  _$TabsNestedStack_NestedCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable,
      Object? tItem = dimmutable}) {
    return _then(_value.copyWith(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?,
        tItem: tItem == dimmutable ? _value.tItem : tItem as String?));
  }
}

abstract class _$TabsNestedStack_NestedCopyWith<O>
    implements $TabsNestedStack_NestedCopyWith<O> {
  factory _$TabsNestedStack_NestedCopyWith(TabsNestedStack_Nested value,
          O Function(TabsNestedStack_Nested) then) =
      __$TabsNestedStack_NestedCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions,
      String? tItem});
}

class __$TabsNestedStack_NestedCopyWithImpl<O>
    extends _$TabsNestedStack_NestedCopyWithImpl<O>
    implements _$TabsNestedStack_NestedCopyWith<O> {
  __$TabsNestedStack_NestedCopyWithImpl(
      TabsNestedStack_Nested _value, O Function(TabsNestedStack_Nested) _then)
      : super(_value, (v) => _then(v));

  @override
  TabsNestedStack_Nested get _value => super._value;

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable,
      Object? tItem = dimmutable}) {
    return _then(TabsNestedStack_Nested(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?,
        tItem: tItem == dimmutable ? _value.tItem : tItem as String?));
  }
}

const _TabsNestedStack_Nested_FullPath =
    "/store/pstates/nav/tabs_nav/TabsNestedStack_Nested";
dynamic TabsNestedStack_Nested_SyncReducer(
    dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as TabsNestedStack_Nested;
  final name = _DstoreAction.name;
  switch (name) {
    case "initialSetup":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_tItem = _DStoreState.tItem;
        _DStore_tItem = null;
        var newState =
            _DStoreState.copyWith(tItem: _DStore_tItem, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = null;

        return newState;
      }

    case "tabItemDetails":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final id = _DstoreActionPayload["id"] as String;

        var _DStore_tItem = _DStoreState.tItem;
        _DStore_tItem = id;
        var newState =
            _DStoreState.copyWith(tItem: _DStore_tItem, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/tab2/$id';

        return newState;
      }

    default:
      {
        return _DStoreState;
      }
  }
}

TabsNestedStack_Nested TabsNestedStack_Nested_DS() {
  final state = TabsNestedStack_Nested(
      page: null,
      beforeLeave: null,
      meta: NavConfigMeta(),
      navOptions: null,
      tItem: null);

  state.dontTouchMe.staticMeta = {};
  state.dontTouchMe.dynamicMeta = {
    '/tab2/:id': NavUrlMeta(
        url: '/tab2/:id',
        urlToAction: (Uri uri, Dispatch dispatch) {
          final path = uri.path;
          final parameters = <String>[];
          final regExp = pathToRegExp('/tab2/:id', parameters: parameters);
          final match = regExp.matchAsPrefix(path);
          final params = extract(parameters, match!);
          return dispatch(
              TabsNestedStack_NestedActions.tabItemDetails(id: params['id']!));
        },
        isProtected: false)
  };
  state.dontTouchMe.typeName =
      '/store/pstates/nav/tabs_nav/TabsNestedStack_Nested';
  state.dontTouchMe.initialSetup =
      TabsNestedStack_NestedActions.initialSetup(silent: true);
  state.dontTouchMe.historyMode = HistoryMode.stack;

  return state;
}

final TabsNestedStack_NestedMeta = PStateMeta<TabsNestedStack_Nested>(
    type: _TabsNestedStack_Nested_FullPath,
    reducer: TabsNestedStack_Nested_SyncReducer,
    ds: TabsNestedStack_Nested_DS);

abstract class TabsNestedStack_NestedActions {
  static Action<dynamic> initialSetup(
      {bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "initialSetup",
        silent: silent,
        nav: NavPayload(navOptions: navOptions, isProtected: false),
        type: _TabsNestedStack_Nested_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> tabItemDetails(
      {required String id, bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "tabItemDetails",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions, rawUrl: '/tab2/:id', isProtected: false),
        type: _TabsNestedStack_Nested_FullPath,
        payload: <String, dynamic>{"id": id},
        isAsync: false);
  }
}
