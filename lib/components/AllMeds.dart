// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllMeds extends StatelessWidget {
  const AllMeds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance.collection('Reminders').snapshots(),
      builder: (_, snapshot) {
        if (snapshot.hasError) return Text('Error = ${snapshot.error}');

        if (snapshot.hasData) {
          final docs = snapshot.data!.docs;
          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (_, i) {
              final data = docs[i].data();
              return ListTile(
                title: Text(data['Name']),
                trailing: Text("Reminder at : ${data["Time"]}"),
              );
            },
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    )
        // child: ListView.builder(
        //   itemCount: DemoMedicines.length,
        //   itemBuilder: (context, int index) {
        //     return ListTile(
        //       title: Text(DemoMedicines[index].medName),
        //       subtitle:
        //           Text("Reminder every ${DemoMedicines[index].time} hours"),
        //       trailing: Text(
        //           "Starts at : ${DemoMedicines[index].startTime}\nEnds at : ${DemoMedicines[index].endTime}"),
        //     );
        //   },
        // ),
        );
  }
}
