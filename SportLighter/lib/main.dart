import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_assessment/firebase_options.dart';
import 'package:flutter_dev_assessment/interest_page.dart';
import 'package:flutter_dev_assessment/register_page/view/register_page.dart';

import 'dashboard_page.dart';
import 'login_page/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer Assessment',
      theme: ThemeData(primarySwatch: Colors.blue,),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        '/registerpage': (BuildContext context) => RegisterPage(),
        '/interestpage': (BuildContext context) => InterestPage(),
        '/dashboardpage': (BuildContext context) => const DashboardPage(),
      }
      //home: const MyHomePage(title: ''),
    );
  }
}

