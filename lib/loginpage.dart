// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:med_reminder/homepage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MedRem"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
              height: 150.0,
              width: 180.0,
              // color: Colors.black,
              padding: EdgeInsets.only(top: 30),
              margin: EdgeInsets.only(top: 100, bottom: 50),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(200)),
              child: Center(child: Image.asset('assets/images/pfp.png'))),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter email-id",
                  hintText: "xyz@gmail.com"),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter Password",
                  hintText: "Password"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            //Gives the button a different color on press.
            style: ButtonStyle(overlayColor:
                MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.greenAccent;
              }
              return null;
            })),
            child: Text(
              "Login",
              style: TextStyle(fontSize: 15),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Forgot Password
            },

            //Gives the button a different color on press.
            style: ButtonStyle(overlayColor:
                MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.redAccent;
              }
              return null;
            })),
            child: Text(
              "Forgot Password",
              style: TextStyle(fontSize: 15),
            ),
          )
        ],
      ),
    );
  }
}
