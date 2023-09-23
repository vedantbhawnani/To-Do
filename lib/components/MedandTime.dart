// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../useLater/AutoCarousel.dart';
import '../sizeconfig.dart';

class MedandTime extends StatelessWidget {
  const MedandTime({super.key});
  @required
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/allMeds");
      },
      child: Container(
        height: getProportionateScreenHeight(90),
        width: double.infinity,
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 126, 142, 189),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(100, 0, 0, 0),
              offset: const Offset(
                2.0,
                5.0,
              ),
              blurRadius: 10.0,
              spreadRadius: 2.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )
          ],
        ),
        child: AutoCarousel(),
      ),
    );
  }
}
