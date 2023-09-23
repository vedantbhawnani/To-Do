// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_final_fields

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_reminder/useLater/NewMedForm.dart';
import 'package:med_reminder/useLater/MedicineModel.dart';
import 'package:provider/provider.dart';

import '../components/MedCard.dart';
import '../models/data.dart';
import 'dart:async';

class AutoCarousel extends StatefulWidget {
  const AutoCarousel({
    super.key,
  });

  @override
  State<AutoCarousel> createState() => _AutoCarouselState();
}

class _AutoCarouselState extends State<AutoCarousel> {
  int current_page = 0;
  Timer? _timer;
  PageController _pageController = PageController(
    initialPage: 0,
    keepPage: false,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (current_page < DemoMedicines.length) {
        current_page++;
      } else {
        current_page = 0;
      }
      _pageController.animateToPage(current_page,
          duration: Duration(milliseconds: 450), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  void create() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    NewMedForm();
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('DriverList').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return GridView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final data = docs[index].data();
              return ListTile(title: Text(data['medName']));
            },
            controller: _pageController,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}

