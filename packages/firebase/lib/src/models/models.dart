import 'package:dstore/dstore.dart';
import 'package:firebase_auth/firebase_auth.dart';

part "models.dstore.dart";

@DUnion()
void $_FirebasePhoneVerification(
    PhoneAuthCredential phoneAuthCredential,
    FirebaseAuthException phoneVerificationFailed,
    void Function(
  String verificationId,
  int? forceResendingToken,
)
        codeSent,
    void Function(String verificationId) codeAutoRetrievalTimeout) {}
