import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/login_page/login_page.dart';
import 'package:flutter_dev_assessment/profile_page/view/profile_page.dart';
import 'package:flutter_dev_assessment/register_page/model/register_model.dart';
import 'package:flutter_dev_assessment/service/firebase_auth.dart';
import 'package:flutter_dev_assessment/setting_page/view/setting_page.dart';
import 'package:flutter_dev_assessment/utils/appBarHaader_util.dart';
import 'package:flutter_dev_assessment/utils/app_decoration.dart';
import 'package:flutter_dev_assessment/utils/dialogbox.dart';

class DashboardPage extends StatefulWidget {
  final String email;
  const DashboardPage({Key? key, required this.email}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  final List<Widget> _widgetOptions = <Widget>[
    const BuddiesPage(),
    const Text(
      'Index 1: Discovery',
      style: optionStyle,
    ),
    const ProfilePage(),
    Setting(email: '')
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget _listViewBody() {
    return ListView.separated(
        controller: _homeController,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: Text(
              'Item $index',
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1,
        ),
        itemCount: 50);
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
          onTap: _onItemTapped,
            //   (int index) {
            // switch (index) {
          //     case 0:
          //       BuddiesPage();
          //     // only scroll to top when current index is selected.
          //     //   if (_selectedIndex == index) {
          //     //     _homeController.animateTo(
          //     //       0.0,
          //     //       duration: const Duration(milliseconds: 500),
          //     //       curve: Curves.easeOut,
          //     //     );
          //     //   }
          //       break;
          //     case 1:
          //       Text(
          //         'Index 1: Discovery',
          //         style: optionStyle,
          //       );
          //       break;
          //     case 2:
          //       ProfilePage();
          //       break;
          //     case 3:
          //       Setting();
          //       break;
          //   }
          //   setState(
          //         () {
          //       _selectedIndex = index;
          //     },
          //   );
          // },
      ),
    );
  }

}

final emailController = TextEditingController();
final pwdController = TextEditingController();
final nameController = TextEditingController();



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
