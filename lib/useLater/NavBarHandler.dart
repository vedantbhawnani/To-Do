// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:med_reminder/useLater/NewMedForm.dart';
import 'package:med_reminder/homepage.dart';
import 'package:med_reminder/models/data.dart';

class NavBarHandler extends StatefulWidget {
  const NavBarHandler({super.key});
  static const String route = "/home";
  @override
  State<NavBarHandler> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<NavBarHandler> {
  int index = 0;

  final _buildbody = <Widget>[HomePage(), NewMedForm(), FlutterLogo()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: index, children: _buildbody),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: index,
          onTap: (x) {
            setState(() {
              index = x;
              DemoMedicines;
            });
          },
          elevation: 16.0,
          showSelectedLabels: true,
          fixedColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.align_horizontal_center_rounded),
              label: "Feed",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_outlined), label: "Add New Med"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today_outlined), label: "Calender"),
          ]),
    );
  }
}
