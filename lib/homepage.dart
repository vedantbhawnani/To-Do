// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:med_reminder/components/Map.dart';
import 'package:med_reminder/components/MedCard.dart';
import 'package:med_reminder/useLater/NewMedForm.dart';
import 'package:med_reminder/useLater/NavBarHandler.dart';
import 'package:med_reminder/useLater/MedicineModel.dart';
import 'package:med_reminder/models/data.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:med_reminder/sizeconfig.dart';

import 'components/AddMedButton.dart';
import 'components/HealthCheckContainer.dart';
import 'components/HomeHeader.dart';
import 'components/MedandTime.dart';
import 'components/NotificationCenter.dart';
import 'utils/NotificationHandler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Uri _url = Uri.parse(
      "https://www.google.com/maps/search/pharmacies+open+near+me/@19.1619307,72.8397314,15z/data=!3m1!4b1?entry=ttu");
  int index = 0;

  int current_page = 0;

  Timer? _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (current_page < DemoMedicines.length) {
        current_page++;
      } else {
        current_page = 0;
      }
      // _pageController.animateToPage(current_page,
      //     duration: Duration(milliseconds: 450), curve: Curves.easeIn);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(7)),
              HomeHeader(),
              HealthCheckContainer(),
              SizedBox(height: getProportionateScreenHeight(15)),
              NotificationCenter(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/allMeds');
                },
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: FirebaseFirestore.instance
                        .collection('Reminders')
                        .snapshots(),
                    builder: (_, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error = ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        final docs = snapshot.data!.docs;
                        return PageView.builder(
                          itemCount: docs.length,
                          controller: PageController(),
                          itemBuilder: (context, index) {
                            return PageView.builder(
                                itemCount: docs.length,
                                itemBuilder: (_, i) {
                                  return _buildCarousalItem(context, docs[i]);
                                });
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(30)),
                  child: Text(
                    "Libraries nearby",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25)),
              MapContainer(url: _url),
              AddMedButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCarousalItem(
      BuildContext context, QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: MedCard(medicine: Medicines.fromSnapshot(doc)),
    );
  }
}
