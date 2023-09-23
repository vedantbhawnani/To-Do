// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_reminder/sizeconfig.dart';

class IconNoCounter extends StatelessWidget {
  const IconNoCounter({
    super.key,
    required this.strsvg,
    this.num = 0,
    required this.press,
  });
  final String strsvg;
  final int num;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: getProportionateScreenHeight(50),
        width: getProportionateScreenWidth(50),
        decoration: BoxDecoration(
          color: Colors.blueGrey[50],
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(13),
            horizontal: getProportionateScreenHeight(13)),
        child: SvgPicture.asset('assets/images/notification-bell.svg'),
      ),
    );
  }
}
