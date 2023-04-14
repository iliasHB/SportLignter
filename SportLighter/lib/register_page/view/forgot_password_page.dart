import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';

import '../../login_page/controller/login_controller.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final _forgotPwdFormKey = GlobalKey<FormState>();
  LoginController controller = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white54,
      // appBar: AppBar(
      //   elevation: 0,
      //   title: Text('Reset Password'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(top: 50, bottom: 30),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                      )),

                  Flexible(
                      flex: 1,
                      child: Column(
                        children: const [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Forgot\nPassword',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                                'Complete this request from the link that will be sent to the email address you provided'),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Form(
                              key: _forgotPwdFormKey,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: TextFormField(
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: InputBorder.none),
                                  validator: (value){
                                    if(value == '' || value!.isEmpty){
                                      return "Email is empty";
                                    }
                                    return null;
                                  },
                                ),
                              )),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                    style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                                    onPressed: () {
                                      handleForgotPassword(context);
                                    },
                                    icon: const Icon(Icons.forward),
                                    label: Text('Send Email')),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleForgotPassword(BuildContext context) async {
    final email = controller.email.text;
    if (_forgotPwdFormKey.currentState!.validate()) {
      controller.forgotPassword(email: email, context: context);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => DashboardPage()));
    }
  }
}
