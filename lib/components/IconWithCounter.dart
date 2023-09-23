// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_reminder/sizeconfig.dart';

class IconWithCounter extends StatelessWidget {
  const IconWithCounter({
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
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: getProportionateScreenHeight(50),
            width: getProportionateScreenWidth(50),
            decoration: BoxDecoration(
              color: Color.fromRGBO(215, 215, 215, 0.4),
              // borderRadius: BorderRadius.circular(40),
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(13),
                horizontal: getProportionateScreenHeight(13)),
            child: SvgPicture.asset('assets/images/notification-bell.svg'),
          ),
          Positioned(
            right: 0,
            top: -3,
            child: Container(
              height: getProportionateScreenHeight(14),
              width: getProportionateScreenWidth(14),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$num',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      height: 1,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
