import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dstore/dstore.dart';
import 'package:dstore_firebase/firebase.dart';
import 'collections.dart';
import "package:json_annotation/json_annotation.dart";

part "firestore.dstore.dart";
part "firestore.g.dart";

@FireStoreSchema()
class FSchema {
  late FCollections collections;
}
