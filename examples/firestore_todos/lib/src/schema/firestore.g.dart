// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$MovieUpdateToJson(MovieUpdate instance) =>
    <String, dynamic>{
      'poster': instance.poster,
      'likes': instance.likes,
      'title': instance.title,
      'year': instance.year,
      'runtime': instance.runtime,
      'rated': instance.rated,
      'genre': instance.genre,
      'mRef': MessageReference.toJsonOptional(instance.mRef),
    };

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    poster: json['poster'] as String,
    likes: json['likes'] as int,
    title: json['title'] as String,
    year: json['year'] as int,
    runtime: json['runtime'] as String,
    rated: json['rated'] as String,
    genre: (json['genre'] as List<dynamic>).map((e) => e as String).toList(),
    mRef: MessageReference.fromJson(json['mRef']),
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'poster': instance.poster,
      'likes': instance.likes,
      'title': instance.title,
      'year': instance.year,
      'runtime': instance.runtime,
      'rated': instance.rated,
      'genre': instance.genre,
      'mRef': MessageReference.toJson(instance.mRef),
    };

Map<String, dynamic> _$MessageUpdateToJson(MessageUpdate instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'author': instance.author,
    };

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    createdAt: json['createdAt'] as String,
    author: json['author'] as String,
  );
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'createdAt': instance.createdAt,
      'author': instance.author,
    };
