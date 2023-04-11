import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/interest_page.dart';

import '../controller/register_controller.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _registerFormKey = GlobalKey<FormState>();
  RegisterController controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Form(
            key: _registerFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller.email,
                  decoration: InputDecoration(
                    hintText: 'example@developer.com',
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.phoneNo,
                  decoration: const InputDecoration(
                    hintText: 'phone number',
                    labelText: 'Phone number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.pwd,
                  decoration: const InputDecoration(
                    hintText: 'password',
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.retype_pwd,
                  decoration: const InputDecoration(
                    hintText: 'retype password',
                    labelText: 'Retype-password',
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value != controller.pwd.text) {
                      return "Password is not the same";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                          onPressed: () {
                            handleRegister(context);
                          },
                          icon: const Icon(Icons.forward),
                          label: Text('Register')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Already have an account?"),
                OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void handleRegister(BuildContext context) async {
    if (_registerFormKey.currentState!.validate()) {
      controller.userRegister(controller.email.text, controller.retype_pwd.text);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => InterestPage()));
    }
  }
  
}
