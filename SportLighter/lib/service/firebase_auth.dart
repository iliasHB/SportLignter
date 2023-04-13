import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';

import '../otp_page.dart';
import '../register_page/model/register_model.dart';
import '../utils/dialogbox.dart';

class FirebaseAuthentication {
  final FirebaseAuth _auth;
  FirebaseAuthentication(this._auth);

  Future<void> RegisterWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
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
        showSnackBar(
            context, 'User does not exist!'); //await verifyUserEmail(context);
      } else {
        FirebaseFirestore.instance
            .collection('users')
            .where('email', isEqualTo: email)
            .get()
            .then((DocumentSnapshot documentSnapshot) {
          if (documentSnapshot.exists) {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => DashboardPage(data: documentSnapshot.data())));
            return createUserModel.fromJson(documentSnapshot.data());
            //print('Document data: ${documentSnapshot.data()}');
          } else {
            print('Document does not exist on the database');
          }

        } as FutureOr Function(QuerySnapshot<Map<String, dynamic>> value));
      }
      //
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message);
    }
  }

  Future<void> UpdateUserEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      //EmailAuthProvider.credential(email: email, password: password);
      _auth.currentUser!.updateEmail(email);
      _auth.currentUser!.updatePassword(password);
      //await verifyUserEmail(context);
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
    //try {
    await _auth.signOut();
    // } on FirebaseAuthException catch (e) {
    //   showSnackBar(context, e.message);
    // }
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
