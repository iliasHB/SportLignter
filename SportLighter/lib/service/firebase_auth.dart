import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';
import 'package:flutter_dev_assessment/register_page/view/register_page.dart';
import 'package:get/get.dart';

import '../otp_page.dart';
import '../register_page/model/register_model.dart';
import '../utils/dialogbox.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth;
  FirebaseAuthentication(this._auth);

  Future<void> RegisterWithEmail({
    required String email,
    required String password,
    required BuildContext context, required String username,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      ConfirmEmailVerification(
          context: context,
          message:
              'A verification link has been sent to this email $email. Please verify your email before you proceed}',
          onPressed: () {
            ConfirmEmail(email: email, password: password, context: context, username: username);
          });
      // if (!_auth.currentUser!.emailVerified) {
      //   await verifyUserEmail(context);
      // } else {
      //   Navigator.pushNamed(context, '/registerpage2');
        //Navigator.push(context, Mater)
      //}
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  Future<void> ConfirmEmail({
    required String email,
    required String password,
    required BuildContext context, required String username,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        showSnackBar(context, 'Email has not been verify. Please verify your email!');
        await verifyUserEmail(context); //await verifyUserEmail(context);
      } else {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterpageStep2(email: email, password: password, username:username)));
      }
      //
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  Future<void> LoginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        showSnackBar(context, 'User does not exist. Please Register!');
        await verifyUserEmail(context); //await verifyUserEmail(context);
      } else {
        await _auth.fetchSignInMethodsForEmail(email);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DashboardPage(email: email)));
      }
      //
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  Future<void> UpdateUserEmail({
    required String email,
    required BuildContext context,
  }) async {
    try {
      _auth.currentUser!.updateEmail(email);
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  Future<void> ChangeUserPassword({
    required String password,
    required BuildContext context,
  }) async {
    try {
      _auth.currentUser!.updatePassword(password);
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  Future<void> ForgotPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      _auth.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  // static void UserSignOut({required BuildContext context}) async {
  // try {
  //       _auth.signOut();
  //     } on FirebaseAuthException catch (e) {
  //       showSnackBar(context, e.message);
  //     }
  // }
  Future<void> UserSignOut({
    required BuildContext context,
  }) async {
    await _auth.signOut();
  }

  Future<void> LoginWithPhoneNo(
    String phoneNo,
    BuildContext context,
  ) async {
    TextEditingController codeController = TextEditingController();
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackBar(context, e.message == null ? null : e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          callOtpDialog(
              context: context,
              codeController: codeController,
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim());
                await _auth.signInWithCredential(credential);
                Navigator.of(context).pop();
              });
        }),
        codeAutoRetrievalTimeout: (String verification) {});
  }

  void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message!)));
  }

  verifyUserEmail(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
      //Navigator.pushNamed(context, '/registerpage2');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }
}
