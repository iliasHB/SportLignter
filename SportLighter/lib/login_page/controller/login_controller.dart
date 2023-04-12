import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../service/firebase_auth.dart';

class LoginController {
  TextEditingController email_phoneNo = TextEditingController();
  TextEditingController pwd = TextEditingController();

  void createUserLogin(
      {required String password,
      required String email_phone,
      required BuildContext context}) {
    FirebaseAuthentication(FirebaseAuth.instance).LoginWithEmail(
        email: email_phone, password: password, context: context);
  }
}
