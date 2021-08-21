// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_ops.dart';

// **************************************************************************
// GraphqlOpsGenerator
// **************************************************************************

@JsonSerializable()
class LocalGraphqlOps_pingData {
  final String? ping;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_pingDataCopyWith<LocalGraphqlOps_pingData> get copyWith =>
      __$LocalGraphqlOps_pingDataCopyWithImpl<LocalGraphqlOps_pingData>(
          this, IdentityFn);

  const LocalGraphqlOps_pingData({required this.ping});

  factory LocalGraphqlOps_pingData.fromJson(Map<String, dynamic> json) =>
      _$LocalGraphqlOps_pingDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalGraphqlOps_pingDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_pingData && o.ping == ping;
  }

  @override
  int get hashCode => ping.hashCode;

  @override
  String toString() => "LocalGraphqlOps_pingData(ping: ${this.ping})";
}

abstract class $LocalGraphqlOps_pingDataCopyWith<O> {
  factory $LocalGraphqlOps_pingDataCopyWith(LocalGraphqlOps_pingData value,
          O Function(LocalGraphqlOps_pingData) then) =
      _$LocalGraphqlOps_pingDataCopyWithImpl<O>;
  O call({String? ping});
}

class _$LocalGraphqlOps_pingDataCopyWithImpl<O>
    implements $LocalGraphqlOps_pingDataCopyWith<O> {
  final LocalGraphqlOps_pingData _value;
  final O Function(LocalGraphqlOps_pingData) _then;
  _$LocalGraphqlOps_pingDataCopyWithImpl(this._value, this._then);

  @override
  O call({Object? ping = dimmutable}) {
    return _then(_value.copyWith(
        ping: ping == dimmutable ? _value.ping : ping as String?));
  }
}

abstract class _$LocalGraphqlOps_pingDataCopyWith<O>
    implements $LocalGraphqlOps_pingDataCopyWith<O> {
  factory _$LocalGraphqlOps_pingDataCopyWith(LocalGraphqlOps_pingData value,
          O Function(LocalGraphqlOps_pingData) then) =
      __$LocalGraphqlOps_pingDataCopyWithImpl<O>;
  O call({String? ping});
}

class __$LocalGraphqlOps_pingDataCopyWithImpl<O>
    extends _$LocalGraphqlOps_pingDataCopyWithImpl<O>
    implements _$LocalGraphqlOps_pingDataCopyWith<O> {
  __$LocalGraphqlOps_pingDataCopyWithImpl(LocalGraphqlOps_pingData _value,
      O Function(LocalGraphqlOps_pingData) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_pingData get _value => super._value;

  @override
  O call({Object? ping = dimmutable}) {
    return _then(LocalGraphqlOps_pingData(
        ping: ping == dimmutable ? _value.ping : ping as String?));
  }
}

GraphqlRequestInput<Null> LocalGraphqlOps_pingInputDeserializer(dynamic json) {
  return GraphqlRequestInput.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic> LocalGraphqlOps_pingDataSerializer(
        int status, LocalGraphqlOps_pingData resp) =>
    resp.toJson();

LocalGraphqlOps_pingData LocalGraphqlOps_pingDataDeserializer(
        int status, dynamic json) =>
    LocalGraphqlOps_pingData.fromJson(json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(query: """query LocalGraphqlOps_ping { 
 ping   
 
 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_pingDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_pingInputDeserializer,
    responseDeserializer: LocalGraphqlOps_pingDataDeserializer)
typedef LocalGraphqlOps_ping = HttpField<GraphqlRequestInput<Null>,
    LocalGraphqlOps_pingData, List<GraphqlError>>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(query: """query LocalGraphqlOps_ping { 
 ping   
 
 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_pingDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_pingInputDeserializer,
    responseDeserializer: LocalGraphqlOps_pingDataDeserializer)
typedef LocalGraphqlOps_pingT<T>
    = HttpField<GraphqlRequestInput<Null>, T, List<GraphqlError>>;

@JsonSerializable()
class LocalGraphqlOps_usersData {
  final List<LocalGraphqlOps_usersData_users?>? users;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersDataCopyWith<LocalGraphqlOps_usersData> get copyWith =>
      __$LocalGraphqlOps_usersDataCopyWithImpl<LocalGraphqlOps_usersData>(
          this, IdentityFn);

  const LocalGraphqlOps_usersData({required this.users});

  factory LocalGraphqlOps_usersData.fromJson(Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalGraphqlOps_usersDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData &&
        ListEquality<dynamic>().equals(users, o.users);
  }

  @override
  int get hashCode => users.hashCode;

  @override
  String toString() => "LocalGraphqlOps_usersData(users: ${this.users})";
}

abstract class $LocalGraphqlOps_usersDataCopyWith<O> {
  factory $LocalGraphqlOps_usersDataCopyWith(LocalGraphqlOps_usersData value,
          O Function(LocalGraphqlOps_usersData) then) =
      _$LocalGraphqlOps_usersDataCopyWithImpl<O>;
  O call({List<LocalGraphqlOps_usersData_users?>? users});
}

class _$LocalGraphqlOps_usersDataCopyWithImpl<O>
    implements $LocalGraphqlOps_usersDataCopyWith<O> {
  final LocalGraphqlOps_usersData _value;
  final O Function(LocalGraphqlOps_usersData) _then;
  _$LocalGraphqlOps_usersDataCopyWithImpl(this._value, this._then);

  @override
  O call({Object? users = dimmutable}) {
    return _then(_value.copyWith(
        users: users == dimmutable
            ? _value.users
            : users as List<LocalGraphqlOps_usersData_users?>?));
  }
}

abstract class _$LocalGraphqlOps_usersDataCopyWith<O>
    implements $LocalGraphqlOps_usersDataCopyWith<O> {
  factory _$LocalGraphqlOps_usersDataCopyWith(LocalGraphqlOps_usersData value,
          O Function(LocalGraphqlOps_usersData) then) =
      __$LocalGraphqlOps_usersDataCopyWithImpl<O>;
  O call({List<LocalGraphqlOps_usersData_users?>? users});
}

class __$LocalGraphqlOps_usersDataCopyWithImpl<O>
    extends _$LocalGraphqlOps_usersDataCopyWithImpl<O>
    implements _$LocalGraphqlOps_usersDataCopyWith<O> {
  __$LocalGraphqlOps_usersDataCopyWithImpl(LocalGraphqlOps_usersData _value,
      O Function(LocalGraphqlOps_usersData) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData get _value => super._value;

  @override
  O call({Object? users = dimmutable}) {
    return _then(LocalGraphqlOps_usersData(
        users: users == dimmutable
            ? _value.users
            : users as List<LocalGraphqlOps_usersData_users?>?));
  }
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users {
  final String name;

  final List<String?>? tags;

  @JsonKey(
      fromJson: LocalGraphqlOps_usersData_users_hello.fromJson,
      toJson: LocalGraphqlOps_usersData_users_hello.toJson)
  final LocalGraphqlOps_usersData_users_hello? hello;

  @JsonKey(
      fromJson: LocalGraphqlOps_usersData_users_helloahelloaListDeserializer,
      toJson: LocalGraphqlOps_usersData_users_helloa_helloaListSerializer)
  final List<LocalGraphqlOps_usersData_users_helloa?>? helloa;

  final LocalGraphqlOps_usersData_users_address? address;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_usersCopyWith<LocalGraphqlOps_usersData_users>
      get copyWith => __$LocalGraphqlOps_usersData_usersCopyWithImpl<
          LocalGraphqlOps_usersData_users>(this, IdentityFn);

  const LocalGraphqlOps_usersData_users(
      {required this.name,
      required this.tags,
      required this.hello,
      required this.helloa,
      required this.address});

  factory LocalGraphqlOps_usersData_users.fromJson(Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_usersFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_usersToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users &&
        o.name == name &&
        ListEquality<dynamic>().equals(tags, o.tags) &&
        o.hello == hello &&
        ListEquality<dynamic>().equals(helloa, o.helloa) &&
        o.address == address;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      tags.hashCode ^
      hello.hashCode ^
      helloa.hashCode ^
      address.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users(name: ${this.name}, tags: ${this.tags}, hello: ${this.hello}, helloa: ${this.helloa}, address: ${this.address})";
}

abstract class $LocalGraphqlOps_usersData_usersCopyWith<O> {
  factory $LocalGraphqlOps_usersData_usersCopyWith(
          LocalGraphqlOps_usersData_users value,
          O Function(LocalGraphqlOps_usersData_users) then) =
      _$LocalGraphqlOps_usersData_usersCopyWithImpl<O>;
  O call(
      {String name,
      List<String?>? tags,
      LocalGraphqlOps_usersData_users_hello? hello,
      List<LocalGraphqlOps_usersData_users_helloa?>? helloa,
      LocalGraphqlOps_usersData_users_address? address});
}

class _$LocalGraphqlOps_usersData_usersCopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_usersCopyWith<O> {
  final LocalGraphqlOps_usersData_users _value;
  final O Function(LocalGraphqlOps_usersData_users) _then;
  _$LocalGraphqlOps_usersData_usersCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? tags = dimmutable,
      Object? hello = dimmutable,
      Object? helloa = dimmutable,
      Object? address = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String,
        tags: tags == dimmutable ? _value.tags : tags as List<String?>?,
        hello: hello == dimmutable
            ? _value.hello
            : hello as LocalGraphqlOps_usersData_users_hello?,
        helloa: helloa == dimmutable
            ? _value.helloa
            : helloa as List<LocalGraphqlOps_usersData_users_helloa?>?,
        address: address == dimmutable
            ? _value.address
            : address as LocalGraphqlOps_usersData_users_address?));
  }
}

abstract class _$LocalGraphqlOps_usersData_usersCopyWith<O>
    implements $LocalGraphqlOps_usersData_usersCopyWith<O> {
  factory _$LocalGraphqlOps_usersData_usersCopyWith(
          LocalGraphqlOps_usersData_users value,
          O Function(LocalGraphqlOps_usersData_users) then) =
      __$LocalGraphqlOps_usersData_usersCopyWithImpl<O>;
  O call(
      {String name,
      List<String?>? tags,
      LocalGraphqlOps_usersData_users_hello? hello,
      List<LocalGraphqlOps_usersData_users_helloa?>? helloa,
      LocalGraphqlOps_usersData_users_address? address});
}

class __$LocalGraphqlOps_usersData_usersCopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_usersCopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_usersCopyWith<O> {
  __$LocalGraphqlOps_usersData_usersCopyWithImpl(
      LocalGraphqlOps_usersData_users _value,
      O Function(LocalGraphqlOps_usersData_users) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? tags = dimmutable,
      Object? hello = dimmutable,
      Object? helloa = dimmutable,
      Object? address = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users(
        name: name == dimmutable ? _value.name : name as String,
        tags: tags == dimmutable ? _value.tags : tags as List<String?>?,
        hello: hello == dimmutable
            ? _value.hello
            : hello as LocalGraphqlOps_usersData_users_hello?,
        helloa: helloa == dimmutable
            ? _value.helloa
            : helloa as List<LocalGraphqlOps_usersData_users_helloa?>?,
        address: address == dimmutable
            ? _value.address
            : address as LocalGraphqlOps_usersData_users_address?));
  }
}

class LocalGraphqlOps_usersData_users_hello {
  final dynamic _value;
  LocalGraphqlOps_usersData_users_hello.Hello1(
      LocalGraphqlOps_usersData_users_hello_Hello1 value)
      : _value = value;
  LocalGraphqlOps_usersData_users_hello.Hello2(
      LocalGraphqlOps_usersData_users_hello_Hello2 value)
      : _value = value;
  LocalGraphqlOps_usersData_users_hello(this._value);
  LocalGraphqlOps_usersData_users_hello_Hello1? get Hello1 =>
      _value is LocalGraphqlOps_usersData_users_hello_Hello1
          ? _value as LocalGraphqlOps_usersData_users_hello_Hello1
          : null;
  LocalGraphqlOps_usersData_users_hello_Hello2? get Hello2 =>
      _value is LocalGraphqlOps_usersData_users_hello_Hello2
          ? _value as LocalGraphqlOps_usersData_users_hello_Hello2
          : null;

  static LocalGraphqlOps_usersData_users_hello? fromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    if (json["__typename"] == "Hello1") {
      return LocalGraphqlOps_usersData_users_hello.Hello1(
          LocalGraphqlOps_usersData_users_hello_Hello1.fromJson(json));
    }
    if (json["__typename"] == "Hello2") {
      return LocalGraphqlOps_usersData_users_hello.Hello2(
          LocalGraphqlOps_usersData_users_hello_Hello2.fromJson(json));
    }
    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }

  static Map<String, dynamic>? toJson(
      LocalGraphqlOps_usersData_users_hello? value) {
    if (value == null) {
      return null;
    }

    return value._value.toJson() as Map<String, dynamic>;
  }

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_hello(_value: ${this._value})";

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_hello && o._value == _value;
  }

  @override
  int get hashCode => _value.hashCode;
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users_hello_Hello1 {
  final String? name;

  final String one;

  @JsonKey(name: "__typename")
  final String d$___typeName;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWith<
          LocalGraphqlOps_usersData_users_hello_Hello1>
      get copyWith =>
          __$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl<
              LocalGraphqlOps_usersData_users_hello_Hello1>(this, IdentityFn);

  const LocalGraphqlOps_usersData_users_hello_Hello1(
      {required this.name, required this.one, required this.d$___typeName});

  factory LocalGraphqlOps_usersData_users_hello_Hello1.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_users_hello_Hello1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_users_hello_Hello1ToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_hello_Hello1 &&
        o.name == name &&
        o.one == one &&
        o.d$___typeName == d$___typeName;
  }

  @override
  int get hashCode => name.hashCode ^ one.hashCode ^ d$___typeName.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_hello_Hello1(name: ${this.name}, one: ${this.one}, d\$___typeName: ${this.d$___typeName})";
}

abstract class $LocalGraphqlOps_usersData_users_hello_Hello1CopyWith<O> {
  factory $LocalGraphqlOps_usersData_users_hello_Hello1CopyWith(
          LocalGraphqlOps_usersData_users_hello_Hello1 value,
          O Function(LocalGraphqlOps_usersData_users_hello_Hello1) then) =
      _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl<O>;
  O call({String? name, String one, String d$___typeName});
}

class _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_users_hello_Hello1CopyWith<O> {
  final LocalGraphqlOps_usersData_users_hello_Hello1 _value;
  final O Function(LocalGraphqlOps_usersData_users_hello_Hello1) _then;
  _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl(
      this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? one = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?,
        one: one == dimmutable ? _value.one : one as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

abstract class _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWith<O>
    implements $LocalGraphqlOps_usersData_users_hello_Hello1CopyWith<O> {
  factory _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWith(
          LocalGraphqlOps_usersData_users_hello_Hello1 value,
          O Function(LocalGraphqlOps_usersData_users_hello_Hello1) then) =
      __$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl<O>;
  O call({String? name, String one, String d$___typeName});
}

class __$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_users_hello_Hello1CopyWith<O> {
  __$LocalGraphqlOps_usersData_users_hello_Hello1CopyWithImpl(
      LocalGraphqlOps_usersData_users_hello_Hello1 _value,
      O Function(LocalGraphqlOps_usersData_users_hello_Hello1) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users_hello_Hello1 get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? one = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users_hello_Hello1(
        name: name == dimmutable ? _value.name : name as String?,
        one: one == dimmutable ? _value.one : one as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users_hello_Hello2 {
  final String? name;

  final String two;

  @JsonKey(name: "__typename")
  final String d$___typeName;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWith<
          LocalGraphqlOps_usersData_users_hello_Hello2>
      get copyWith =>
          __$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl<
              LocalGraphqlOps_usersData_users_hello_Hello2>(this, IdentityFn);

  const LocalGraphqlOps_usersData_users_hello_Hello2(
      {required this.name, required this.two, required this.d$___typeName});

  factory LocalGraphqlOps_usersData_users_hello_Hello2.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_users_hello_Hello2FromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_users_hello_Hello2ToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_hello_Hello2 &&
        o.name == name &&
        o.two == two &&
        o.d$___typeName == d$___typeName;
  }

  @override
  int get hashCode => name.hashCode ^ two.hashCode ^ d$___typeName.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_hello_Hello2(name: ${this.name}, two: ${this.two}, d\$___typeName: ${this.d$___typeName})";
}

abstract class $LocalGraphqlOps_usersData_users_hello_Hello2CopyWith<O> {
  factory $LocalGraphqlOps_usersData_users_hello_Hello2CopyWith(
          LocalGraphqlOps_usersData_users_hello_Hello2 value,
          O Function(LocalGraphqlOps_usersData_users_hello_Hello2) then) =
      _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl<O>;
  O call({String? name, String two, String d$___typeName});
}

class _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_users_hello_Hello2CopyWith<O> {
  final LocalGraphqlOps_usersData_users_hello_Hello2 _value;
  final O Function(LocalGraphqlOps_usersData_users_hello_Hello2) _then;
  _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl(
      this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? two = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?,
        two: two == dimmutable ? _value.two : two as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

abstract class _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWith<O>
    implements $LocalGraphqlOps_usersData_users_hello_Hello2CopyWith<O> {
  factory _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWith(
          LocalGraphqlOps_usersData_users_hello_Hello2 value,
          O Function(LocalGraphqlOps_usersData_users_hello_Hello2) then) =
      __$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl<O>;
  O call({String? name, String two, String d$___typeName});
}

class __$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_users_hello_Hello2CopyWith<O> {
  __$LocalGraphqlOps_usersData_users_hello_Hello2CopyWithImpl(
      LocalGraphqlOps_usersData_users_hello_Hello2 _value,
      O Function(LocalGraphqlOps_usersData_users_hello_Hello2) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users_hello_Hello2 get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? two = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users_hello_Hello2(
        name: name == dimmutable ? _value.name : name as String?,
        two: two == dimmutable ? _value.two : two as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

class LocalGraphqlOps_usersData_users_helloa {
  final dynamic _value;
  LocalGraphqlOps_usersData_users_helloa.Hello1(
      LocalGraphqlOps_usersData_users_helloa_Hello1 value)
      : _value = value;
  LocalGraphqlOps_usersData_users_helloa.Hello2(
      LocalGraphqlOps_usersData_users_helloa_Hello2 value)
      : _value = value;
  LocalGraphqlOps_usersData_users_helloa(this._value);
  LocalGraphqlOps_usersData_users_helloa_Hello1? get Hello1 =>
      _value is LocalGraphqlOps_usersData_users_helloa_Hello1
          ? _value as LocalGraphqlOps_usersData_users_helloa_Hello1
          : null;
  LocalGraphqlOps_usersData_users_helloa_Hello2? get Hello2 =>
      _value is LocalGraphqlOps_usersData_users_helloa_Hello2
          ? _value as LocalGraphqlOps_usersData_users_helloa_Hello2
          : null;

  static LocalGraphqlOps_usersData_users_helloa? fromJson(
      Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    if (json["__typename"] == "Hello1") {
      return LocalGraphqlOps_usersData_users_helloa.Hello1(
          LocalGraphqlOps_usersData_users_helloa_Hello1.fromJson(json));
    }
    if (json["__typename"] == "Hello2") {
      return LocalGraphqlOps_usersData_users_helloa.Hello2(
          LocalGraphqlOps_usersData_users_helloa_Hello2.fromJson(json));
    }
    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }

  static Map<String, dynamic>? toJson(
      LocalGraphqlOps_usersData_users_helloa? value) {
    if (value == null) {
      return null;
    }

    return value._value.toJson() as Map<String, dynamic>;
  }

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_helloa(_value: ${this._value})";

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_helloa && o._value == _value;
  }

  @override
  int get hashCode => _value.hashCode;
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users_helloa_Hello1 {
  final String? name;

  final String one;

  @JsonKey(name: "__typename")
  final String d$___typeName;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith<
          LocalGraphqlOps_usersData_users_helloa_Hello1>
      get copyWith =>
          __$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl<
              LocalGraphqlOps_usersData_users_helloa_Hello1>(this, IdentityFn);

  const LocalGraphqlOps_usersData_users_helloa_Hello1(
      {required this.name, required this.one, required this.d$___typeName});

  factory LocalGraphqlOps_usersData_users_helloa_Hello1.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_users_helloa_Hello1FromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_users_helloa_Hello1ToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_helloa_Hello1 &&
        o.name == name &&
        o.one == one &&
        o.d$___typeName == d$___typeName;
  }

  @override
  int get hashCode => name.hashCode ^ one.hashCode ^ d$___typeName.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_helloa_Hello1(name: ${this.name}, one: ${this.one}, d\$___typeName: ${this.d$___typeName})";
}

abstract class $LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith<O> {
  factory $LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith(
          LocalGraphqlOps_usersData_users_helloa_Hello1 value,
          O Function(LocalGraphqlOps_usersData_users_helloa_Hello1) then) =
      _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl<O>;
  O call({String? name, String one, String d$___typeName});
}

class _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith<O> {
  final LocalGraphqlOps_usersData_users_helloa_Hello1 _value;
  final O Function(LocalGraphqlOps_usersData_users_helloa_Hello1) _then;
  _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl(
      this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? one = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?,
        one: one == dimmutable ? _value.one : one as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

abstract class _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith<O>
    implements $LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith<O> {
  factory _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith(
          LocalGraphqlOps_usersData_users_helloa_Hello1 value,
          O Function(LocalGraphqlOps_usersData_users_helloa_Hello1) then) =
      __$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl<O>;
  O call({String? name, String one, String d$___typeName});
}

class __$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWith<O> {
  __$LocalGraphqlOps_usersData_users_helloa_Hello1CopyWithImpl(
      LocalGraphqlOps_usersData_users_helloa_Hello1 _value,
      O Function(LocalGraphqlOps_usersData_users_helloa_Hello1) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users_helloa_Hello1 get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? one = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users_helloa_Hello1(
        name: name == dimmutable ? _value.name : name as String?,
        one: one == dimmutable ? _value.one : one as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users_helloa_Hello2 {
  final String? name;

  final String two;

  @JsonKey(name: "__typename")
  final String d$___typeName;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith<
          LocalGraphqlOps_usersData_users_helloa_Hello2>
      get copyWith =>
          __$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl<
              LocalGraphqlOps_usersData_users_helloa_Hello2>(this, IdentityFn);

  const LocalGraphqlOps_usersData_users_helloa_Hello2(
      {required this.name, required this.two, required this.d$___typeName});

  factory LocalGraphqlOps_usersData_users_helloa_Hello2.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_users_helloa_Hello2FromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_users_helloa_Hello2ToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_helloa_Hello2 &&
        o.name == name &&
        o.two == two &&
        o.d$___typeName == d$___typeName;
  }

  @override
  int get hashCode => name.hashCode ^ two.hashCode ^ d$___typeName.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_helloa_Hello2(name: ${this.name}, two: ${this.two}, d\$___typeName: ${this.d$___typeName})";
}

abstract class $LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith<O> {
  factory $LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith(
          LocalGraphqlOps_usersData_users_helloa_Hello2 value,
          O Function(LocalGraphqlOps_usersData_users_helloa_Hello2) then) =
      _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl<O>;
  O call({String? name, String two, String d$___typeName});
}

class _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith<O> {
  final LocalGraphqlOps_usersData_users_helloa_Hello2 _value;
  final O Function(LocalGraphqlOps_usersData_users_helloa_Hello2) _then;
  _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl(
      this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? two = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String?,
        two: two == dimmutable ? _value.two : two as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

abstract class _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith<O>
    implements $LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith<O> {
  factory _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith(
          LocalGraphqlOps_usersData_users_helloa_Hello2 value,
          O Function(LocalGraphqlOps_usersData_users_helloa_Hello2) then) =
      __$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl<O>;
  O call({String? name, String two, String d$___typeName});
}

class __$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWith<O> {
  __$LocalGraphqlOps_usersData_users_helloa_Hello2CopyWithImpl(
      LocalGraphqlOps_usersData_users_helloa_Hello2 _value,
      O Function(LocalGraphqlOps_usersData_users_helloa_Hello2) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users_helloa_Hello2 get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? two = dimmutable,
      Object? d$___typeName = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users_helloa_Hello2(
        name: name == dimmutable ? _value.name : name as String?,
        two: two == dimmutable ? _value.two : two as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users_address {
  final String street;

  final String zip;

  final LocalGraphqlOps_usersData_users_address_country country;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_users_addressCopyWith<
          LocalGraphqlOps_usersData_users_address>
      get copyWith => __$LocalGraphqlOps_usersData_users_addressCopyWithImpl<
          LocalGraphqlOps_usersData_users_address>(this, IdentityFn);

  const LocalGraphqlOps_usersData_users_address(
      {required this.street, required this.zip, required this.country});

  factory LocalGraphqlOps_usersData_users_address.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_users_addressFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_users_addressToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_address &&
        o.street == street &&
        o.zip == zip &&
        o.country == country;
  }

  @override
  int get hashCode => street.hashCode ^ zip.hashCode ^ country.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_address(street: ${this.street}, zip: ${this.zip}, country: ${this.country})";
}

abstract class $LocalGraphqlOps_usersData_users_addressCopyWith<O> {
  factory $LocalGraphqlOps_usersData_users_addressCopyWith(
          LocalGraphqlOps_usersData_users_address value,
          O Function(LocalGraphqlOps_usersData_users_address) then) =
      _$LocalGraphqlOps_usersData_users_addressCopyWithImpl<O>;
  O call(
      {String street,
      String zip,
      LocalGraphqlOps_usersData_users_address_country country});
}

class _$LocalGraphqlOps_usersData_users_addressCopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_users_addressCopyWith<O> {
  final LocalGraphqlOps_usersData_users_address _value;
  final O Function(LocalGraphqlOps_usersData_users_address) _then;
  _$LocalGraphqlOps_usersData_users_addressCopyWithImpl(
      this._value, this._then);

  @override
  O call(
      {Object? street = dimmutable,
      Object? zip = dimmutable,
      Object? country = dimmutable}) {
    return _then(_value.copyWith(
        street: street == dimmutable ? _value.street : street as String,
        zip: zip == dimmutable ? _value.zip : zip as String,
        country: country == dimmutable
            ? _value.country
            : country as LocalGraphqlOps_usersData_users_address_country));
  }
}

abstract class _$LocalGraphqlOps_usersData_users_addressCopyWith<O>
    implements $LocalGraphqlOps_usersData_users_addressCopyWith<O> {
  factory _$LocalGraphqlOps_usersData_users_addressCopyWith(
          LocalGraphqlOps_usersData_users_address value,
          O Function(LocalGraphqlOps_usersData_users_address) then) =
      __$LocalGraphqlOps_usersData_users_addressCopyWithImpl<O>;
  O call(
      {String street,
      String zip,
      LocalGraphqlOps_usersData_users_address_country country});
}

class __$LocalGraphqlOps_usersData_users_addressCopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_users_addressCopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_users_addressCopyWith<O> {
  __$LocalGraphqlOps_usersData_users_addressCopyWithImpl(
      LocalGraphqlOps_usersData_users_address _value,
      O Function(LocalGraphqlOps_usersData_users_address) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users_address get _value => super._value;

  @override
  O call(
      {Object? street = dimmutable,
      Object? zip = dimmutable,
      Object? country = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users_address(
        street: street == dimmutable ? _value.street : street as String,
        zip: zip == dimmutable ? _value.zip : zip as String,
        country: country == dimmutable
            ? _value.country
            : country as LocalGraphqlOps_usersData_users_address_country));
  }
}

@JsonSerializable()
class LocalGraphqlOps_usersData_users_address_country {
  final String code;

  final String name;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_usersData_users_address_countryCopyWith<
          LocalGraphqlOps_usersData_users_address_country>
      get copyWith =>
          __$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl<
                  LocalGraphqlOps_usersData_users_address_country>(
              this, IdentityFn);

  const LocalGraphqlOps_usersData_users_address_country(
      {required this.code, required this.name});

  factory LocalGraphqlOps_usersData_users_address_country.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_usersData_users_address_countryFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_usersData_users_address_countryToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_usersData_users_address_country &&
        o.code == code &&
        o.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_usersData_users_address_country(code: ${this.code}, name: ${this.name})";
}

abstract class $LocalGraphqlOps_usersData_users_address_countryCopyWith<O> {
  factory $LocalGraphqlOps_usersData_users_address_countryCopyWith(
          LocalGraphqlOps_usersData_users_address_country value,
          O Function(LocalGraphqlOps_usersData_users_address_country) then) =
      _$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl<O>;
  O call({String code, String name});
}

class _$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl<O>
    implements $LocalGraphqlOps_usersData_users_address_countryCopyWith<O> {
  final LocalGraphqlOps_usersData_users_address_country _value;
  final O Function(LocalGraphqlOps_usersData_users_address_country) _then;
  _$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? code = dimmutable, Object? name = dimmutable}) {
    return _then(_value.copyWith(
        code: code == dimmutable ? _value.code : code as String,
        name: name == dimmutable ? _value.name : name as String));
  }
}

abstract class _$LocalGraphqlOps_usersData_users_address_countryCopyWith<O>
    implements $LocalGraphqlOps_usersData_users_address_countryCopyWith<O> {
  factory _$LocalGraphqlOps_usersData_users_address_countryCopyWith(
          LocalGraphqlOps_usersData_users_address_country value,
          O Function(LocalGraphqlOps_usersData_users_address_country) then) =
      __$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl<O>;
  O call({String code, String name});
}

class __$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl<O>
    extends _$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl<O>
    implements _$LocalGraphqlOps_usersData_users_address_countryCopyWith<O> {
  __$LocalGraphqlOps_usersData_users_address_countryCopyWithImpl(
      LocalGraphqlOps_usersData_users_address_country _value,
      O Function(LocalGraphqlOps_usersData_users_address_country) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_usersData_users_address_country get _value => super._value;

  @override
  O call({Object? code = dimmutable, Object? name = dimmutable}) {
    return _then(LocalGraphqlOps_usersData_users_address_country(
        code: code == dimmutable ? _value.code : code as String,
        name: name == dimmutable ? _value.name : name as String));
  }
}

List<Map<String, dynamic>?>?
    LocalGraphqlOps_usersData_users_helloa_helloaListSerializer(
        List<LocalGraphqlOps_usersData_users_helloa?>? input) {
  if (input == null) {
    return null;
  }

  return input
      .map((m) => LocalGraphqlOps_usersData_users_helloa.toJson(m))
      .toList();
}

List<LocalGraphqlOps_usersData_users_helloa?>?
    LocalGraphqlOps_usersData_users_helloahelloaListDeserializer(
        Object? input) {
  if (input == null) {
    return null;
  }

  return (input as List<dynamic>)
      .map((dynamic e) => LocalGraphqlOps_usersData_users_helloa.fromJson(
          e as Map<String, dynamic>?))
      .toList();
}

GraphqlRequestInput<Null> LocalGraphqlOps_usersInputDeserializer(dynamic json) {
  return GraphqlRequestInput.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic> LocalGraphqlOps_usersDataSerializer(
        int status, LocalGraphqlOps_usersData resp) =>
    resp.toJson();

LocalGraphqlOps_usersData LocalGraphqlOps_usersDataDeserializer(
        int status, dynamic json) =>
    LocalGraphqlOps_usersData.fromJson(json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(query: """query LocalGraphqlOps_users { 
 users  {  
 name

tags

          hello {
                   __typename
              ... on Hello1 {
         name
one
       }
      
       ... on Hello2 {
         name
two
       }
      
     
          }
        
          helloa {
                   __typename
              ... on Hello1 {
         name
one
       }
      
       ... on Hello2 {
         name
two
       }
      
     
          }
        
address {
             street
zip
country {
             code
name
          } 
          }  }

 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_usersDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_usersInputDeserializer,
    responseDeserializer: LocalGraphqlOps_usersDataDeserializer)
typedef LocalGraphqlOps_users = HttpField<GraphqlRequestInput<Null>,
    LocalGraphqlOps_usersData, List<GraphqlError>>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(query: """query LocalGraphqlOps_users { 
 users  {  
 name

tags

          hello {
                   __typename
              ... on Hello1 {
         name
one
       }
      
       ... on Hello2 {
         name
two
       }
      
     
          }
        
          helloa {
                   __typename
              ... on Hello1 {
         name
one
       }
      
       ... on Hello2 {
         name
two
       }
      
     
          }
        
address {
             street
zip
country {
             code
name
          } 
          }  }

 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_usersDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_usersInputDeserializer,
    responseDeserializer: LocalGraphqlOps_usersDataDeserializer)
typedef LocalGraphqlOps_usersT<T>
    = HttpField<GraphqlRequestInput<Null>, T, List<GraphqlError>>;

@JsonSerializable()
class LocalGraphqlOps_chnageNameWithVariablesData {
  final String changeName;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWith<
          LocalGraphqlOps_chnageNameWithVariablesData>
      get copyWith =>
          __$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl<
              LocalGraphqlOps_chnageNameWithVariablesData>(this, IdentityFn);

  const LocalGraphqlOps_chnageNameWithVariablesData({required this.changeName});

  factory LocalGraphqlOps_chnageNameWithVariablesData.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_chnageNameWithVariablesDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_chnageNameWithVariablesDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_chnageNameWithVariablesData &&
        o.changeName == changeName;
  }

  @override
  int get hashCode => changeName.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_chnageNameWithVariablesData(changeName: ${this.changeName})";
}

abstract class $LocalGraphqlOps_chnageNameWithVariablesDataCopyWith<O> {
  factory $LocalGraphqlOps_chnageNameWithVariablesDataCopyWith(
          LocalGraphqlOps_chnageNameWithVariablesData value,
          O Function(LocalGraphqlOps_chnageNameWithVariablesData) then) =
      _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl<O>;
  O call({String changeName});
}

class _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl<O>
    implements $LocalGraphqlOps_chnageNameWithVariablesDataCopyWith<O> {
  final LocalGraphqlOps_chnageNameWithVariablesData _value;
  final O Function(LocalGraphqlOps_chnageNameWithVariablesData) _then;
  _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? changeName = dimmutable}) {
    return _then(_value.copyWith(
        changeName: changeName == dimmutable
            ? _value.changeName
            : changeName as String));
  }
}

abstract class _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWith<O>
    implements $LocalGraphqlOps_chnageNameWithVariablesDataCopyWith<O> {
  factory _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWith(
          LocalGraphqlOps_chnageNameWithVariablesData value,
          O Function(LocalGraphqlOps_chnageNameWithVariablesData) then) =
      __$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl<O>;
  O call({String changeName});
}

class __$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl<O>
    extends _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl<O>
    implements _$LocalGraphqlOps_chnageNameWithVariablesDataCopyWith<O> {
  __$LocalGraphqlOps_chnageNameWithVariablesDataCopyWithImpl(
      LocalGraphqlOps_chnageNameWithVariablesData _value,
      O Function(LocalGraphqlOps_chnageNameWithVariablesData) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_chnageNameWithVariablesData get _value => super._value;

  @override
  O call({Object? changeName = dimmutable}) {
    return _then(LocalGraphqlOps_chnageNameWithVariablesData(
        changeName: changeName == dimmutable
            ? _value.changeName
            : changeName as String));
  }
}

@JsonSerializable()
class LocalGraphqlOps_chnageNameWithVariablesVariables {
  final String name;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith<
          LocalGraphqlOps_chnageNameWithVariablesVariables>
      get copyWith =>
          __$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl<
                  LocalGraphqlOps_chnageNameWithVariablesVariables>(
              this, IdentityFn);

  const LocalGraphqlOps_chnageNameWithVariablesVariables({required this.name});

  factory LocalGraphqlOps_chnageNameWithVariablesVariables.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_chnageNameWithVariablesVariablesFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_chnageNameWithVariablesVariablesToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_chnageNameWithVariablesVariables &&
        o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_chnageNameWithVariablesVariables(name: ${this.name})";
}

abstract class $LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith<O> {
  factory $LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith(
          LocalGraphqlOps_chnageNameWithVariablesVariables value,
          O Function(LocalGraphqlOps_chnageNameWithVariablesVariables) then) =
      _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl<O>;
  O call({String name});
}

class _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl<O>
    implements $LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith<O> {
  final LocalGraphqlOps_chnageNameWithVariablesVariables _value;
  final O Function(LocalGraphqlOps_chnageNameWithVariablesVariables) _then;
  _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String));
  }
}

abstract class _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith<O>
    implements $LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith<O> {
  factory _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith(
          LocalGraphqlOps_chnageNameWithVariablesVariables value,
          O Function(LocalGraphqlOps_chnageNameWithVariablesVariables) then) =
      __$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl<O>;
  O call({String name});
}

class __$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl<O>
    extends _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl<O>
    implements _$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWith<O> {
  __$LocalGraphqlOps_chnageNameWithVariablesVariablesCopyWithImpl(
      LocalGraphqlOps_chnageNameWithVariablesVariables _value,
      O Function(LocalGraphqlOps_chnageNameWithVariablesVariables) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_chnageNameWithVariablesVariables get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(LocalGraphqlOps_chnageNameWithVariablesVariables(
        name: name == dimmutable ? _value.name : name as String));
  }
}

GraphqlRequestInput<LocalGraphqlOps_chnageNameWithVariablesVariables>
    LocalGraphqlOps_chnageNameWithVariablesInputDeserializer(dynamic json) {
  json = json as Map<String, dynamic>;
  final variables = LocalGraphqlOps_chnageNameWithVariablesVariables.fromJson(
      json["variables"] as Map<String, dynamic>);
  return GraphqlRequestInput.fromJson(json, variables: variables);
}

Map<String, dynamic> LocalGraphqlOps_chnageNameWithVariablesDataSerializer(
        int status, LocalGraphqlOps_chnageNameWithVariablesData resp) =>
    resp.toJson();

LocalGraphqlOps_chnageNameWithVariablesData
    LocalGraphqlOps_chnageNameWithVariablesDataDeserializer(
            int status, dynamic json) =>
        LocalGraphqlOps_chnageNameWithVariablesData.fromJson(
            json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(
        query:
            """mutation LocalGraphqlOps_chnageNameWithVariables(\$name: String!) { 
 changeName(name: \$name)   
 
 }""",
        hash: null,
        useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_chnageNameWithVariablesDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_chnageNameWithVariablesInputDeserializer,
    responseDeserializer:
        LocalGraphqlOps_chnageNameWithVariablesDataDeserializer)
typedef LocalGraphqlOps_chnageNameWithVariables = HttpField<
    GraphqlRequestInput<LocalGraphqlOps_chnageNameWithVariablesVariables>,
    LocalGraphqlOps_chnageNameWithVariablesData,
    List<GraphqlError>>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(
        query:
            """mutation LocalGraphqlOps_chnageNameWithVariables(\$name: String!) { 
 changeName(name: \$name)   
 
 }""",
        hash: null,
        useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_chnageNameWithVariablesDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_chnageNameWithVariablesInputDeserializer,
    responseDeserializer:
        LocalGraphqlOps_chnageNameWithVariablesDataDeserializer)
typedef LocalGraphqlOps_chnageNameWithVariablesT<T> = HttpField<
    GraphqlRequestInput<LocalGraphqlOps_chnageNameWithVariablesVariables>,
    T,
    List<GraphqlError>>;

@JsonSerializable()
class LocalGraphqlOps_addMessageData {
  final LocalGraphqlOps_addMessageData_addMessage addMessage;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_addMessageDataCopyWith<LocalGraphqlOps_addMessageData>
      get copyWith => __$LocalGraphqlOps_addMessageDataCopyWithImpl<
          LocalGraphqlOps_addMessageData>(this, IdentityFn);

  const LocalGraphqlOps_addMessageData({required this.addMessage});

  factory LocalGraphqlOps_addMessageData.fromJson(Map<String, dynamic> json) =>
      _$LocalGraphqlOps_addMessageDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalGraphqlOps_addMessageDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_addMessageData && o.addMessage == addMessage;
  }

  @override
  int get hashCode => addMessage.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_addMessageData(addMessage: ${this.addMessage})";
}

abstract class $LocalGraphqlOps_addMessageDataCopyWith<O> {
  factory $LocalGraphqlOps_addMessageDataCopyWith(
          LocalGraphqlOps_addMessageData value,
          O Function(LocalGraphqlOps_addMessageData) then) =
      _$LocalGraphqlOps_addMessageDataCopyWithImpl<O>;
  O call({LocalGraphqlOps_addMessageData_addMessage addMessage});
}

class _$LocalGraphqlOps_addMessageDataCopyWithImpl<O>
    implements $LocalGraphqlOps_addMessageDataCopyWith<O> {
  final LocalGraphqlOps_addMessageData _value;
  final O Function(LocalGraphqlOps_addMessageData) _then;
  _$LocalGraphqlOps_addMessageDataCopyWithImpl(this._value, this._then);

  @override
  O call({Object? addMessage = dimmutable}) {
    return _then(_value.copyWith(
        addMessage: addMessage == dimmutable
            ? _value.addMessage
            : addMessage as LocalGraphqlOps_addMessageData_addMessage));
  }
}

abstract class _$LocalGraphqlOps_addMessageDataCopyWith<O>
    implements $LocalGraphqlOps_addMessageDataCopyWith<O> {
  factory _$LocalGraphqlOps_addMessageDataCopyWith(
          LocalGraphqlOps_addMessageData value,
          O Function(LocalGraphqlOps_addMessageData) then) =
      __$LocalGraphqlOps_addMessageDataCopyWithImpl<O>;
  O call({LocalGraphqlOps_addMessageData_addMessage addMessage});
}

class __$LocalGraphqlOps_addMessageDataCopyWithImpl<O>
    extends _$LocalGraphqlOps_addMessageDataCopyWithImpl<O>
    implements _$LocalGraphqlOps_addMessageDataCopyWith<O> {
  __$LocalGraphqlOps_addMessageDataCopyWithImpl(
      LocalGraphqlOps_addMessageData _value,
      O Function(LocalGraphqlOps_addMessageData) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_addMessageData get _value => super._value;

  @override
  O call({Object? addMessage = dimmutable}) {
    return _then(LocalGraphqlOps_addMessageData(
        addMessage: addMessage == dimmutable
            ? _value.addMessage
            : addMessage as LocalGraphqlOps_addMessageData_addMessage));
  }
}

@JsonSerializable()
class LocalGraphqlOps_addMessageData_addMessage {
  final String text;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_addMessageData_addMessageCopyWith<
          LocalGraphqlOps_addMessageData_addMessage>
      get copyWith => __$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl<
          LocalGraphqlOps_addMessageData_addMessage>(this, IdentityFn);

  const LocalGraphqlOps_addMessageData_addMessage({required this.text});

  factory LocalGraphqlOps_addMessageData_addMessage.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_addMessageData_addMessageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_addMessageData_addMessageToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_addMessageData_addMessage && o.text == text;
  }

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_addMessageData_addMessage(text: ${this.text})";
}

abstract class $LocalGraphqlOps_addMessageData_addMessageCopyWith<O> {
  factory $LocalGraphqlOps_addMessageData_addMessageCopyWith(
          LocalGraphqlOps_addMessageData_addMessage value,
          O Function(LocalGraphqlOps_addMessageData_addMessage) then) =
      _$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl<O>;
  O call({String text});
}

class _$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl<O>
    implements $LocalGraphqlOps_addMessageData_addMessageCopyWith<O> {
  final LocalGraphqlOps_addMessageData_addMessage _value;
  final O Function(LocalGraphqlOps_addMessageData_addMessage) _then;
  _$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? text = dimmutable}) {
    return _then(_value.copyWith(
        text: text == dimmutable ? _value.text : text as String));
  }
}

abstract class _$LocalGraphqlOps_addMessageData_addMessageCopyWith<O>
    implements $LocalGraphqlOps_addMessageData_addMessageCopyWith<O> {
  factory _$LocalGraphqlOps_addMessageData_addMessageCopyWith(
          LocalGraphqlOps_addMessageData_addMessage value,
          O Function(LocalGraphqlOps_addMessageData_addMessage) then) =
      __$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl<O>;
  O call({String text});
}

class __$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl<O>
    extends _$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl<O>
    implements _$LocalGraphqlOps_addMessageData_addMessageCopyWith<O> {
  __$LocalGraphqlOps_addMessageData_addMessageCopyWithImpl(
      LocalGraphqlOps_addMessageData_addMessage _value,
      O Function(LocalGraphqlOps_addMessageData_addMessage) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_addMessageData_addMessage get _value => super._value;

  @override
  O call({Object? text = dimmutable}) {
    return _then(LocalGraphqlOps_addMessageData_addMessage(
        text: text == dimmutable ? _value.text : text as String));
  }
}

GraphqlRequestInput<Null> LocalGraphqlOps_addMessageInputDeserializer(
    dynamic json) {
  return GraphqlRequestInput.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic> LocalGraphqlOps_addMessageDataSerializer(
        int status, LocalGraphqlOps_addMessageData resp) =>
    resp.toJson();

LocalGraphqlOps_addMessageData LocalGraphqlOps_addMessageDataDeserializer(
        int status, dynamic json) =>
    LocalGraphqlOps_addMessageData.fromJson(json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery:
        GraphqlRequestPart(query: """mutation LocalGraphqlOps_addMessage { 
 addMessage(message: "m1")  {  
 text }

 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_addMessageDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_addMessageInputDeserializer,
    responseDeserializer: LocalGraphqlOps_addMessageDataDeserializer)
typedef LocalGraphqlOps_addMessage = HttpField<GraphqlRequestInput<Null>,
    LocalGraphqlOps_addMessageData, List<GraphqlError>>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery:
        GraphqlRequestPart(query: """mutation LocalGraphqlOps_addMessage { 
 addMessage(message: "m1")  {  
 text }

 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_addMessageDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_addMessageInputDeserializer,
    responseDeserializer: LocalGraphqlOps_addMessageDataDeserializer)
typedef LocalGraphqlOps_addMessageT<T>
    = HttpField<GraphqlRequestInput<Null>, T, List<GraphqlError>>;

@JsonSerializable()
class LocalGraphqlOps_errorQData {
  final String? errorQ;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_errorQDataCopyWith<LocalGraphqlOps_errorQData>
      get copyWith =>
          __$LocalGraphqlOps_errorQDataCopyWithImpl<LocalGraphqlOps_errorQData>(
              this, IdentityFn);

  const LocalGraphqlOps_errorQData({required this.errorQ});

  factory LocalGraphqlOps_errorQData.fromJson(Map<String, dynamic> json) =>
      _$LocalGraphqlOps_errorQDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocalGraphqlOps_errorQDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_errorQData && o.errorQ == errorQ;
  }

  @override
  int get hashCode => errorQ.hashCode;

  @override
  String toString() => "LocalGraphqlOps_errorQData(errorQ: ${this.errorQ})";
}

abstract class $LocalGraphqlOps_errorQDataCopyWith<O> {
  factory $LocalGraphqlOps_errorQDataCopyWith(LocalGraphqlOps_errorQData value,
          O Function(LocalGraphqlOps_errorQData) then) =
      _$LocalGraphqlOps_errorQDataCopyWithImpl<O>;
  O call({String? errorQ});
}

class _$LocalGraphqlOps_errorQDataCopyWithImpl<O>
    implements $LocalGraphqlOps_errorQDataCopyWith<O> {
  final LocalGraphqlOps_errorQData _value;
  final O Function(LocalGraphqlOps_errorQData) _then;
  _$LocalGraphqlOps_errorQDataCopyWithImpl(this._value, this._then);

  @override
  O call({Object? errorQ = dimmutable}) {
    return _then(_value.copyWith(
        errorQ: errorQ == dimmutable ? _value.errorQ : errorQ as String?));
  }
}

abstract class _$LocalGraphqlOps_errorQDataCopyWith<O>
    implements $LocalGraphqlOps_errorQDataCopyWith<O> {
  factory _$LocalGraphqlOps_errorQDataCopyWith(LocalGraphqlOps_errorQData value,
          O Function(LocalGraphqlOps_errorQData) then) =
      __$LocalGraphqlOps_errorQDataCopyWithImpl<O>;
  O call({String? errorQ});
}

class __$LocalGraphqlOps_errorQDataCopyWithImpl<O>
    extends _$LocalGraphqlOps_errorQDataCopyWithImpl<O>
    implements _$LocalGraphqlOps_errorQDataCopyWith<O> {
  __$LocalGraphqlOps_errorQDataCopyWithImpl(LocalGraphqlOps_errorQData _value,
      O Function(LocalGraphqlOps_errorQData) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_errorQData get _value => super._value;

  @override
  O call({Object? errorQ = dimmutable}) {
    return _then(LocalGraphqlOps_errorQData(
        errorQ: errorQ == dimmutable ? _value.errorQ : errorQ as String?));
  }
}

GraphqlRequestInput<Null> LocalGraphqlOps_errorQInputDeserializer(
    dynamic json) {
  return GraphqlRequestInput.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic> LocalGraphqlOps_errorQDataSerializer(
        int status, LocalGraphqlOps_errorQData resp) =>
    resp.toJson();

LocalGraphqlOps_errorQData LocalGraphqlOps_errorQDataDeserializer(
        int status, dynamic json) =>
    LocalGraphqlOps_errorQData.fromJson(json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(query: """query LocalGraphqlOps_errorQ { 
 errorQ   
 
 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_errorQDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_errorQInputDeserializer,
    responseDeserializer: LocalGraphqlOps_errorQDataDeserializer)
typedef LocalGraphqlOps_errorQ = HttpField<GraphqlRequestInput<Null>,
    LocalGraphqlOps_errorQData, List<GraphqlError>>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(query: """query LocalGraphqlOps_errorQ { 
 errorQ   
 
 }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: LocalGraphqlOps_errorQDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: LocalGraphqlOps_errorQInputDeserializer,
    responseDeserializer: LocalGraphqlOps_errorQDataDeserializer)
typedef LocalGraphqlOps_errorQT<T>
    = HttpField<GraphqlRequestInput<Null>, T, List<GraphqlError>>;

@JsonSerializable()
class LocalGraphqlOps_subscriptionMessageData {
  final LocalGraphqlOps_subscriptionMessageData_messageCreated? messageCreated;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_subscriptionMessageDataCopyWith<
          LocalGraphqlOps_subscriptionMessageData>
      get copyWith => __$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl<
          LocalGraphqlOps_subscriptionMessageData>(this, IdentityFn);

  const LocalGraphqlOps_subscriptionMessageData({required this.messageCreated});

  factory LocalGraphqlOps_subscriptionMessageData.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_subscriptionMessageDataFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_subscriptionMessageDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_subscriptionMessageData &&
        o.messageCreated == messageCreated;
  }

  @override
  int get hashCode => messageCreated.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_subscriptionMessageData(messageCreated: ${this.messageCreated})";
}

abstract class $LocalGraphqlOps_subscriptionMessageDataCopyWith<O> {
  factory $LocalGraphqlOps_subscriptionMessageDataCopyWith(
          LocalGraphqlOps_subscriptionMessageData value,
          O Function(LocalGraphqlOps_subscriptionMessageData) then) =
      _$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl<O>;
  O call(
      {LocalGraphqlOps_subscriptionMessageData_messageCreated? messageCreated});
}

class _$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl<O>
    implements $LocalGraphqlOps_subscriptionMessageDataCopyWith<O> {
  final LocalGraphqlOps_subscriptionMessageData _value;
  final O Function(LocalGraphqlOps_subscriptionMessageData) _then;
  _$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? messageCreated = dimmutable}) {
    return _then(_value.copyWith(
        messageCreated: messageCreated == dimmutable
            ? _value.messageCreated
            : messageCreated
                as LocalGraphqlOps_subscriptionMessageData_messageCreated?));
  }
}

abstract class _$LocalGraphqlOps_subscriptionMessageDataCopyWith<O>
    implements $LocalGraphqlOps_subscriptionMessageDataCopyWith<O> {
  factory _$LocalGraphqlOps_subscriptionMessageDataCopyWith(
          LocalGraphqlOps_subscriptionMessageData value,
          O Function(LocalGraphqlOps_subscriptionMessageData) then) =
      __$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl<O>;
  O call(
      {LocalGraphqlOps_subscriptionMessageData_messageCreated? messageCreated});
}

class __$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl<O>
    extends _$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl<O>
    implements _$LocalGraphqlOps_subscriptionMessageDataCopyWith<O> {
  __$LocalGraphqlOps_subscriptionMessageDataCopyWithImpl(
      LocalGraphqlOps_subscriptionMessageData _value,
      O Function(LocalGraphqlOps_subscriptionMessageData) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_subscriptionMessageData get _value => super._value;

  @override
  O call({Object? messageCreated = dimmutable}) {
    return _then(LocalGraphqlOps_subscriptionMessageData(
        messageCreated: messageCreated == dimmutable
            ? _value.messageCreated
            : messageCreated
                as LocalGraphqlOps_subscriptionMessageData_messageCreated?));
  }
}

@JsonSerializable()
class LocalGraphqlOps_subscriptionMessageData_messageCreated {
  final String text;

  @JsonKey(ignore: true)
  _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith<
          LocalGraphqlOps_subscriptionMessageData_messageCreated>
      get copyWith =>
          __$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl<
                  LocalGraphqlOps_subscriptionMessageData_messageCreated>(
              this, IdentityFn);

  const LocalGraphqlOps_subscriptionMessageData_messageCreated(
      {required this.text});

  factory LocalGraphqlOps_subscriptionMessageData_messageCreated.fromJson(
          Map<String, dynamic> json) =>
      _$LocalGraphqlOps_subscriptionMessageData_messageCreatedFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocalGraphqlOps_subscriptionMessageData_messageCreatedToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is LocalGraphqlOps_subscriptionMessageData_messageCreated &&
        o.text == text;
  }

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() =>
      "LocalGraphqlOps_subscriptionMessageData_messageCreated(text: ${this.text})";
}

abstract class $LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith<
    O> {
  factory $LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith(
          LocalGraphqlOps_subscriptionMessageData_messageCreated value,
          O Function(LocalGraphqlOps_subscriptionMessageData_messageCreated)
              then) =
      _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl<O>;
  O call({String text});
}

class _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl<O>
    implements
        $LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith<O> {
  final LocalGraphqlOps_subscriptionMessageData_messageCreated _value;
  final O Function(LocalGraphqlOps_subscriptionMessageData_messageCreated)
      _then;
  _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl(
      this._value, this._then);

  @override
  O call({Object? text = dimmutable}) {
    return _then(_value.copyWith(
        text: text == dimmutable ? _value.text : text as String));
  }
}

abstract class _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith<
        O>
    implements
        $LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith<O> {
  factory _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith(
          LocalGraphqlOps_subscriptionMessageData_messageCreated value,
          O Function(LocalGraphqlOps_subscriptionMessageData_messageCreated)
              then) =
      __$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl<O>;
  O call({String text});
}

class __$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl<O>
    extends _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl<
        O>
    implements
        _$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWith<O> {
  __$LocalGraphqlOps_subscriptionMessageData_messageCreatedCopyWithImpl(
      LocalGraphqlOps_subscriptionMessageData_messageCreated _value,
      O Function(LocalGraphqlOps_subscriptionMessageData_messageCreated) _then)
      : super(_value, (v) => _then(v));

  @override
  LocalGraphqlOps_subscriptionMessageData_messageCreated get _value =>
      super._value;

  @override
  O call({Object? text = dimmutable}) {
    return _then(LocalGraphqlOps_subscriptionMessageData_messageCreated(
        text: text == dimmutable ? _value.text : text as String));
  }
}

LocalGraphqlOps_subscriptionMessageData
    LocalGraphqlOps_subscriptionMessageDataDeserializer(dynamic value) =>
        LocalGraphqlOps_subscriptionMessageData.fromJson(
            value as Map<String, dynamic>);

@WebSocketRequest(
    url: "ws://localhost:4000/graphql",
    graphqlQuery: GraphqlRequestPart(
        query: """subscription LocalGraphqlOps_subscriptionMessage { 
 messageCreated  {  
 text }

 }""", hash: null, useGetForPersist: false),
    inputSerializer: GraphqlRequestInput.toJson,
    responseDeserializer: LocalGraphqlOps_subscriptionMessageDataDeserializer)
typedef LocalGraphqlOps_subscriptionMessage = WebSocketField<
    GraphqlRequestInput<Null>,
    LocalGraphqlOps_subscriptionMessageData,
    List<GraphqlError>>;
