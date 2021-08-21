import "package:dstore/dstore.dart";
import 'package:firebase_auth/firebase_auth.dart';
import "package:meta/meta.dart";

part "auth.ps.dstore.dart";

@PState()
class $_DFirebaseAuth {
  StreamField<User, Object> user = StreamField();
}
