import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';
import 'package:flutter_dev_assessment/service/firebase_auth.dart';

import 'controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _signInFormKey = GlobalKey<FormState>();

  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Form(
            key: _signInFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: controller.email_phoneNo,
                    decoration: InputDecoration(
                      hintText: '',
                      labelText: 'Email/PhoneNo',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email/phoneNo is empty";
                      }
                      return null;
                    }),
                TextFormField(
                    controller: controller.pwd,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is empty";
                      }
                      return null;
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            handleLogIn(context);
                          },
                          icon: Icon(Icons.input),
                          label: Text('Login')),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text("New to Spotlighter?"),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registerpage');
                    },
                    child: Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleLogIn(BuildContext context) async {
    final password = controller.pwd.text;
    final email_phone = controller.email_phoneNo.text;
    if (_signInFormKey.currentState!.validate()) {
      print('here........');
      controller.createUserLogin(password: password, email_phone: email_phone, context: context);

      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }
}
