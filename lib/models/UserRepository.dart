import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data.dart';

class MedicineRepository extends GetxController {
  static MedicineRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createNewMed(Medicines medicines) {
    _db
        .collection("Reminders")
        .add(medicines.toJson())
        // .whenComplete(() => Get.snackbar(
        //       "Success",
        //       "Medicine added",
        //       snackPosition: SnackPosition.BOTTOM,
        //       colorText: Colors.green.withOpacity(0.1),
        //     ))
        .catchError((error, stackTrace) {
      // () => Get.snackbar(
      //       "Error",
      //       "Something went wrong",
      //       snackPosition: SnackPosition.BOTTOM,
      //       colorText: Colors.redAccent.withOpacity(0.1),
      //     );
      print("-----------------------------------------------------");
      print(error.toString());
      print("-----------------------------------------------------");
    });
  }

  // Future<Medicines> GetMedicineDetails(String name) async {
  //   final snapshot = await _db
  //       .collection("Medicines")
  //       .where("Name", isEqualTo: name)
  //       .get();
  //   final userMed = snapshot.docs.map((e) => Medicines.fromSnapshot(e)).single;
  //   return userMed;
  // }

  Future<List<Medicines>> GetMedicineDetails() async {
    final snapshot = await _db.collection("Reminders").get();
    final userMed =
        snapshot.docs.map((e) => Medicines.fromSnapshot(e)).toList();
    return userMed;
  }
}
