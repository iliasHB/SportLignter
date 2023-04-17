import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../register_page/model/register_model.dart';
import '../../utils/appBarHaader_util.dart';
import '../../utils/app_decoration.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHeader(title: 'Profile'),
      // backgroundColor: Colors.white,
      body: ListView(
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
                          "https://source.unsplash.com/random?img=1"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Habeeb Soliu A.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    '@createbyhabeeb',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Football | Long Tennis | Cricket | Rugby | Brandy | Basketball',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
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
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Interest',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
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
                                Icon(Icons.sports_baseball),
                                Text('Football'),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.clear_rounded))
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
                                Icon(Icons.sports_basketball_rounded),
                                Text('Basketball'),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.clear_rounded))
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
                                Icon(Icons.sports_volleyball),
                                Text('Volley ball'),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.clear_rounded))
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
                                Icon(Icons.sports_rugby),
                                Text('Rugby'),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.clear_rounded))
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
                                Icon(Icons.sports_baseball_outlined),
                                Text('Long Tennis'),
                              ],
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.clear_rounded))
                          ],
                        ),
                      ))
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Stream<List<createUserModel>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs
      .map((doc) => createUserModel.fromJson(doc.data()))
      .toList());
}