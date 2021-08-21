// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

class NavState extends NavStateI<NavState> with PStateStoreDepsMixin {
  final Page? page;

  final BeforeLeaveFn? beforeLeave;

  final NavConfigMeta meta;

  final bool blockSameUrl;

  final String id;

  @override
  List<Page> buildPages() {
    return [];
  }

  @override
  Action fallBackNestedStackNonInitializationAction(NavStateI navState) {
    throw UnimplementedError();
  }

  @override
  Action notFoundAction(Uri uri) {
    throw UnimplementedError();
  }

  _$NavStateCopyWith<NavState> get copyWith =>
      __$NavStateCopyWithImpl<NavState>(this, IdentityFn);

  NavState(
      {this.page,
      this.beforeLeave,
      NavConfigMeta? meta,
      this.blockSameUrl = false,
      this.id = ""})
      : meta = meta ?? NavConfigMeta();

  @override
  NavState copyWithMap(Map<String, dynamic> map) => NavState(
      page: map.containsKey("page") ? map["page"] as Page? : this.page,
      beforeLeave: map.containsKey("beforeLeave")
          ? map["beforeLeave"] as BeforeLeaveFn?
          : this.beforeLeave,
      meta: map.containsKey("meta") ? map["meta"] as NavConfigMeta : this.meta,
      blockSameUrl: map.containsKey("blockSameUrl")
          ? map["blockSameUrl"] as bool
          : this.blockSameUrl,
      id: map.containsKey("id") ? map["id"] as String : this.id);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "page": this.page,
        "beforeLeave": this.beforeLeave,
        "meta": this.meta,
        "blockSameUrl": this.blockSameUrl,
        "id": this.id
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is NavState &&
        o.page == page &&
        o.beforeLeave == beforeLeave &&
        o.meta == meta &&
        o.blockSameUrl == blockSameUrl &&
        o.id == id;
  }

  @override
  int get hashCode =>
      page.hashCode ^
      beforeLeave.hashCode ^
      meta.hashCode ^
      blockSameUrl.hashCode ^
      id.hashCode;

  @override
  String toString() =>
      "NavState(page: ${this.page}, beforeLeave: ${this.beforeLeave}, meta: ${this.meta}, blockSameUrl: ${this.blockSameUrl}, id: ${this.id})";
}

abstract class $NavStateCopyWith<O> {
  factory $NavStateCopyWith(NavState value, O Function(NavState) then) =
      _$NavStateCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      bool blockSameUrl,
      String id});
}

class _$NavStateCopyWithImpl<O> implements $NavStateCopyWith<O> {
  final NavState _value;
  final O Function(NavState) _then;
  _$NavStateCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? blockSameUrl = dimmutable,
      Object? id = dimmutable}) {
    return _then(_value.copyWith(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        blockSameUrl: blockSameUrl == dimmutable
            ? _value.blockSameUrl
            : blockSameUrl as bool,
        id: id == dimmutable ? _value.id : id as String));
  }
}

abstract class _$NavStateCopyWith<O> implements $NavStateCopyWith<O> {
  factory _$NavStateCopyWith(NavState value, O Function(NavState) then) =
      __$NavStateCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      bool blockSameUrl,
      String id});
}

class __$NavStateCopyWithImpl<O> extends _$NavStateCopyWithImpl<O>
    implements _$NavStateCopyWith<O> {
  __$NavStateCopyWithImpl(NavState _value, O Function(NavState) _then)
      : super(_value, (v) => _then(v));

  @override
  NavState get _value => super._value;

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? blockSameUrl = dimmutable,
      Object? id = dimmutable}) {
    return _then(NavState(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        blockSameUrl: blockSameUrl == dimmutable
            ? _value.blockSameUrl
            : blockSameUrl as bool,
        id: id == dimmutable ? _value.id : id as String));
  }
}

const _NavState_FullPath = "/store/pstates/nav/NavState";
dynamic NavState_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as NavState;
  final name = _DstoreAction.name;
  switch (name) {
    case "home":
      {
        var _DStore_id = _DStoreState.id;
        _DStore_id = "1";
        final newState =
            _DStoreState.copyWith(id: _DStore_id, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/';

        return newState;
      }

    default:
      {
        return _DStoreState;
      }
  }
}

NavState NavState_DS() {
  final state = NavState(
      page: null,
      beforeLeave: null,
      meta: NavConfigMeta(),
      blockSameUrl: false,
      id: "");

  state.dontTouchMe.staticMeta = {
    '/': (Uri uri, Dispatch dispatch) {
      return dispatch(NavStateActions.home());
    }
  };
  state.dontTouchMe.dynamicMeta = {};
  state.dontTouchMe.typeName = '';
  state.dontTouchMe.initialSetup = null;
  state.dontTouchMe.historyMode = HistoryMode.stack;

  return state;
}

final NavStateMeta = PStateMeta<NavState>(
    type: _NavState_FullPath, reducer: NavState_SyncReducer, ds: NavState_DS);

abstract class NavStateActions {
  static Action home({bool silent = false}) {
    return Action(
        name: "home",
        silent: silent,
        nav: NavPayload(rawUrl: '/'),
        type: _NavState_FullPath,
        isAsync: false);
  }
}
