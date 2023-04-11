import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/utils/appBarHaader_util.dart';
import 'package:flutter_dev_assessment/utils/app_decoration.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Buddies',
      style: optionStyle,
    ),
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
        onTap: _onItemTapped
      ),
    );
  }

}


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
                  style:
                  TextStyle(color: Colors.black, fontSize: 16),
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
                      child: Icon(Icons.camera_alt,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.bookmark_border,
                        color: Colors.black),
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
                child: Text('Interest', textAlign: TextAlign.center,
                  style:
                  TextStyle(color: Colors.black, fontSize: 20),),
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
                                onPressed: (){},
                                icon: Icon(Icons.clear_rounded))
                          ],
                        ),

                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
                                onPressed: (){},
                                icon: Icon(Icons.clear_rounded))
                          ],
                        ),

                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
                                onPressed: (){},
                                icon: Icon(Icons.clear_rounded))
                          ],
                        ),

                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
                                onPressed: (){},
                                icon: Icon(Icons.clear_rounded))
                          ],
                        ),

                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
                                onPressed: (){},
                                icon: Icon(Icons.clear_rounded))
                          ],
                        ),

                      )
                  )
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: Icon(Icons.add),
      ),
    );
  }
}


class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarHeader(title: 'Setting'),
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
                  style:
                  TextStyle(color: Colors.black, fontSize: 16),
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
                      child: Icon(Icons.camera_alt,
                          color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.bookmark_border,
                        color: Colors.black),
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
                               onPressed: (){},
                               icon: Icon(Icons.edit))
                         ],
                       ),

                     )
                 )
               ],
             ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
                                onPressed: (){},
                                icon: Icon(Icons.edit))
                          ],
                        ),

                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
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
                                onPressed: (){},
                                icon: Icon(Icons.edit))
                          ],
                        ),

                      )
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 20.0, left: 20.0, bottom: 20.0),
                        padding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 5.0),
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

                      )
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}




