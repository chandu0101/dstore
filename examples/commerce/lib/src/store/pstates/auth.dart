import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dstore/dstore.dart';
import 'package:dstore_firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:meta/meta.dart";

part "auth.ps.dstore.dart";

@PState()
class $_Auth {
  bool loggedout = false;

  StreamField<User?, Object> user = StreamField();

  String? verificationId;

  DocumentSnapshot? userDetails;

  void getUserDetails() async {
    final documentSnapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(this.user.data!.uid)
        .collection("account")
        .doc("details")
        .get();
    this.userDetails = documentSnapshot;
  }

  void signout() async {
    await FirebaseAuth.instance.signOut();
    this.loggedout = true;
  }

  void setVerificationId(String verificationId) {
    this.verificationId = verificationId;
  }
}
