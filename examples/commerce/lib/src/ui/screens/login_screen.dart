import 'package:commerce/src/store/app_state.dart';
import 'package:commerce/src/store/models/forms.dart';
import 'package:commerce/src/store/pstates/login_screen_state.dart';
import 'package:commerce/src/store/selectors/app_selectors.dart';
import 'package:commerce/src/ui/utils/styles.dart';
import 'package:dstore/dstore.dart';
import 'package:dstore_firebase/firebase.dart';
import 'package:dstore_flutter/dstore_flutter.dart';
import 'package:flutter/material.dart' hide FormField;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(
      children: [
        Material(
          elevation: 5,
          child: Container(
            height: 250,
            width: width,
            decoration: BoxDecoration(
              gradient: Styles.appBackGradient,
            ),
          ),
        ),
        SafeArea(
            child: Card(
          margin: EdgeInsets.only(top: 50, right: 16, left: 16),
          child: Container(
            margin: const EdgeInsets.all(16),
            child: SelectorBuilder<AppState, LoginScreenState>(
                selector: AppSelectors.loginScreen,
                options: UnSubscribeOptions(resetToDefault: true),
                builder: (context, state) {
                  final phoneNumberKey = LoginFormKey.phonenUmber;
                  return (state.phoneVerification.listening ||
                          state.phoneVerification.firstEventArrived)
                      ? const OtpWidget()
                      : DForm(
                          ff: state.loginForm,
                          child: Column(
                            children: [
                              DTextField(
                                name: LoginFormKey.phonenUmber,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  helperText: "Enter Mobile Number",
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              ElevatedButton(
                                  onPressed: state.loginForm
                                          .isFieldKeyValid(phoneNumberKey)
                                      ? () {
                                          context.dispatch(LoginScreenStateActions
                                              .phoneVerification(
                                                  stream: FirebaseAuthUtils
                                                      .loginWithPhone(
                                                          "+91${state.loginForm.value.phonenUmber}")));
                                        }
                                      : null,
                                  child: Text("Continue2"))
                            ],
                          ));
                }),
          ),
        ))
      ],
    ));
  }
}

class OtpWidget extends StatelessWidget {
  const OtpWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SelectorBuilder<AppState, LoginScreenState>(
        selector: AppSelectors.loginScreen,
        builder: (context, state) {
          print("buildg OTP widget");
          return Column(
            children: [
              state.phoneVerification.data?.when(phoneAuthCredential: (cred) {
                    print("Success");
                  }, phoneVerificationFailed: (error) {
                    print("Eror :$error");
                    return Center(
                      child: Text("Error Occurred"),
                    );
                  }, codeSent: (value) {
                    return DForm(
                        ff: state.loginForm!,
                        child: Column(
                          children: [
                            DTextField(
                              name: LoginFormKey.otp,
                              decoration: InputDecoration(
                                  helperText:
                                      "Enter OTP you got to your number"),
                            )
                          ],
                        ));
                  }, codeAutoRetrievalTimeout: (value) {
                    return Text("Timedout");
                  }) ??
                  Center(
                    child: Text("Loading.."),
                  )
            ],
          );
        });
  }
}
