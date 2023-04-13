import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/register_page/model/register_model.dart';
import 'package:flutter_dev_assessment/service/firebase_auth.dart';

class RegisterController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController pwd = TextEditingController();
  TextEditingController retype_pwd = TextEditingController();

  userRegister(String email, String password, BuildContext context) {
    FirebaseAuthentication(FirebaseAuth.instance).RegisterWithEmail(
        email: email, password: password, context: context);
  }



  void createUser(createUserModel user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
    //EmailAuthProvider.getCredential(email: 'email', password: 'password');
  }

  // void createUser(
  //     {required String name,
  //     required String phoneNo,
  //     required String email,
  //     required String password}) async {
  //   final docUser = FirebaseFirestore.instance.collection('users').doc();
  //   final user = User(
  //       id: docUser.id,
  //       phoneNo: phoneNo,
  //       password: password,
  //       email: email,
  //       name: name,
  //       datetime: DateTime.now());
  //
  //   final json = user.toJson();
  //   await docUser.set(json);
  // }
}
