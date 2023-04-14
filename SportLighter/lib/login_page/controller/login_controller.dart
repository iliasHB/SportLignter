import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../service/firebase_auth.dart';

class LoginController {
  TextEditingController email_phoneNo = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController email = TextEditingController();
  void createUserLogin(
      {required String password,
      required String email_phone,
      required BuildContext context}) {
    if (email_phoneNo.text.contains('@')) {
      FirebaseAuthentication(FirebaseAuth.instance).LoginWithEmail(
          email: email_phone, password: password, context: context);
    } else {
      FirebaseAuthentication(FirebaseAuth.instance)
          .LoginWithPhoneNo(email_phone, context);
    }
  }

  void forgotPassword({required String email, required BuildContext context}) {
    FirebaseAuthentication(FirebaseAuth.instance)
        .ForgotPassword(email: email, context: context);
  }
}
