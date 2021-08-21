// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setings_nav.dart';

// **************************************************************************
// PStateGenerator
// **************************************************************************

class SettingsNav extends NestedNavStateI<SettingsNav>
    with PStateStoreDepsMixin, NavCommonI {
  final Page? page;

  final BeforeLeaveFn? beforeLeave;

  final NavConfigMeta meta;

  final NavOptions? navOptions;

  final String? selectedSetting;

  final bool listp;

  @override
  void initialSetup() {
    throw UnimplementedError(
        "This method stubbed out as action SettingsNavActions.initialSetup() , use that action instead");
  }

  @override
  List<Page> buildPages() {
    return [
      MaterialPage<dynamic>(child: SettingsListScreen()),
      if (selectedSetting != null)
        MaterialPage<dynamic>(
            key: ValueKey("/Settings/:id"), child: SettingDetailsScreen())
    ];
  }

  _$SettingsNavCopyWith<SettingsNav> get copyWith =>
      __$SettingsNavCopyWithImpl<SettingsNav>(this, IdentityFn);

  SettingsNav(
      {this.page,
      this.beforeLeave,
      NavConfigMeta? meta,
      this.navOptions,
      this.selectedSetting,
      this.listp = false})
      : meta = meta ?? NavConfigMeta();

  @override
  SettingsNav copyWithMap(Map<String, dynamic> map) => SettingsNav(
      page: map.containsKey("page") ? map["page"] as Page? : this.page,
      beforeLeave: map.containsKey("beforeLeave")
          ? map["beforeLeave"] as BeforeLeaveFn?
          : this.beforeLeave,
      meta: map.containsKey("meta") ? map["meta"] as NavConfigMeta : this.meta,
      navOptions: map.containsKey("navOptions")
          ? map["navOptions"] as NavOptions?
          : this.navOptions,
      selectedSetting: map.containsKey("selectedSetting")
          ? map["selectedSetting"] as String?
          : this.selectedSetting,
      listp: map.containsKey("listp") ? map["listp"] as bool : this.listp);

  Map<String, dynamic> toMap() => <String, dynamic>{
        "page": this.page,
        "beforeLeave": this.beforeLeave,
        "meta": this.meta,
        "navOptions": this.navOptions,
        "selectedSetting": this.selectedSetting,
        "listp": this.listp
      };

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is SettingsNav &&
        o.page == page &&
        o.beforeLeave == beforeLeave &&
        o.meta == meta &&
        o.navOptions == navOptions &&
        o.selectedSetting == selectedSetting &&
        o.listp == listp;
  }

  @override
  int get hashCode =>
      page.hashCode ^
      beforeLeave.hashCode ^
      meta.hashCode ^
      navOptions.hashCode ^
      selectedSetting.hashCode ^
      listp.hashCode;

  @override
  String toString() =>
      "SettingsNav(page: ${this.page}, beforeLeave: ${this.beforeLeave}, meta: ${this.meta}, navOptions: ${this.navOptions}, selectedSetting: ${this.selectedSetting}, listp: ${this.listp})";
}

abstract class $SettingsNavCopyWith<O> {
  factory $SettingsNavCopyWith(
          SettingsNav value, O Function(SettingsNav) then) =
      _$SettingsNavCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions,
      String? selectedSetting,
      bool listp});
}

class _$SettingsNavCopyWithImpl<O> implements $SettingsNavCopyWith<O> {
  final SettingsNav _value;
  final O Function(SettingsNav) _then;
  _$SettingsNavCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable,
      Object? selectedSetting = dimmutable,
      Object? listp = dimmutable}) {
    return _then(_value.copyWith(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?,
        selectedSetting: selectedSetting == dimmutable
            ? _value.selectedSetting
            : selectedSetting as String?,
        listp: listp == dimmutable ? _value.listp : listp as bool));
  }
}

abstract class _$SettingsNavCopyWith<O> implements $SettingsNavCopyWith<O> {
  factory _$SettingsNavCopyWith(
          SettingsNav value, O Function(SettingsNav) then) =
      __$SettingsNavCopyWithImpl<O>;
  O call(
      {Page? page,
      BeforeLeaveFn? beforeLeave,
      NavConfigMeta meta,
      NavOptions? navOptions,
      String? selectedSetting,
      bool listp});
}

class __$SettingsNavCopyWithImpl<O> extends _$SettingsNavCopyWithImpl<O>
    implements _$SettingsNavCopyWith<O> {
  __$SettingsNavCopyWithImpl(SettingsNav _value, O Function(SettingsNav) _then)
      : super(_value, (v) => _then(v));

  @override
  SettingsNav get _value => super._value;

  @override
  O call(
      {Object? page = dimmutable,
      Object? beforeLeave = dimmutable,
      Object? meta = dimmutable,
      Object? navOptions = dimmutable,
      Object? selectedSetting = dimmutable,
      Object? listp = dimmutable}) {
    return _then(SettingsNav(
        page: page == dimmutable ? _value.page : page as Page?,
        beforeLeave: beforeLeave == dimmutable
            ? _value.beforeLeave
            : beforeLeave as BeforeLeaveFn?,
        meta: meta == dimmutable ? _value.meta : meta as NavConfigMeta,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as NavOptions?,
        selectedSetting: selectedSetting == dimmutable
            ? _value.selectedSetting
            : selectedSetting as String?,
        listp: listp == dimmutable ? _value.listp : listp as bool));
  }
}

const _SettingsNav_FullPath = "/store/pstates/nav/setings_nav/SettingsNav";
dynamic SettingsNav_SyncReducer(dynamic _DStoreState, Action _DstoreAction) {
  _DStoreState = _DStoreState as SettingsNav;
  final name = _DstoreAction.name;
  switch (name) {
    case "details":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        final id = _DstoreActionPayload["id"] as String;

        var _DStore_selectedSetting = _DStoreState.selectedSetting;
        print("Came to specific settings $id ${_DStoreState.mounted}");
        _DStore_selectedSetting = id;
        var newState = _DStoreState.copyWith(
            selectedSetting: _DStore_selectedSetting, meta: NavConfigMeta());

        newState.dontTouchMe = _DStoreState.dontTouchMe;
        newState.dontTouchMe.url = '/settings/$id';

        return newState;
      }

    case "initialSetup":
      {
        final _DstoreActionPayload = _DstoreAction.payload!;
        var _DStore_listp = _DStoreState.listp;
        var _DStore_selectedSetting = _DStoreState.selectedSetting;
        _DStore_listp = true;
        _DStore_selectedSetting = null;
        var newState = _DStoreState.copyWith(
            listp: _DStore_listp,
            selectedSetting: _DStore_selectedSetting,
            meta: NavConfigMeta());

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

SettingsNav SettingsNav_DS() {
  final state = SettingsNav(
      page: null,
      beforeLeave: null,
      meta: NavConfigMeta(),
      navOptions: null,
      selectedSetting: null,
      listp: false);

  state.dontTouchMe.staticMeta = {};
  state.dontTouchMe.dynamicMeta = {
    '/settings/:id': NavUrlMeta(
        url: '/settings/:id',
        urlToAction: (Uri uri, Dispatch dispatch) {
          final path = uri.path;
          final parameters = <String>[];
          final regExp = pathToRegExp('/settings/:id', parameters: parameters);
          final match = regExp.matchAsPrefix(path);
          final params = extract(parameters, match!);
          return dispatch(SettingsNavActions.details(id: params['id']!));
        },
        isProtected: false)
  };
  state.dontTouchMe.typeName = '/store/pstates/nav/setings_nav/SettingsNav';
  state.dontTouchMe.initialSetup =
      SettingsNavActions.initialSetup(silent: true);
  state.dontTouchMe.historyMode = HistoryMode.stack;

  return state;
}

final SettingsNavMeta = PStateMeta<SettingsNav>(
    type: _SettingsNav_FullPath,
    reducer: SettingsNav_SyncReducer,
    ds: SettingsNav_DS);

abstract class SettingsNavActions {
  static Action<dynamic> details(
      {required String id, bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "details",
        silent: silent,
        nav: NavPayload(
            navOptions: navOptions,
            rawUrl: '/settings/:id',
            isProtected: false),
        type: _SettingsNav_FullPath,
        payload: <String, dynamic>{"id": id},
        isAsync: false);
  }

  static Action<dynamic> initialSetup(
      {bool silent = false, NavOptions? navOptions}) {
    return Action<dynamic>(
        name: "initialSetup",
        silent: silent,
        nav: NavPayload(navOptions: navOptions, isProtected: false),
        type: _SettingsNav_FullPath,
        payload: <String, dynamic>{},
        isAsync: false);
  }
}
