// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_state.dart';

// **************************************************************************
// AppStateGenerator
// **************************************************************************

class AppState implements AppStateI<AppState> {
  late final Auth auth;
  late final LoginScreenState loginScreen;
  late final SnackState snack;
  @override
  AppState copyWithMap(Map<String, dynamic> map) => AppState()
    ..auth = map.containsKey('auth') ? map['auth'] as Auth : this.auth
    ..loginScreen = map.containsKey('loginScreen')
        ? map['loginScreen'] as LoginScreenState
        : this.loginScreen
    ..snack =
        map.containsKey('snack') ? map['snack'] as SnackState : this.snack;
  @override
  Map<String, PStateModel<dynamic>> toMap() => <String, PStateModel<dynamic>>{
        "auth": this.auth,
        "loginScreen": this.loginScreen,
        "snack": this.snack
      };
}

Store<AppState> createStore(
    {required StoreErrorHandle handleError,
    List<Middleware<AppState>>? middlewares,
    StorageOptions<dynamic>? storageOptions,
    NetworkOptions? networkOptions,
    bool useEqualsComparision = false}) {
  return Store<AppState>(
      internalMeta: <String, PStateMeta>{
        "auth": AuthMeta,
        "loginScreen": LoginScreenStateMeta,
        "snack": SnackStateMeta
      },
      stateCreator: () => AppState(),
      appVersion: '1.0.0+1',
      networkOptions: networkOptions,
      middlewares: middlewares,
      handleError: handleError,
      storageOptions: storageOptions,
      useEqualsComparision: useEqualsComparision);
}
