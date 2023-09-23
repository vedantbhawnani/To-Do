// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:med_reminder/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class MapContainer extends StatelessWidget {
  MapContainer({
    super.key,
    required Uri url,
  }) : _url = url;

  final Uri _url;
  var url = Uri.parse("https://shorturl.at/nGJT6");

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        launchUrl(url);
      },
      child: Container(
        height: getProportionateScreenHeight(100),
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 54, 158, 244),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                "Search for libraries",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
            Icon(
              Icons.pin_drop,
              size: 30,
            )
          ],
        ),
      ),
    );
  }
}
