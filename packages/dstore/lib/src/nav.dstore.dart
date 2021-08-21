// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'nav.dart';

// **************************************************************************
// DImmutableGenerator
// **************************************************************************

class NavPayload {
  final String? rawUrl;

  final String? nestedNavTypeName;

  final dynamic navOptions;

  final bool processedNested;

  final bool isProtected;

  _$NavPayloadCopyWith<NavPayload> get copyWith =>
      __$NavPayloadCopyWithImpl<NavPayload>(this, IdentityFn);

  const NavPayload(
      {this.rawUrl,
      this.nestedNavTypeName,
      required this.navOptions,
      this.processedNested = false,
      this.isProtected = false});

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is NavPayload &&
        o.rawUrl == rawUrl &&
        o.nestedNavTypeName == nestedNavTypeName &&
        o.navOptions == navOptions &&
        o.processedNested == processedNested &&
        o.isProtected == isProtected;
  }

  @override
  int get hashCode =>
      rawUrl.hashCode ^
      nestedNavTypeName.hashCode ^
      navOptions.hashCode ^
      processedNested.hashCode ^
      isProtected.hashCode;

  @override
  String toString() =>
      "NavPayload(rawUrl: ${this.rawUrl}, nestedNavTypeName: ${this.nestedNavTypeName}, navOptions: ${this.navOptions}, processedNested: ${this.processedNested}, isProtected: ${this.isProtected})";
}

abstract class $NavPayloadCopyWith<O> {
  factory $NavPayloadCopyWith(NavPayload value, O Function(NavPayload) then) =
      _$NavPayloadCopyWithImpl<O>;
  O call(
      {String? rawUrl,
      String? nestedNavTypeName,
      dynamic navOptions,
      bool processedNested,
      bool isProtected});
}

class _$NavPayloadCopyWithImpl<O> implements $NavPayloadCopyWith<O> {
  final NavPayload _value;
  final O Function(NavPayload) _then;
  _$NavPayloadCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? rawUrl = dimmutable,
      Object? nestedNavTypeName = dimmutable,
      Object? navOptions = dimmutable,
      Object? processedNested = dimmutable,
      Object? isProtected = dimmutable}) {
    return _then(_value.copyWith(
        rawUrl: rawUrl == dimmutable ? _value.rawUrl : rawUrl as String?,
        nestedNavTypeName: nestedNavTypeName == dimmutable
            ? _value.nestedNavTypeName
            : nestedNavTypeName as String?,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as dynamic,
        processedNested: processedNested == dimmutable
            ? _value.processedNested
            : processedNested as bool,
        isProtected: isProtected == dimmutable
            ? _value.isProtected
            : isProtected as bool));
  }
}

abstract class _$NavPayloadCopyWith<O> implements $NavPayloadCopyWith<O> {
  factory _$NavPayloadCopyWith(NavPayload value, O Function(NavPayload) then) =
      __$NavPayloadCopyWithImpl<O>;
  O call(
      {String? rawUrl,
      String? nestedNavTypeName,
      dynamic navOptions,
      bool processedNested,
      bool isProtected});
}

class __$NavPayloadCopyWithImpl<O> extends _$NavPayloadCopyWithImpl<O>
    implements _$NavPayloadCopyWith<O> {
  __$NavPayloadCopyWithImpl(NavPayload _value, O Function(NavPayload) _then)
      : super(_value, (v) => _then(v));

  @override
  NavPayload get _value => super._value;

  @override
  O call(
      {Object? rawUrl = dimmutable,
      Object? nestedNavTypeName = dimmutable,
      Object? navOptions = dimmutable,
      Object? processedNested = dimmutable,
      Object? isProtected = dimmutable}) {
    return _then(NavPayload(
        rawUrl: rawUrl == dimmutable ? _value.rawUrl : rawUrl as String?,
        nestedNavTypeName: nestedNavTypeName == dimmutable
            ? _value.nestedNavTypeName
            : nestedNavTypeName as String?,
        navOptions: navOptions == dimmutable
            ? _value.navOptions
            : navOptions as dynamic,
        processedNested: processedNested == dimmutable
            ? _value.processedNested
            : processedNested as bool,
        isProtected: isProtected == dimmutable
            ? _value.isProtected
            : isProtected as bool));
  }
}
