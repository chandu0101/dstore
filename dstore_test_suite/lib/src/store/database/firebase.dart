import 'package:dstore/dstore.dart';
import 'package:dstore_test_suite/src/store/database/collections.dart';
import "package:cloud_firestore/cloud_firestore.dart";
part "firebase.dstore.dart";
part "firebase.g.dart";

@FireStoreSchema(rulesPath: "./firestore-rules")
class FSSchema {
  late Collections collections;
  late NestedObjects nestedObjects;
}
