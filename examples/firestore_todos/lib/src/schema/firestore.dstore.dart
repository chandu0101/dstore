// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'firestore.dart';

// **************************************************************************
// FireStoreSchemaGenerator
// **************************************************************************

class MovieReference {
  final DocumentReference docRef;
  MovieReference(this.docRef);

  static MovieReference fromJson(dynamic docRef) =>
      MovieReference(docRef as DocumentReference);

  static dynamic toJson(MovieReference mref) => mref.docRef;

  static MovieReference? fromJsonOptional(dynamic? docRef) =>
      docRef != null ? MovieReference(docRef as DocumentReference) : null;

  static dynamic toJsonOptional(MovieReference? mref) => mref?.docRef;

  Future<Movie?> get([GetOptions? options]) async {
    final snapshot = await docRef.get(options);
    var data = snapshot.data();
    if (data != null) {
      return Movie.fromJson(data as Map<String, dynamic>);
    }
  }
}

@JsonSerializable(createFactory: false)
class MovieUpdate {
  final String? poster;

  final int? likes;

  final String? title;

  final int? year;

  final String? runtime;

  final String? rated;

  final List<String>? genre;

  @JsonKey(
      fromJson: MessageReference.fromJsonOptional,
      toJson: MessageReference.toJsonOptional)
  final MessageReference? mRef;

  const MovieUpdate(
      {this.poster,
      this.likes,
      this.title,
      this.year,
      this.runtime,
      this.rated,
      this.genre,
      this.mRef});

  Map<String, dynamic> toJson() => _$MovieUpdateToJson(this);
}

@JsonSerializable()
class Movie {
  final String poster;

  final int likes;

  final String title;

  final int year;

  final String runtime;

  final String rated;

  final List<String> genre;

  @JsonKey(fromJson: MessageReference.fromJson, toJson: MessageReference.toJson)
  final MessageReference mRef;

  @JsonKey(ignore: true)
  _$MovieCopyWith<Movie> get copyWith =>
      __$MovieCopyWithImpl<Movie>(this, IdentityFn);

  const Movie(
      {required this.poster,
      required this.likes,
      required this.title,
      required this.year,
      required this.runtime,
      required this.rated,
      required this.genre,
      required this.mRef});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Movie &&
        o.poster == poster &&
        o.likes == likes &&
        o.title == title &&
        o.year == year &&
        o.runtime == runtime &&
        o.rated == rated &&
        o.genre == genre &&
        o.mRef == mRef;
  }

  @override
  int get hashCode =>
      poster.hashCode ^
      likes.hashCode ^
      title.hashCode ^
      year.hashCode ^
      runtime.hashCode ^
      rated.hashCode ^
      genre.hashCode ^
      mRef.hashCode;

  @override
  String toString() =>
      "Movie(poster: ${this.poster}, likes: ${this.likes}, title: ${this.title}, year: ${this.year}, runtime: ${this.runtime}, rated: ${this.rated}, genre: ${this.genre}, mRef: ${this.mRef})";
}

abstract class $MovieCopyWith<O> {
  factory $MovieCopyWith(Movie value, O Function(Movie) then) =
      _$MovieCopyWithImpl<O>;
  O call(
      {String poster,
      int likes,
      String title,
      int year,
      String runtime,
      String rated,
      List<String> genre,
      MessageReference mRef});
}

class _$MovieCopyWithImpl<O> implements $MovieCopyWith<O> {
  final Movie _value;
  final O Function(Movie) _then;
  _$MovieCopyWithImpl(this._value, this._then);

  @override
  O call(
      {Object? poster = dimmutable,
      Object? likes = dimmutable,
      Object? title = dimmutable,
      Object? year = dimmutable,
      Object? runtime = dimmutable,
      Object? rated = dimmutable,
      Object? genre = dimmutable,
      Object? mRef = dimmutable}) {
    return _then(_value.copyWith(
        poster: poster == dimmutable ? _value.poster : poster as String,
        likes: likes == dimmutable ? _value.likes : likes as int,
        title: title == dimmutable ? _value.title : title as String,
        year: year == dimmutable ? _value.year : year as int,
        runtime: runtime == dimmutable ? _value.runtime : runtime as String,
        rated: rated == dimmutable ? _value.rated : rated as String,
        genre: genre == dimmutable ? _value.genre : genre as List<String>,
        mRef: mRef == dimmutable ? _value.mRef : mRef as MessageReference));
  }
}

abstract class _$MovieCopyWith<O> implements $MovieCopyWith<O> {
  factory _$MovieCopyWith(Movie value, O Function(Movie) then) =
      __$MovieCopyWithImpl<O>;
  O call(
      {String poster,
      int likes,
      String title,
      int year,
      String runtime,
      String rated,
      List<String> genre,
      MessageReference mRef});
}

class __$MovieCopyWithImpl<O> extends _$MovieCopyWithImpl<O>
    implements _$MovieCopyWith<O> {
  __$MovieCopyWithImpl(Movie _value, O Function(Movie) _then)
      : super(_value, (v) => _then(v));

  @override
  Movie get _value => super._value;

  @override
  O call(
      {Object? poster = dimmutable,
      Object? likes = dimmutable,
      Object? title = dimmutable,
      Object? year = dimmutable,
      Object? runtime = dimmutable,
      Object? rated = dimmutable,
      Object? genre = dimmutable,
      Object? mRef = dimmutable}) {
    return _then(Movie(
        poster: poster == dimmutable ? _value.poster : poster as String,
        likes: likes == dimmutable ? _value.likes : likes as int,
        title: title == dimmutable ? _value.title : title as String,
        year: year == dimmutable ? _value.year : year as int,
        runtime: runtime == dimmutable ? _value.runtime : runtime as String,
        rated: rated == dimmutable ? _value.rated : rated as String,
        genre: genre == dimmutable ? _value.genre : genre as List<String>,
        mRef: mRef == dimmutable ? _value.mRef : mRef as MessageReference));
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

@JsonSerializable(createFactory: false)
class MessageUpdate {
  final String? createdAt;

  final String? author;

  const MessageUpdate({this.createdAt, this.author});

  Map<String, dynamic> toJson() => _$MessageUpdateToJson(this);
}

@JsonSerializable()
class Message {
  final String createdAt;

  final String author;

  @JsonKey(ignore: true)
  _$MessageCopyWith<Message> get copyWith =>
      __$MessageCopyWithImpl<Message>(this, IdentityFn);

  const Message({required this.createdAt, required this.author});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is Message && o.createdAt == createdAt && o.author == author;
  }

  @override
  int get hashCode => createdAt.hashCode ^ author.hashCode;

  @override
  String toString() =>
      "Message(createdAt: ${this.createdAt}, author: ${this.author})";
}

abstract class $MessageCopyWith<O> {
  factory $MessageCopyWith(Message value, O Function(Message) then) =
      _$MessageCopyWithImpl<O>;
  O call({String createdAt, String author});
}

class _$MessageCopyWithImpl<O> implements $MessageCopyWith<O> {
  final Message _value;
  final O Function(Message) _then;
  _$MessageCopyWithImpl(this._value, this._then);

  @override
  O call({Object? createdAt = dimmutable, Object? author = dimmutable}) {
    return _then(_value.copyWith(
        createdAt:
            createdAt == dimmutable ? _value.createdAt : createdAt as String,
        author: author == dimmutable ? _value.author : author as String));
  }
}

abstract class _$MessageCopyWith<O> implements $MessageCopyWith<O> {
  factory _$MessageCopyWith(Message value, O Function(Message) then) =
      __$MessageCopyWithImpl<O>;
  O call({String createdAt, String author});
}

class __$MessageCopyWithImpl<O> extends _$MessageCopyWithImpl<O>
    implements _$MessageCopyWith<O> {
  __$MessageCopyWithImpl(Message _value, O Function(Message) _then)
      : super(_value, (v) => _then(v));

  @override
  Message get _value => super._value;

  @override
  O call({Object? createdAt = dimmutable, Object? author = dimmutable}) {
    return _then(Message(
        createdAt:
            createdAt == dimmutable ? _value.createdAt : createdAt as String,
        author: author == dimmutable ? _value.author : author as String));
  }
}

abstract class FireStoreQuery {
  static movies_MovieQuery movies_Movie() {
    throw Error();
  }
}

abstract class FireStoreGroupQuery {
  static messages_MessageQuery messages_Message() {
    throw Error();
  }
}

class movies_MovieQuery {
  movies_MovieQuery limit(int limit) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery limitToLast(int limit) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery orderBy(Object field, {bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where(
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

  movies_MovieQuery endAtDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery startAtDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery startAfterDocument(DocumentSnapshot documentSnapshot) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery startAfter(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery endAt(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery endBefore(List<Object?> values) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_poster(
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

  movies_MovieQuery orderBy_poster({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_likes(
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    int? whereIn,
    int? whereNotIn,
  ) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery orderBy_likes({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_title(
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

  movies_MovieQuery orderBy_title({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_year(
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    int? whereIn,
    int? whereNotIn,
  ) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery orderBy_year({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_runtime(
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

  movies_MovieQuery orderBy_runtime({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_rated(
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

  movies_MovieQuery orderBy_rated({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQuery where_genre({
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
  }) {
    throw UnimplementedError('This method is only used at compile');
  }

  movies_MovieQueryDoc doc(String id) {
    throw Error();
  }
}

class movies_MovieQueryDoc {
  messages_MessageQuery messages_Messagesubcol() {
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

  messages_MessageQuery where_createdAt(
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

  messages_MessageQuery orderBy_createdAt({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }

  messages_MessageQuery where_author(
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

  messages_MessageQuery orderBy_author({bool descending = false}) {
    throw UnimplementedError('This method is only used at compile');
  }
}

class CollectionRefs {
  static final movies = FirebaseFirestore.instance
      .collection('movies')
      .withConverter<Movie>(
          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson());

  static final messages =
      FirebaseFirestore.instance.collectionGroup('messages');
}
