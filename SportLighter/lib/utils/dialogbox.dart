import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/service/firebase_auth.dart';

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

void callUpdateEmailDialog({
  required BuildContext context,
  required TextEditingController emailController,
  required TextEditingController pwdController,
  required VoidCallback onPressed,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: Text('Enter Email'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: emailController,
                ),
                TextField(
                  controller: pwdController,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: onPressed,
                  child: Text('Update'))
            ],
          ));
}

void callUpdateUsernameDialog({
  required BuildContext context,
  required TextEditingController nameController,
  required VoidCallback onPressed,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Update Username'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: onPressed,
              child: Text('Update'))
        ],
      ));
}
