import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/interest_page.dart';

import '../../service/firebase_auth.dart';
import '../controller/register_controller.dart';
import '../model/register_model.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  final _registerFormKey = GlobalKey<FormState>();
  RegisterController controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Form(
              key: _registerFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Container(
                  //       margin: EdgeInsets.only(bottom: 30),
                  //       child: IconButton(
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //           icon: Icon(
                  //             Icons.arrow_back,
                  //             color: Colors.black,
                  //           )),
                  //     )),
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'SportLighter',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),

                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                                'Flutter Development Assessment.'),
                          ),
                          Text('Registration - Step One', style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w400),),
                        ],
                      )),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                    child: TextFormField(
                      controller: controller.name,
                      decoration: const InputDecoration(
                        hintText: '',
                        labelText: 'Username',
                        border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "name is empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.grey[200],
                                        ),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                    hintText: 'example@developer.com',
                                    labelText: 'Email',
                                    border: InputBorder.none
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){
                                    //handleEmailVerification(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.bottomRight,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                    child: Text('Verify', style: TextStyle(color: Colors.blue)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                    child: TextFormField(
                      controller: controller.pwd,
                      decoration: const InputDecoration(
                        hintText: 'password',
                        labelText: 'Password',
                        border: InputBorder.none
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is empty";
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[200],
                                  ),
                    child: TextFormField(
                      controller: controller.retype_pwd,
                      decoration: const InputDecoration(
                        hintText: 'retype password',
                        labelText: 'Retype-password',
                        border: InputBorder.none
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                            onPressed: () {
                              //handleRegister(context);
                              handleEmailVerification(context);
                            },
                            icon: const Icon(Icons.forward),
                            label: Text('Container')),
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
      ),
    );
  }

  void handleRegister(BuildContext context) async {

    final name = controller.name.text;
    final phoneNo = controller.phoneNo.text;
    final email = controller.email.text;
    final password = controller.retype_pwd.text;
    // final user = createUserModel(phoneNo: phoneNo, password: password, email: email, name: name, datetime: DateTime.now());
    // if (_registerFormKey.currentState!.validate()) {
    //   controller.createUser(user);
    //   // Navigator.push(
    //   //     context, MaterialPageRoute(builder: (context) => InterestPage()));
    // }
    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => RegisterpageStep2()));
  }

  void handleEmailVerification(BuildContext context) {
    final username = controller.name.text;
    final phoneNo = controller.phoneNo.text;
    final email = controller.email.text;
    final password = controller.retype_pwd.text;
    if (_registerFormKey.currentState!.validate()) {
      controller.userRegister(email, password, context, username, phoneNo,  );
    }
  }

  
}



class RegisterpageStep2 extends StatelessWidget {
  final String email, password, username;
  RegisterpageStep2({Key? key, required this.email, required this.password, required this.username}) : super(key: key);

  final _regFormKey = GlobalKey<FormState>();
  RegisterController controller = RegisterController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: Form(
              key: _regFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                      )),
                  Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'SportLighter',
                                style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                                'Flutter Development Assessment.\nRegister here.'),
                          ),
                          Text('Registration - Final', style: TextStyle(color: Colors.blueGrey, fontSize: 16, fontWeight: FontWeight.w400),),
                        ],
                      )),
                  Row(
                    children: [
                      Flexible(
                        child: Container(
                          margin: EdgeInsets.only(top: 10),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  controller: controller.phoneNo,
                                  decoration: InputDecoration(
                                      hintText: 'Phone number',
                                      labelText: 'Phone Number',
                                      border: InputBorder.none
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Email is empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: InkWell(
                                  onTap: (){
                                    handlePhoneVerification(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 5),
                                    alignment: Alignment.bottomRight,
                                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                                    child: Text('Verify', style: TextStyle(color: Colors.blue)),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                            style: ButtonStyle(padding: MaterialStatePropertyAll(EdgeInsets.all(15))),
                            onPressed: () {
                              //handleRegister(context);
                            },
                            icon: const Icon(Icons.forward),
                            label: Text('Continue')),
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
      ),
    );
  }


  void handlePhoneVerification(BuildContext context) {
    final phone = controller.phoneNo.text;
    FirebaseAuthentication(FirebaseAuth.instance)
        .LoginWithPhoneNo(phone, context);
    final user = createUserModel(phoneNo: phone, password: password, email: email, name: username, datetime: DateTime.now());
      createUser(user);
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => InterestPage()));
  }
  void createUser(createUserModel user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);
    //EmailAuthProvider.getCredential(email: 'email', password: 'password');
  }
}

