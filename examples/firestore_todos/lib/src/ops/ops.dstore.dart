// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ops.dart';

// **************************************************************************
// FireStoreOpsGenerator
// **************************************************************************

class ps {
  static final mRating = FirebaseFirestore.instance
      .collection('movies')
      .withConverter<Movie>(
          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson())
      .orderBy('year', descending: true)
      .limit(2);
  static final popA = FirebaseFirestore.instance
      .collection('movies')
      .withConverter<Movie>(
          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson())
      .limit(5);
  static final sc = FirebaseFirestore.instance
      .collection('movies')
      .withConverter<Movie>(
          fromFirestore: (snapshots, _) => Movie.fromJson(snapshots.data()!),
          toFirestore: (movie, _) => movie.toJson());
}
