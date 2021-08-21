import 'dart:async';

import 'package:dstore_firebase/src/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthUtils {
  static Stream<FirebasePhoneVerification> loginWithPhone(String number,
      {Duration timeout = const Duration(seconds: 30)}) {
    final scontroller = StreamController<FirebasePhoneVerification>();
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: number,
        timeout: timeout,
        verificationCompleted: (value) {
          print("Verification done");
          scontroller.sink
              .add(FirebasePhoneVerification.phoneAuthCredential(value));
          // scontroller.close();
        },
        codeSent: (verificationId, forceResendingToken) {
          print("Code sent");
          scontroller.sink.add(FirebasePhoneVerification.codeSent(
              verificationId: verificationId,
              forceResendingToken: forceResendingToken));
        },
        verificationFailed: (error) {
          scontroller.sink
              .add(FirebasePhoneVerification.phoneVerificationFailed(error));
          scontroller.close();
        },
        codeAutoRetrievalTimeout: (verificationId) {
          scontroller.sink.add(
              FirebasePhoneVerification.codeAutoRetrievalTimeout(
                  verificationId: verificationId));
        });
    return scontroller.stream;
  }
}
