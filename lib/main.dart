// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:med_reminder/components/AllMeds.dart';
import 'package:med_reminder/useLater/LocationPage.dart';
import 'package:med_reminder/useLater/NavBarHandler.dart';
import 'package:med_reminder/homepage.dart';
import 'loginpage.dart';
import 'utils/NotificationHandler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsHelper.init();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255)),
      debugShowCheckedModeBanner: false,
      title: 'MedRem',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/maps': (context) => LocationPage(),
        '/navbar': (context) => NavBarHandler(),
        '/allMeds': (context) => AllMeds(),
      },
    );
  }
}
