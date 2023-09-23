// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../sizeconfig.dart';

class HealthCheckContainer extends StatelessWidget {
  const HealthCheckContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: getProportionateScreenHeight(180),
          width: double.infinity,
          decoration: BoxDecoration(),
          child: Center(
            child: Text(
              'Work today?',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, height: 1.5),
            ),
          ),
        ),
        Positioned(
          left: -60,
          top: -16,
          child: Container(
            color: Colors.white70,
            height: getProportionateScreenHeight(150),
            width: getProportionateScreenWidth(150),
            child: Image.asset('assets/images/heart.png'),
          ),
        )
      ],
    );
  }
}
