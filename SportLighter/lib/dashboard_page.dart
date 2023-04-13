import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/login_page/login_page.dart';
import 'package:flutter_dev_assessment/register_page/model/register_model.dart';
import 'package:flutter_dev_assessment/service/firebase_auth.dart';
import 'package:flutter_dev_assessment/utils/appBarHaader_util.dart';
import 'package:flutter_dev_assessment/utils/app_decoration.dart';
import 'package:flutter_dev_assessment/utils/dialogbox.dart';

class DashboardPage extends StatefulWidget {
  Object? data;
  DashboardPage({Key? key, this.data}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    BuddiesPage(),
    Text(
      'Index 1: Discovery',
      style: optionStyle,
    ),
    ProfilePage(),
    Setting()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.group),
              label: 'Buddies',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.compass),
              label: 'Discovery',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[900],
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          onTap: _onItemTapped),
    );
  }
}

final emailController = TextEditingController();
final pwdController = TextEditingController();
final nameController = TextEditingController();

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
                          "https://source.unsplash.com/random?sig=1"),
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: Container(
              //         alignment: Alignment.centerRight,
              //         //color: Colors.red,
              //         child: Column(
              //           children: const [
              //             Text(
              //               '37',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 24),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Following',
              //               style:
              //               TextStyle(color: Colors.grey, fontSize: 15),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         //color: Colors.blue,
              //         child: Column(
              //           children: const [
              //             Text(
              //               '8',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 24),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               'Followers',
              //               style:
              //               TextStyle(color: Colors.grey, fontSize: 15),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         alignment: Alignment.centerLeft,
              //         //color: Colors.green,
              //         child: Column(
              //           children: const [
              //             Text(
              //               '45',
              //               style: TextStyle(
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 24),
              //             ),
              //             SizedBox(
              //               height: 5,
              //             ),
              //             Text(
              //               ' Likes ',
              //               style:
              //               TextStyle(color: Colors.grey, fontSize: 15),
              //             )
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ),
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

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
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
              return Center(
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
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
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
                              callUpdateEmailDialog(
                                  context: context,
                                  emailController: emailController,
                                  pwdController: pwdController,
                                  onPressed: () {
                                    final email = emailController.text;
                                    final password = pwdController.text;
                                    FirebaseAuthentication(
                                            FirebaseAuth.instance)
                                        .UpdateUserEmail(
                                            email: email,
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
    final docUser = FirebaseFirestore.instance
        .collection('users')
        .doc('8yzFWejrHOYkYjv6qPV4');
    final snapshots = await docUser.get();
    if (snapshots.exists) {
      return createUserModel.fromJson(snapshots.data()!);
    }
  }
}

class BuddiesPage extends StatelessWidget {
  const BuddiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarHeader(title: 'Buddies'),
      body: StreamBuilder<List<createUserModel>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong! $snapshot'),
            );
          } else if (snapshot.hasData) {
            final users = snapshot.data!;
            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget buildUser(createUserModel user) => ListTile(
        leading: CircleAvatar(
          child: Text('me'),
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
      );
  Stream<List<createUserModel>> readUsers() => FirebaseFirestore.instance
      .collection('users')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => createUserModel.fromJson(doc.data()))
          .toList());
}
