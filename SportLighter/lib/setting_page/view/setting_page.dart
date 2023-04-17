import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/setting_page/controller/setting_controller.dart';
import 'package:flutter_dev_assessment/utils/appBarHaader_util.dart';

import '../../register_page/model/register_model.dart';
import '../../service/firebase_auth.dart';
import '../../utils/app_decoration.dart';
import '../../utils/dialogbox.dart';
import '../../utils/prefs_util.dart';
import '../../utils/progress_dialog_utils.dart';

class Setting extends StatefulWidget {
  Setting({Key? key,}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final emailController = TextEditingController();

  final pwdController = TextEditingController();

  final nameController = TextEditingController();

  SettingController controller = SettingController();
  FirebaseAuth? _auth;
  PrefUtils prefUtils = PrefUtils();
  List<String>? userInterest;
  createUserModel? userData;
  void initState() {
    super.initState();
    // var email = _auth?.currentUser!.email;
    //
    // print(">>>>> email: "+email!);
    //getUserInterest();
  }

  // getUserInterest() async {
  //   userInterest = await prefUtils.getStringList('userMeterData');
  //   setState(() {
  //     for (int i = 0; i < userInterest!.length; i++) {
  //       print('----------user Interest-----------');
  //       print(userInterest![i]);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHeader(title: 'Setting'),
      // backgroundColor: Colors.white,
      body: FutureBuilder<createUserModel?>(
          future: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Something went wrong! $snapshot'),
              );
            } else if (snapshot.hasData) {
              final user = snapshot.data!;
              return user == null
                  ? Center(
                      child: Text('No user'),
                    )
                  : buildUser(user, context);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget buildUser(createUserModel user, BuildContext context) => ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://source.unsplash.com/random?sig=1"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    user.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    user.email,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              //for (int i = 0; i < userInterest!.length; i++)
              Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                            text: 'ghh',//userInterest![i].toString() +'|',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16)),
                        TextSpan(text: '|'),
                      ],
                    ),
                  )
                  // Text(
                  //   userInterest.toString(),
                  //   //'Football | Long Tennis | Cricket | Rugby | Brandy | Basketball',
                  //   textAlign: TextAlign.center,
                  //   style: TextStyle(color: Colors.black, fontSize: 16),
                  // ),
                  ),
              SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 15.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                    child: const Text(
                      'Edit profile',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(Icons.camera_alt, color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.bookmark_border, color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(20.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: AppDecoration.interestDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.lock_outline_rounded),
                            Text('Change Password'),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              callUpdateEmailPhoneDialog(
                                  context: context,
                                  pwdController: pwdController,
                                  isEmail: false,
                                  onPressed: () {
                                    final password = pwdController.text;
                                    FirebaseAuthentication(
                                            FirebaseAuth.instance)
                                        .ChangeUserPassword(
                                            password: password,
                                            context: context)
                                        .then((value) =>
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    content: Text('Success'))))
                                        .catchError((onError) =>
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(SnackBar(
                                                    content: Text(onError))));
                                  });
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: AppDecoration.interestDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email_outlined),
                            Text('Update Email'),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              callUpdateEmailPhoneDialog(
                                context: context,
                                emailController: emailController,
                                isEmail: true,
                                onPressed: () {
                                  final email = emailController.text;
                                  FirebaseAuthentication(FirebaseAuth.instance)
                                      .UpdateUserEmail(
                                          email: email, context: context)
                                      .then((value) =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text('Success'))))
                                      .catchError((onError) =>
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(onError))));
                                },
                              );
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
                    padding: EdgeInsets.all(5.0),
                    decoration: AppDecoration.interestDecoration,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.perm_identity),
                            Text('Update Username'),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              callUpdateUsernameDialog(
                                  context: context,
                                  nameController: nameController,
                                  onPressed: () {
                                    final name = nameController.text;
                                    final docUser = FirebaseFirestore.instance
                                        .collection('users')
                                        .doc('8yzFWejrHOYkYjv6qPV4');
                                    docUser.update({'name': name});
                                  });
                            },
                            icon: Icon(Icons.edit))
                      ],
                    ),
                  ))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      FirebaseAuthentication(FirebaseAuth.instance)
                          .UserSignOut(context: context)
                          .then((value) => Navigator.pushNamed(context, '/'))
                          .onError((error, stackTrace) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('logout failed')))
                              });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: 20.0, left: 20.0, bottom: 20.0),
                      padding:
                          EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0),
                      decoration: AppDecoration.interestDecoration,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.logout),
                              Text('Logout'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
                ],
              )
            ],
          ),
        ],
      );

  Future<createUserModel?> readUser() async {
    var email = "abeeb.ilias@gmail.com";
    // setState(() {
    //   email = _auth.currentUser!.email;
    //   print(">>>>> email: "+email);
    // });
    print(">>>>> email: "+email!);

    return FirebaseFirestore.instance
        .collection('users').withConverter(
        fromFirestore: createUserModel.fromFirestore, toFirestore: (createUserModel user, _) => user.toFirestore())
        .where('email', isEqualTo: email)
        .get().then((documentSnapshot) {
          if (documentSnapshot.docs.isNotEmpty){
            var userData = documentSnapshot.docs.first.data();
            setState(() {
              userData;
              print(userData.email);
              print(userData.phoneNo);
            });
          }
    });

    //var email = '6cRhMG70Hdc4opPhk7ro';//
    // final docUser =
    //     FirebaseFirestore.instance.collection('users').doc(email);
    // final snapshots = await docUser.get();
    // if (snapshots.exists) {
    //   return createUserModel.fromJson(snapshots.data()!);
    // }
///-----------------------------

    //     .then((DocumentSnapshot documentSnapshot) {
    //   if (documentSnapshot.exists) {
    //     // Navigator.push(
    //     //     context, MaterialPageRoute(builder: (context) => DashboardPage(data: documentSnapshot.data())));
    //     return createUserModel.fromJson(documentSnapshot.data());
    //     // print('------------------------');
    //     // print('Document data: ${documentSnapshot.data()}');
    //   } else {
    //     print('Document does not exist on the database');
    //   }
    // }
  }
}
