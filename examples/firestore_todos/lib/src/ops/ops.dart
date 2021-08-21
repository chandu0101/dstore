import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dstore/dstore.dart';
import 'package:firestore_todos/src/schema/firestore.dart';

part "ops.dstore.dart";

@FireStoreOps()
class FOps {
  final mRating =
      FireStoreQuery.movies_Movie().orderBy_year(descending: true).limit(2);

  final popA = FireStoreQuery.movies_Movie().limit(5);

  final sc = FireStoreQuery.movies_Movie();
}
