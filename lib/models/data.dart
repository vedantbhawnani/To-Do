// ignore_for_file: empty_constructor_bodies, non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:med_reminder/models/UserRepository.dart';

class Medicines {
  final String Name, Time;

  Medicines({
    required this.Time,
    required this.Name,
  });
  toJson() {
    return {
      "Name": Name,
      // "repeat": repeat,
      "Time": Time,
      // "endTime": endTime,
    };
  }

  factory Medicines.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Medicines(
      Time: data["Time"],
      // endTime: data["endTime"],
      Name: data["Name"],
      // repeat: data["repeat"]
    );
  }
}

final _userMed = Get.put(MedicineRepository());
getUserData() {
  // Get.snackbar("Sucess", "Here are all your meds");
  return _userMed.GetMedicineDetails();
}

//repeat here is after how many hours should the reminder be sent
List<Medicines> DemoMedicines = <Medicines>[
  Medicines(
    Name: "Paracetamol",
    Time: "10:00",
  ),
  Medicines(
    Name: "Aquim-T",
    Time: "10:00",
  ),
];
