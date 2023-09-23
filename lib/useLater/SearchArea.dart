// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:med_reminder/sizeconfig.dart';

class SearchArea extends StatelessWidget {
  const SearchArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
          color: Color.fromRGBO(215, 215, 215, 0.2),
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        onChanged: (value) {
          //Search {value}
        },
        decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: "Search",
            contentPadding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20),
                vertical: getProportionateScreenHeight(14)),
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
