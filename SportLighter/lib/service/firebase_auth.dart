import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../otp_page.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth;
  FirebaseAuthentication(this._auth);
  Future<void> RegisterWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      // if (!_auth.currentUser!.emailVerified) {
      //   await verifyUserEmail(context);
      // }
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await verifyUserEmail(context);
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
        await verifyUserEmail(context);
      }
      //
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
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
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }
}

void callOtpDialog({
  required BuildContext context,
  required TextEditingController codeController,
  required VoidCallback onPressed,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Text('Enter Otp'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: codeController,
                )
              ],
            ),
            actions: [TextButton(onPressed: onPressed, child: Text('Verify'))],
          ));
}
