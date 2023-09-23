// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../sizeconfig.dart';
import 'IconNoCounter.dart';

class NotificationCenter extends StatelessWidget {
  const NotificationCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Container(
        margin: EdgeInsets.all(0),
        height: getProportionateScreenHeight(90),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(27), topRight: Radius.circular(27)),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              child: Text.rich(TextSpan(
                  text: "You've 1 notification\n",
                  style: TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                        text: "View reminders",
                        style: TextStyle(color: Colors.blueGrey[700]),
                        recognizer: TapGestureRecognizer()..onTap = () {})
                  ])),
            ),
            Row(
              children: [
                IconNoCounter(
                  strsvg: 'assests/images/notification-bell.svg',
                  num: 1,
                  press: () {},
                ),
                Container(
                  height: getProportionateScreenHeight(30),
                  width: getProportionateScreenWidth(30),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red[300]),
                  child: Center(
                      child: Text(
                    "1",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(15),
                        fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
