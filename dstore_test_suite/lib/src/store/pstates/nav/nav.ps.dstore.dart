// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

class SimpleNavPS extends NavStateI<SimpleNavPS>
    with PStateStoreDepsMixin, NavCommonI {
  final Page? page;

  final BeforeLeaveFn? beforeLeave;

  final NavConfigMeta meta;

  final NavOptions? navOptions;

  @override
  Action notFoundAction(Uri uri) {
    return SimpleNavPSActions.unknown();
  }

  @override
  AuthMeta? authMeta(NavCommonI navState) {
    return null;
  }

  @override
  Action fallBackNestedStackNonInitializationAction(NavCommonI navState) {
    return SimpleNavPSActions.fallBackNestedStackNonInitializationAction2(
        navState: navState);
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
      getMeta('/store/pstates/nav/books_nav/BooksNav', '/books',
          SimpleNavPSActions.books()),
      getMeta('/store/pstates/nav/setings_nav/SettingsNav', '/settings',
          SimpleNavPSActions.settings()),
      getMeta('/store/pstates/nav/tabs_nav/TabsNestedStack', '/tab1',
          SimpleNavPSActions.tabs())
    ];
  }

  _$SimpleNavPSCopyWith<SimpleNavPS> get copyWith =>
      __$SimpleNavPSCopyWithImpl<SimpleNavPS>(this, IdentityFn);

  SimpleNavPS(
      {this.page, this.beforeLeave, NavConfigMeta? meta, this.navOptions})
      : meta = meta ?? NavConfigMeta();

  @override
  SimpleNavPS copyWithMap(Map<String, dynamic> map) => SimpleNavPS(
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
    return o is SimpleNavPS &&
        o.page == page &&
        o.beforeLeave == beforeLeave &&
        o.meta == meta &&
        o.navOptions == navOptions;
  }

  @override
  int get hashCode => Object.hash(page, beforeLeave, meta, navOptions);

  @override
  String toString() =>
      "SimpleNavPS(page: ${this.page}, beforeLeave: ${this.beforeLeave}, meta: ${this.meta}, navOptions: ${this.navOptions})";
}

abstract class $SimpleNavPSCopyWith<O> {
  factory $SimpleNavPSCopyWith(
          SimpleNavPS value, O Function(SimpleNavPS) then) =
      _$SimpleNavPSCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions});
}

class _$SimpleNavPSCopyWithImpl<O> implements $SimpleNavPSCopyWith<O> {
  final SimpleNavPS _value;
  final O Function(SimpleNavPS) _then;
  _$SimpleNavPSCopyWithImpl(this._value, this._then);

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

abstract class _$SimpleNavPSCopyWith<O> implements $SimpleNavPSCopyWith<O> {
  factory _$SimpleNavPSCopyWith(
          SimpleNavPS value, O Function(SimpleNavPS) then) =
      __$SimpleNavPSCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions});
}

class __$SimpleNavPSCopyWithImpl<O> extends _$SimpleNavPSCopyWithImpl<O>
    implements _$SimpleNavPSCopyWith<O> {
  __$SimpleNavPSCopyWithImpl(SimpleNavPS _value, O Function(SimpleNavPS) _then)
      : super(_value, (v) => _then(v));

  @override
  SimpleNavPS get _value => super._value;

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable}) {
    return _then(SimpleNavPS(
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

const _SimpleNavPS_FullPath = "/store/pstates/nav/nav/SimpleNavPS";
dynamic SimpleNavPS_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SimpleNavPS;
  final name = _DstoreAction.name;
  switch (name) {
    case "home":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        _DStore_page =
            MaterialPage<dynamic>(key: ValueKey("home"), child: HomeScreen());
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/';

        return newState;
      }

    case "books":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        print("in books pa2ge");
        _DStore_page = MaterialPage<dynamic>(
            key: ValueKey("books"),
            child: NestedRouter<AppState, BooksNav>(
                selector: AppSelectors.booksNav));
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/books';

        return newState;
      }

    case "settings":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        print("in settings page");
        _DStore_page = MaterialPage<dynamic>(
            key: ValueKey("settings"),
            child: NestedRouter(selector: AppSelectors.settingNav));
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/settings';

        return newState;
      }

    case "tabs":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        print("in tabs page");
        _DStore_page = MaterialPage<dynamic>(
            child: TabShell(
                child: NestedRouter(selector: AppSelectors.tabsNested)));
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/tab1';

        return newState;
      }

    case "unknown":
      {
        final _DstoreActionPayload = _DstoreAction.payload;
        var _DStore_page = _DStoreState.page;
        _DStore_page = MaterialPage<dynamic>(
            key: ValueKey("unknown"), child: UnknownScreen());
        var newState =
            _DStoreState.copyWith(page: _DStore_page, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/unknown';

        return newState;
      }

    case "fallBackNestedStackNonInitializationAction2":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final navState = _DstoreActionPayload["navState"] as NavStateI;
        var _DStore_meta = _DStoreState.meta;
        _DStore_meta = navState.meta;
        final newState = _DStoreState.copyWith(meta: _DStore_meta);
        newState.dontTouchMe = _DStoreState.dontTouchMe;
        return newState;
      }

    default:
      {
        return _DStoreState;
      }
  }
}

SimpleNavPS SimpleNavPS_DS() {
  final state = SimpleNavPS(
      page: null, beforeLeave: null, meta: NavConfigMeta(), navOptions: null);

  state.dontTouchMe.staticMeta = {
    '/': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(SimpleNavPSActions.home());
        },
        url: '/',
        isProtected: false),
    '/books': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(SimpleNavPSActions.books());
        },
        url: '/books',
        isProtected: false),
    '/settings': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(SimpleNavPSActions.settings());
        },
        url: '/settings',
        isProtected: false),
    '/tab1': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(SimpleNavPSActions.tabs());
        },
        url: '/tab1',
        isProtected: false),
    '/unknown': NavUrlMeta(
        urlToAction: (Uri uri, Dispatch dispatch) {
          return dispatch(SimpleNavPSActions.unknown());
        },
        url: '/unknown',
        isProtected: false)
  };
  state.dontTouchMe.dynamicMeta = {};
  state.dontTouchMe.typeName = '';
  state.dontTouchMe.initialSetup = null;
  state.dontTouchMe.historyMode = HistoryMode.tabs;

  return state;
}

final SimpleNavPSMeta = PStateMeta<SimpleNavPS>(
    type: _SimpleNavPS_FullPath,
    reducer: SimpleNavPS_SyncReducer,
    ds: SimpleNavPS_DS);

abstract class SimpleNavPSActions {
  static Action<dynamic> home({bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "home",
        silent: silent,
        nav:
            NavPayload(navOptions: navOptions, rawUrl: '/', isProtected: false),
        type: _SimpleNavPS_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> books({bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "books",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions,
            rawUrl: '/books',
            nestedNavTypeName: '/store/pstates/nav/books_nav/BooksNav',
            isProtected: false),
        type: _SimpleNavPS_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> settings(
      {bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "settings",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions,
            rawUrl: '/settings',
            nestedNavTypeName: '/store/pstates/nav/setings_nav/SettingsNav',
            isProtected: false),
        type: _SimpleNavPS_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> tabs({bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "tabs",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions,
            rawUrl: '/tab1',
            nestedNavTypeName: '/store/pstates/nav/tabs_nav/TabsNestedStack',
            isProtected: false),
        type: _SimpleNavPS_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> unknown(
      {bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "unknown",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions, rawUrl: '/unknown', isProtected: false),
        type: _SimpleNavPS_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }

  static Action<dynamic> fallBackNestedStackNonInitializationAction2(
      {required NavCommonI navState,
      bool silent = false,
      NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "fallBackNestedStackNonInitializationAction2",
        silent: silent,
        nav: NavPayload(navOptions: navOptions, isProtected: false),
        type: _SimpleNavPS_FullPath,
        payload: <String, dynamic>{"navState": navState},
        isAsync: false);
  }
}
