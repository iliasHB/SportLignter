import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController email_phoneNoController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
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
                    controller: email_phoneNoController,
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
                    controller: pwdController,
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
                            handleSignIn(context);
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

  void handleSignIn(BuildContext context) async {
    if (_signInFormKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }
}
