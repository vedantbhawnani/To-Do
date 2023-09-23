// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_literals_to_create_immutables, must_be_immutable
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../models/data.dart';

class MedCard extends StatelessWidget {
  MedCard({
    Key? key,
    required this.medicine,
  }) : super(key: key);
  final Medicines medicine;

  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      color: Color.fromARGB(255, 172, 186, 228),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            medicine.Name,
            style: TextStyle(
                fontSize: 22,
                color: Colors.grey[50],
                fontWeight: FontWeight.w900,
                fontFamily: 'Montserrat'),
          ),
          SizedBox(
            height: 10,
          ),
          // Text(
          //   "Times-daily: ${medicine.repeat}",
          //   style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.grey[100],
          //       fontWeight: FontWeight.w700,
          //       fontFamily: 'Montserrat'),
          // ),
        ],
      ),
    );
    // Row(
    //   children: [
    //     Padding(
    //       padding: const EdgeInsets.only(left: 15, right: 0),
    //       child: SizedBox(
    //         height: getProportionateScreenHeight(43),
    //         child: Image.asset("assets/images/medical-pill.png",
    //             // : "assets/images/medical-drops.png",
    //             scale: 1.3),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(
    //         left: getProportionateScreenWidth(15),
    //         // right: getProportionateScreenWidth(10)
    //       ),
    //       child: Text.rich(
    //         TextSpan(
    //             text: '${medicine.Name}\n',
    //             style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 18,
    //                 fontWeight: FontWeight.bold),
    //             children: [
    //               TextSpan(
    //                 text: '${medicine.repeat} hours later',
    //                 style: TextStyle(
    //                   fontSize: 15,
    //                   fontWeight: FontWeight.w400,
    //                 ),
    //               )
    //             ]),
    //       ),
    //     ),
    //     //Vertical divider
    //     Container(
    //       margin: EdgeInsets.only(left: 25, right: 0),
    //       color: Colors.white60,
    //       height: getProportionateScreenHeight(30),
    //       width: getProportionateScreenWidth(2),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.only(left: getProportionateScreenWidth(25)),
    //       child: Padding(
    //         padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
    //         child: Text.rich(
    //           TextSpan(
    //               // text: '${medicine.date}\n',
    //               text: '${now.day} ${DateFormat.MMMM().format(now)}\n',
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 18,
    //                   fontWeight: FontWeight.bold),
    //               children: [
    //                 TextSpan(
    //                     text: medicine.repeat,
    //                     style: TextStyle(
    //                       fontSize: 15,
    //                       color: Colors.white,
    //                       fontWeight: FontWeight.w400,
    //                     ))
    //               ]),
    //         ),
    //       ),
    //     ),
    //   ],
    // );
  }
}
