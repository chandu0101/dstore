// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'firebase.dart';

// **************************************************************************
// FireStoreSchemaGenerator
// **************************************************************************

class UserReference {
  final DocumentReference docRef;
  UserReference(this.docRef);

  static UserReference fromJson(dynamic docRef) =>
      UserReference(docRef as DocumentReference);

  static dynamic toJson(UserReference mref) => mref.docRef;

  static UserReference? fromJsonOptional(dynamic? docRef) =>
      docRef != null ? UserReference(docRef as DocumentReference) : null;

  static dynamic toJsonOptional(UserReference? mref) => mref?.docRef;

  Future<User?> get([GetOptions? options]) async {
    final snapshot = await docRef.get(options);
    var data = snapshot.data();
    if (data != null) {
      return User.fromJson(data as Map<String, dynamic>);
    }
  }
}

@JsonSerializable(createFactory: false)
class UserUpdate {
  final String? name;

  final double? count;

  final Address? address;

  const UserUpdate({this.name, this.count, this.address});

  Map<String, dynamic> toJson() => _$UserUpdateToJson(this);
}

@JsonSerializable()
class User {
  final String name;

  final double? count;

  final Address? address;

  @JsonKey(ignore: true)
  _$UserCopyWith<User> get copyWith =>
      __$UserCopyWithImpl<User>(this, IdentityFn);

  const User({required this.name, this.count, this.address});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is User &&
        o.name == name &&
        o.count == count &&
        o.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ count.hashCode ^ address.hashCode;

  @override
  String toString() =>
      "User(name: ${this.name}, count: ${this.count}, address: ${this.address})";
}

abstract class $UserCopyWith<O> {
  factory $UserCopyWith(User value, O Function(User) then) =
      _$UserCopyWithImpl<O>;
  O call({String name, double? count, Address? address});
}

class _$UserCopyWithImpl<O> implements $UserCopyWith<O> {
  final User _value;
  final O Function(User) _then;
  _$UserCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? name = dimmutable,
      Object? count = dimmutable,
      Object? address = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String,
        count: count == dimmutable ? _value.count : count as double?,
        address: address == dimmutable ? _value.address : address as Address?));
  }
}

abstract class _$UserCopyWith<O> implements $UserCopyWith<O> {
  factory _$UserCopyWith(User value, O Function(User) then) =
      __$UserCopyWithImpl<O>;
  O call({String name, double? count, Address? address});
}

class __$UserCopyWithImpl<O> extends _$UserCopyWithImpl<O>
    implements _$UserCopyWith<O> {
  __$UserCopyWithImpl(User _value, O Function(User) _then)
      : super(_value, (v) => _then(v));

  @override
  User get _value => super._value;

  @override
  O call(
      {Object? name = dimmutable,
      Object? count = dimmutable,
      Object? address = dimmutable}) {
    return _then(User(
        name: name == dimmutable ? _value.name : name as String,
        count: count == dimmutable ? _value.count : count as double?,
        address: address == dimmutable ? _value.address : address as Address?));
  }
}

class MessageReference {
  final DocumentReference docRef;
  MessageReference(this.docRef);

  static MessageReference fromJson(dynamic docRef) =>
      MessageReference(docRef as DocumentReference);

  static dynamic toJson(MessageReference mref) => mref.docRef;

  static MessageReference? fromJsonOptional(dynamic? docRef) =>
      docRef != null ? MessageReference(docRef as DocumentReference) : null;

  static dynamic toJsonOptional(MessageReference? mref) => mref?.docRef;

  Future<Message?> get([GetOptions? options]) async {
    final snapshot = await docRef.get(options);
    var data = snapshot.data();
    if (data != null) {
      return Message.fromJson(data as Map<String, dynamic>);
    }
  }
}

@JsonSerializable()
class Message {
  const Message();

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() => "Message()";
}

abstract class FireStoreQuery {
  static users_UserQuery users_User() {
    throw Error();
  }
}

abstract class FireStoreGroupQuery {
  static messages_MessageQuery messages_Message() {
    throw Error();
  }
}

class users_UserQuery {
  users_UserQuery limit(int limit) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery limitToLast(int limit) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery orderBy(Object field, {bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery where(
    Object field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery endAtDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery startAtDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery startAfterDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery startAfter(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery endAt(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery endBefore(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery where_name(
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    String? whereIn,
    String? whereNotIn,
  ) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery orderBy_name({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery where_count(
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    double? whereIn,
    double? whereNotIn,
  ) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQuery orderBy_count({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  users_UserQueryDoc doc(String id) {
    throw Error();
  }
}

class users_UserQueryDoc {
  messages_MessageQuery message_Messagesubcol() {
    throw UnimplementedError('This method is only used at compile');
  }
}

class messages_MessageQuery {
  messages_MessageQuery limit(int limit) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery limitToLast(int limit) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery orderBy(Object field, {bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery where(
    Object field, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery endAtDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery startAtDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery startAfterDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery startAfter(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery endAt(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery endBefore(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }
}

class CollectionRefs {
  static final users = FirebaseFirestore.instance
      .collection('users')
      .withConverter<User>(
          fromFirestore: (snapshots, _) => User.fromJson(snapshots.data()!),
          toFirestore: (user, _) => user.toJson());

  static final messages =
      FirebaseFirestore.instance.collectionGroup('messages');
}

@JsonSerializable()
class Address {
  final String name;

  @JsonKey(ignore: true)
  _$AddressCopyWith<Address> get copyWith =>
      __$AddressCopyWithImpl<Address>(this, IdentityFn);

  const Address({required this.name});

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Address && o.name == name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() => "Address(name: ${this.name})";
}

abstract class $AddressCopyWith<O> {
  factory $AddressCopyWith(Address value, O Function(Address) then) =
      _$AddressCopyWithImpl<O>;
  O call({String name});
}

class _$AddressCopyWithImpl<O> implements $AddressCopyWith<O> {
  final Address _value;
  final O Function(Address) _then;
  _$AddressCopyWithImpl(this._value, this._then);

  @override
  O call({Object? name = dimmutable}) {
    return _then(_value.copyWith(
        name: name == dimmutable ? _value.name : name as String));
  }
}

abstract class _$AddressCopyWith<O> implements $AddressCopyWith<O> {
  factory _$AddressCopyWith(Address value, O Function(Address) then) =
      __$AddressCopyWithImpl<O>;
  O call({String name});
}

class __$AddressCopyWithImpl<O> extends _$AddressCopyWithImpl<O>
    implements _$AddressCopyWith<O> {
  __$AddressCopyWithImpl(Address _value, O Function(Address) _then)
      : super(_value, (v) => _then(v));

  @override
  Address get _value => super._value;

  @override
  O call({Object? name = dimmutable}) {
    return _then(
        Address(name: name == dimmutable ? _value.name : name as String));
  }
}

@JsonSerializable(createFactory: false)
class AddressUpdate {
  final String? name;

  const AddressUpdate({required this.name});

  Map<String, dynamic> toJson() => _$AddressUpdateToJson(this);
}
