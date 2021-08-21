// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_state.dart';

// **************************************************************************
// AppStateGenerator
// **************************************************************************

class AppState implements AppStateI<AppState> {
  late final FormState formState;
  @override
  AppState copyWithMap(Map<String, dynamic> map) => AppState()
    ..formState = map.containsKey('formState')
        ? map['formState'] as FormState
        : this.formState;
  @override
  Map<String, PStateModel<dynamic>> toMap() =>
      <String, PStateModel<dynamic>>{"formState": this.formState};
}

Store<AppState> createStore(
    {required StoreErrorHandle handleError,
    List<Middleware<AppState>>? middlewares,
    StorageOptions? storageOptions,
    NetworkOptions? networkOptions,
    bool useEqualsComparision = false}) {
  return Store<AppState>(
      internalMeta: <String, PStateMeta>{"formState": FormStateMeta},
      stateCreator: () => AppState(),
      appVersion: '1.0.0+1',
      networkOptions: networkOptions,
      middlewares: middlewares,
      handleError: handleError,
      storageOptions: storageOptions,
      useEqualsComparision: useEqualsComparision);
}
