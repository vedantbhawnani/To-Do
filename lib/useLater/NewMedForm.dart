// ignore_for_file: prefer_const_constructors, sdk_version_since, must_be_immutable

import 'package:flutter/material.dart';
import 'package:med_reminder/components/MedandTime.dart';
import 'package:med_reminder/homepage.dart';
import 'package:med_reminder/models/data.dart';
import 'package:provider/provider.dart';

import 'MedicineModel.dart';

class NewMedForm extends StatefulWidget {
  const NewMedForm({
    super.key,
    // required this.notifyParent,
  });

  // final Function() notifyParent;

  @override
  State<NewMedForm> createState() => _NewMedFormState();
}

class _NewMedFormState extends State<NewMedForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    timeController.dispose();
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Form(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: nameController,
              onChanged: (v) => {
                nameController.text = v,
              },
              decoration: InputDecoration(
                labelText: 'Name',
                icon: Icon(Icons.account_box),
              ),
            ),
            TextFormField(
              controller: startController,
              onChanged: (v) => {
                startController.text = v,
              },
              decoration: InputDecoration(
                labelText: 'Start time',
                icon: Icon(Icons.message),
              ),
            ),
            TextFormField(
              controller: endController,
              onChanged: (v) => {
                endController.text = v,
              },
              decoration: InputDecoration(
                labelText: 'End time',
                icon: Icon(Icons.message),
              ),
            ),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                DemoMedicines.add(Medicines(
                  Name: nameController.text,
                  Time: startController.text,
                ));
                setState(() {
                  DemoMedicines;
                });
              },
            ),
            MedandTime(),
          ],
        ),
      ),
    ));
  }
}
