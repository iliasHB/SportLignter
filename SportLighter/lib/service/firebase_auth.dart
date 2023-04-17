import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';
import 'package:flutter_dev_assessment/interest_page.dart';
import 'package:flutter_dev_assessment/register_page/view/register_page.dart';
import '../utils/dialogbox.dart';
import '../utils/progress_dialog_utils.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth;
  FirebaseAuthentication(this._auth);

  Future<void> RegisterWithEmail({
    required String email,
    required String password,
    required BuildContext context,
    required String username,
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        ProgressDialogUtils.hideProgressDialog();
        ConfirmEmailVerification(
            context: context,
            message:
                'A verification link has been sent to this email "$email". Please verify your email before you proceed',
            onPressed: () {
              ConfirmEmail(
                  email: email,
                  password: password,
                  context: context,
                  username: username);
            });
        await verifyUserEmail(context);
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          if (!_auth.currentUser!.emailVerified) {
            ProgressDialogUtils.hideProgressDialog();
            await verifyUserEmail(context).then((value) {
              ConfirmEmailVerification(
                  context: context,
                  message:
                      'A verification link has been sent to this email "$email". Please verify your email before you proceed',
                  onPressed: () {
                    ConfirmEmail(
                        email: email,
                        password: password,
                        context: context,
                        username: username);
                  });
            });
          } else {
            ProgressDialogUtils.hideProgressDialog();
            ConfirmEmailVerification(
                context: context,
                message:
                    'This "$email" is already verified. Please click done to proceed',
                onPressed: () {
                  ConfirmEmail(
                      email: email,
                      password: password,
                      context: context,
                      username: username);
                });
          }
          break;
        default:
          ProgressDialogUtils.hideProgressDialog();
          showSnackBar(context, e.message);
          break;
      }
    }
  }

  Future<void> ConfirmEmail({
    required String email,
    required String password,
    required BuildContext context,
    required String username,
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        showSnackBar(
            context, 'Email has not been verify. Please verify your email!');
        await verifyUserEmail(context); //await verifyUserEmail(context);
      } else {
        ProgressDialogUtils.hideProgressDialog();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RegisterpageStep2(
                    email: email, password: password, username: username)));
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
                builder: (context) => DashboardPage()));
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

  Future<void> UserSignOut({
    required BuildContext context,
  }) async {
    await _auth.signOut();
  }

  Future<void> LoginWithPhoneNo(
      {required String phoneNo,
      required BuildContext context,
      required bool isLogin,
      required String email,
      required String password,
      required String username}) async {
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
                await _auth.signInWithCredential(credential).then((value) {
                  isLogin
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DashboardPage()))
                      : Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InterestPage(email: email, phoneNo: phoneNo, username: username, password: password)));
                });
              });
        }),
        codeAutoRetrievalTimeout: (String verification) {});
  }

  void showSnackBar(BuildContext context, String? message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message!)));
  }

  Future<void> verifyUserEmail(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }
}
