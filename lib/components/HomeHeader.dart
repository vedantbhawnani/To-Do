// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:med_reminder/components/IconWithCounter.dart';

// import 'SearchArea.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SearchArea(),
          IconWithCounter(
            strsvg: 'assests/images/notification-bell.svg',
            num: 1,
            press: () {},
          ),
        ],
      ),
    );
  }
}
