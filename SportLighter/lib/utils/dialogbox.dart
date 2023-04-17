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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[300],
                  ),
                  child: TextField(
                    controller: codeController,
                  ),
                )
              ],
            ),
            actions: [TextButton(onPressed: onPressed, child: Text('Verify'))],
          ));
}

void callUpdateEmailPhoneDialog({
  required BuildContext context,
  TextEditingController? emailController,
  VoidCallback? onPressed,
  bool? isEmail,
  TextEditingController? pwdController,
}) {
  final _formKey = GlobalKey<FormState>();
  TextEditingController retypepwdController = TextEditingController();
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: isEmail! ? Text('Enter Email') : Text('Enter Password'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: isEmail
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                // hintText: 'Email',
                                labelText: 'Email',
                                border: InputBorder.none),
                            validator: (email) {
                              if (email == null || email.isEmpty) {
                                return 'Email is empty';
                              } else if (!email.toString().contains('@')) {
                                return 'Email address is not valid';
                              }
                              return null;
                            },
                          ),
                        )
                      : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: TextFormField(
                                controller: pwdController,
                                decoration: const InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none),
                                validator: (password) {
                                  if (password == null || password.isEmpty) {
                                    return 'Password is empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300],
                              ),
                              child: TextFormField(
                                controller: retypepwdController,
                                decoration: const InputDecoration(
                                    hintText: 'Retype-password',
                                    border: InputBorder.none),
                                validator: (retypepassword) {
                                  if (retypepassword == null ||
                                      retypepassword.isEmpty) {
                                    return 'Password is empty';
                                  } else if (retypepassword !=
                                      pwdController!.text) {
                                    return 'Password id not the same';
                                  }
                                  return null;
                                },
                              ),
                            )
                          ],
                        ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      onPressed;
                    }
                  },
                  child: Text('Update'))
            ],
          ));
}


void ConfirmEmailVerification({
  required BuildContext context,
  required message,
  required VoidCallback onPressed,
}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Verify Email'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message),
          ],
        ),
        actions: [TextButton(onPressed: onPressed, child: Text('Done'))],
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
            title: Row(
              children: [
                Text('Update Username'),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                    ))
              ],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                ),
              ],
            ),
            actions: [TextButton(onPressed: onPressed, child: Text('Update'))],
          ));
}
