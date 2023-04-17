import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/dashboard_page.dart';
import 'package:flutter_dev_assessment/otp_page.dart';
import 'package:flutter_dev_assessment/register_page/model/register_model.dart';
import 'package:flutter_dev_assessment/utils/app_decoration.dart';
import 'package:flutter_dev_assessment/utils/app_style.dart';
import 'package:flutter_dev_assessment/utils/prefs_util.dart';

class InterestPage extends StatefulWidget {
  final String phoneNo, email, username, password;
  const InterestPage(
      {Key? key,
      required this.email,
      required this.phoneNo,
      required this.username,
      required this.password})
      : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  PrefUtils prefUtils = PrefUtils();
  bool isFootball = false,
      isBasketball = false,
      isLongTennis = false,
      isIceHockey = false,
      isMotorsport = false,
      isBandy = false,
      isRugby = false,
      isSkiing = false,
      isShooting = false,
      isSnooker = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Choose your interest',
          style: AppStyle.pagetitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFootball = !isFootball;
                        isFootball
                            ? prefUtils.setStringList(
                                'userInterest', <String>['Football'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isFootball ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Football',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isBasketball = !isBasketball;
                        isBasketball
                            ? prefUtils.setStringList(
                                'userInterest', <String>['Basketball'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: AppDecoration.interestDecoration,
                      child: Text(
                        'Basketball',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isLongTennis = !isLongTennis;
                        isLongTennis
                            ? prefUtils.setStringList(
                            'userInterest', <String>['LongTennis'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isLongTennis ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Long Tennis',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isIceHockey = !isIceHockey;
                        isIceHockey
                            ? prefUtils.setStringList(
                            'userInterest', <String>['IceHockey'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isIceHockey ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Ice Hockey',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isMotorsport = !isMotorsport;
                        isMotorsport
                            ? prefUtils.setStringList(
                            'userInterest', <String>['Motorsport'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isMotorsport ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Motorsport',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isBandy = !isBandy;
                        isBandy
                            ? prefUtils.setStringList(
                            'userInterest', <String>['Bandy'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isBandy ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Bandy',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isRugby = !isRugby;
                        isRugby
                            ? prefUtils.setStringList(
                            'userInterest', <String>['Rugby'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isRugby ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Rugby',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSkiing = !isSkiing;
                        isSkiing
                            ? prefUtils.setStringList(
                            'userInterest', <String>['Skiing'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isSkiing ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Skiing',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isShooting = !isShooting;
                        isShooting
                            ? prefUtils.setStringList(
                            'userInterest', <String>['Shooting'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isShooting ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Shooting',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isSnooker = !isSnooker;
                        isSnooker
                            ? prefUtils.setStringList(
                            'userInterest', <String>['Snooker'])
                            : null;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: isSnooker ? Colors.blueGrey : Colors.white,
                      ),
                      child: Text(
                        'Snooker',
                        style: AppStyle.intereststyle,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          final user = createUserModel(
                              phoneNo: widget.phoneNo,
                              password: widget.password,
                              email: widget.email.toLowerCase(),
                              name: widget.username,);
                          createUser(user, context);
                        },
                        child: const Text('Continue')),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createUser(createUserModel user, BuildContext context) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id;
    final json = user.toJson();
    await docUser.set(json);

    // ignore: use_build_context_synchronously
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardPage()));
    //EmailAuthProvider.getCredential(email: 'email', password: 'password');
  }
}
