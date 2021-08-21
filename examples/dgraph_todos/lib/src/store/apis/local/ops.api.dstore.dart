// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ops.dart';

// **************************************************************************
// GraphqlOpsGenerator
// **************************************************************************

@JsonSerializable()
class Hello_todoData {
  final Hello_todoData_todo? todo;

  @JsonKey(ignore: true)
  _$Hello_todoDataCopyWith<Hello_todoData> get copyWith =>
      __$Hello_todoDataCopyWithImpl<Hello_todoData>(this, IdentityFn);

  const Hello_todoData({required this.todo});

  factory Hello_todoData.fromJson(Map<String, dynamic> json) =>
      _$Hello_todoDataFromJson(json);

  Map<String, dynamic> toJson() => _$Hello_todoDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Hello_todoData && o.todo == todo;
  }

  @override
  int get hashCode => todo.hashCode;

  @override
  String toString() => "Hello_todoData(todo: ${this.todo})";
}

abstract class $Hello_todoDataCopyWith<O> {
  factory $Hello_todoDataCopyWith(
          Hello_todoData value, O Function(Hello_todoData) then) =
      _$Hello_todoDataCopyWithImpl<O>;
  O call({Hello_todoData_todo? todo});
}

class _$Hello_todoDataCopyWithImpl<O> implements $Hello_todoDataCopyWith<O> {
  final Hello_todoData _value;
  final O Function(Hello_todoData) _then;
  _$Hello_todoDataCopyWithImpl(this._value, this._then);

  @override
  O call({Object? todo = dimmutable}) {
    return _then(_value.copyWith(
        todo: todo == dimmutable ? _value.todo : todo as Hello_todoData_todo?));
  }
}

abstract class _$Hello_todoDataCopyWith<O>
    implements $Hello_todoDataCopyWith<O> {
  factory _$Hello_todoDataCopyWith(
          Hello_todoData value, O Function(Hello_todoData) then) =
      __$Hello_todoDataCopyWithImpl<O>;
  O call({Hello_todoData_todo? todo});
}

class __$Hello_todoDataCopyWithImpl<O> extends _$Hello_todoDataCopyWithImpl<O>
    implements _$Hello_todoDataCopyWith<O> {
  __$Hello_todoDataCopyWithImpl(
      Hello_todoData _value, O Function(Hello_todoData) _then)
      : super(_value, (v) => _then(v));

  @override
  Hello_todoData get _value => super._value;

  @override
  O call({Object? todo = dimmutable}) {
    return _then(Hello_todoData(
        todo: todo == dimmutable ? _value.todo : todo as Hello_todoData_todo?));
  }
}

@JsonSerializable()
class Hello_todoData_todo {
  final String? text;

  @JsonKey(ignore: true)
  _$Hello_todoData_todoCopyWith<Hello_todoData_todo> get copyWith =>
      __$Hello_todoData_todoCopyWithImpl<Hello_todoData_todo>(this, IdentityFn);

  const Hello_todoData_todo({required this.text});

  factory Hello_todoData_todo.fromJson(Map<String, dynamic> json) =>
      _$Hello_todoData_todoFromJson(json);

  Map<String, dynamic> toJson() => _$Hello_todoData_todoToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Hello_todoData_todo && o.text == text;
  }

  @override
  int get hashCode => text.hashCode;

  @override
  String toString() => "Hello_todoData_todo(text: ${this.text})";
}

abstract class $Hello_todoData_todoCopyWith<O> {
  factory $Hello_todoData_todoCopyWith(
          Hello_todoData_todo value, O Function(Hello_todoData_todo) then) =
      _$Hello_todoData_todoCopyWithImpl<O>;
  O call({String? text});
}

class _$Hello_todoData_todoCopyWithImpl<O>
    implements $Hello_todoData_todoCopyWith<O> {
  final Hello_todoData_todo _value;
  final O Function(Hello_todoData_todo) _then;
  _$Hello_todoData_todoCopyWithImpl(this._value, this._then);

  @override
  O call({Object? text = dimmutable}) {
    return _then(_value.copyWith(
        text: text == dimmutable ? _value.text : text as String?));
  }
}

abstract class _$Hello_todoData_todoCopyWith<O>
    implements $Hello_todoData_todoCopyWith<O> {
  factory _$Hello_todoData_todoCopyWith(
          Hello_todoData_todo value, O Function(Hello_todoData_todo) then) =
      __$Hello_todoData_todoCopyWithImpl<O>;
  O call({String? text});
}

class __$Hello_todoData_todoCopyWithImpl<O>
    extends _$Hello_todoData_todoCopyWithImpl<O>
    implements _$Hello_todoData_todoCopyWith<O> {
  __$Hello_todoData_todoCopyWithImpl(
      Hello_todoData_todo _value, O Function(Hello_todoData_todo) _then)
      : super(_value, (v) => _then(v));

  @override
  Hello_todoData_todo get _value => super._value;

  @override
  O call({Object? text = dimmutable}) {
    return _then(Hello_todoData_todo(
        text: text == dimmutable ? _value.text : text as String?));
  }
}

GraphqlRequestInput<Null> Hello_todoInputDeserializer(dynamic json) {
  return GraphqlRequestInput.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic> Hello_todoDataSerializer(
        int status, Hello_todoData resp) =>
    resp.toJson();

Hello_todoData Hello_todoDataDeserializer(int status, dynamic json) =>
    Hello_todoData.fromJson(json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/",
    graphqlQuery: GraphqlRequestPart(query: """query todo{
      todo {
        text
      } 
    }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: Hello_todoDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: Hello_todoInputDeserializer,
    responseDeserializer: Hello_todoDataDeserializer)
typedef Hello_todo
    = HttpField<GraphqlRequestInput<Null>, Hello_todoData, String>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/",
    graphqlQuery: GraphqlRequestPart(query: """query todo{
      todo {
        text
      } 
    }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: Hello_todoDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: Hello_todoInputDeserializer,
    responseDeserializer: Hello_todoDataDeserializer)
typedef Hello_todoT<T> = HttpField<GraphqlRequestInput<Null>, T, String>;

@JsonSerializable()
class Hello_utData {
  @JsonKey(
      fromJson: Hello_utData_hellou.fromJson,
      toJson: Hello_utData_hellou.toJson)
  final Hello_utData_hellou? hellou;

  @JsonKey(ignore: true)
  _$Hello_utDataCopyWith<Hello_utData> get copyWith =>
      __$Hello_utDataCopyWithImpl<Hello_utData>(this, IdentityFn);

  const Hello_utData({required this.hellou});

  factory Hello_utData.fromJson(Map<String, dynamic> json) =>
      _$Hello_utDataFromJson(json);

  Map<String, dynamic> toJson() => _$Hello_utDataToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Hello_utData && o.hellou == hellou;
  }

  @override
  int get hashCode => hellou.hashCode;

  @override
  String toString() => "Hello_utData(hellou: ${this.hellou})";
}

abstract class $Hello_utDataCopyWith<O> {
  factory $Hello_utDataCopyWith(
          Hello_utData value, O Function(Hello_utData) then) =
      _$Hello_utDataCopyWithImpl<O>;
  O call({Hello_utData_hellou? hellou});
}

class _$Hello_utDataCopyWithImpl<O> implements $Hello_utDataCopyWith<O> {
  final Hello_utData _value;
  final O Function(Hello_utData) _then;
  _$Hello_utDataCopyWithImpl(this._value, this._then);

  @override
  O call({Object? hellou = dimmutable}) {
    return _then(_value.copyWith(
        hellou: hellou == dimmutable
            ? _value.hellou
            : hellou as Hello_utData_hellou?));
  }
}

abstract class _$Hello_utDataCopyWith<O> implements $Hello_utDataCopyWith<O> {
  factory _$Hello_utDataCopyWith(
          Hello_utData value, O Function(Hello_utData) then) =
      __$Hello_utDataCopyWithImpl<O>;
  O call({Hello_utData_hellou? hellou});
}

class __$Hello_utDataCopyWithImpl<O> extends _$Hello_utDataCopyWithImpl<O>
    implements _$Hello_utDataCopyWith<O> {
  __$Hello_utDataCopyWithImpl(
      Hello_utData _value, O Function(Hello_utData) _then)
      : super(_value, (v) => _then(v));

  @override
  Hello_utData get _value => super._value;

  @override
  O call({Object? hellou = dimmutable}) {
    return _then(Hello_utData(
        hellou: hellou == dimmutable
            ? _value.hellou
            : hellou as Hello_utData_hellou?));
  }
}

class Hello_utData_hellou {
  final dynamic _value;
  Hello_utData_hellou.Hello1(Hello_utData_hellou_Hello1 value) : _value = value;
  Hello_utData_hellou_Hello1? get Hello1 => _value is Hello_utData_hellou_Hello1
      ? _value as Hello_utData_hellou_Hello1
      : null;

  static Hello_utData_hellou? fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }

    if (json["__typename"] == "Hello1") {
      return Hello_utData_hellou.Hello1(
          Hello_utData_hellou_Hello1.fromJson(json));
    }
    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }

  static Map<String, dynamic>? toJson(Hello_utData_hellou? value) {
    if (value == null) {
      return null;
    }

    return value._value.toJson() as Map<String, dynamic>;
  }
}

@JsonSerializable()
class Hello_utData_hellou_Hello1 {
  final String one;

  @JsonKey(name: "__typename")
  final String d$___typeName;

  @JsonKey(ignore: true)
  _$Hello_utData_hellou_Hello1CopyWith<Hello_utData_hellou_Hello1>
      get copyWith =>
          __$Hello_utData_hellou_Hello1CopyWithImpl<Hello_utData_hellou_Hello1>(
              this, IdentityFn);

  const Hello_utData_hellou_Hello1(
      {required this.one, required this.d$___typeName});

  factory Hello_utData_hellou_Hello1.fromJson(Map<String, dynamic> json) =>
      _$Hello_utData_hellou_Hello1FromJson(json);

  Map<String, dynamic> toJson() => _$Hello_utData_hellou_Hello1ToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Hello_utData_hellou_Hello1 &&
        o.one == one &&
        o.d$___typeName == d$___typeName;
  }

  @override
  int get hashCode => one.hashCode ^ d$___typeName.hashCode;

  @override
  String toString() =>
      "Hello_utData_hellou_Hello1(one: ${this.one}, d\$___typeName: ${this.d$___typeName})";
}

abstract class $Hello_utData_hellou_Hello1CopyWith<O> {
  factory $Hello_utData_hellou_Hello1CopyWith(Hello_utData_hellou_Hello1 value,
          O Function(Hello_utData_hellou_Hello1) then) =
      _$Hello_utData_hellou_Hello1CopyWithImpl<O>;
  O call({String one, String d$___typeName});
}

class _$Hello_utData_hellou_Hello1CopyWithImpl<O>
    implements $Hello_utData_hellou_Hello1CopyWith<O> {
  final Hello_utData_hellou_Hello1 _value;
  final O Function(Hello_utData_hellou_Hello1) _then;
  _$Hello_utData_hellou_Hello1CopyWithImpl(this._value, this._then);

  @override
  O call({Object? one = dimmutable, Object? d$___typeName = dimmutable}) {
    return _then(_value.copyWith(
        one: one == dimmutable ? _value.one : one as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

abstract class _$Hello_utData_hellou_Hello1CopyWith<O>
    implements $Hello_utData_hellou_Hello1CopyWith<O> {
  factory _$Hello_utData_hellou_Hello1CopyWith(Hello_utData_hellou_Hello1 value,
          O Function(Hello_utData_hellou_Hello1) then) =
      __$Hello_utData_hellou_Hello1CopyWithImpl<O>;
  O call({String one, String d$___typeName});
}

class __$Hello_utData_hellou_Hello1CopyWithImpl<O>
    extends _$Hello_utData_hellou_Hello1CopyWithImpl<O>
    implements _$Hello_utData_hellou_Hello1CopyWith<O> {
  __$Hello_utData_hellou_Hello1CopyWithImpl(Hello_utData_hellou_Hello1 _value,
      O Function(Hello_utData_hellou_Hello1) _then)
      : super(_value, (v) => _then(v));

  @override
  Hello_utData_hellou_Hello1 get _value => super._value;

  @override
  O call({Object? one = dimmutable, Object? d$___typeName = dimmutable}) {
    return _then(Hello_utData_hellou_Hello1(
        one: one == dimmutable ? _value.one : one as String,
        d$___typeName: d$___typeName == dimmutable
            ? _value.d$___typeName
            : d$___typeName as String));
  }
}

GraphqlRequestInput<Null> Hello_utInputDeserializer(dynamic json) {
  return GraphqlRequestInput.fromJson(json as Map<String, dynamic>);
}

Map<String, dynamic> Hello_utDataSerializer(int status, Hello_utData resp) =>
    resp.toJson();

Hello_utData Hello_utDataDeserializer(int status, dynamic json) =>
    Hello_utData.fromJson(json as Map<String, dynamic>);

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/",
    graphqlQuery: GraphqlRequestPart(query: """query hu{
      hellou {
        __typename
        ... on Hello1 {
          one
        }
      }
    }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: Hello_utDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: Hello_utInputDeserializer,
    responseDeserializer: Hello_utDataDeserializer)
typedef Hello_ut = HttpField<GraphqlRequestInput<Null>, Hello_utData, String>;

@HttpRequest(
    method: "POST",
    url: "http://localhost:4000/",
    graphqlQuery: GraphqlRequestPart(query: """query hu{
      hellou {
        __typename
        ... on Hello1 {
          one
        }
      }
    }""", hash: null, useGetForPersist: false),
    responseType: HttpResponseType.JSON,
    headers: {"Content_Type": "applications/josn"},
    responseSerializer: Hello_utDataSerializer,
    inputSerializer: GraphqlRequestInput.toJson,
    inputDeserializer: Hello_utInputDeserializer,
    responseDeserializer: Hello_utDataDeserializer)
typedef Hello_utT<T> = HttpField<GraphqlRequestInput<Null>, T, String>;
