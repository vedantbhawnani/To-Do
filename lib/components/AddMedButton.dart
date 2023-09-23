// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:med_reminder/models/UserRepository.dart';
import 'package:med_reminder/sizeconfig.dart';
import 'package:med_reminder/utils/NotificationHandler.dart';

import '../models/data.dart';

class AddMedButton extends StatefulWidget {
  const AddMedButton({
    super.key,
  });

  @override
  State<AddMedButton> createState() => _AddMedButtonState();
}

class _AddMedButtonState extends State<AddMedButton> {
  TextEditingController nameController = TextEditingController();

  TextEditingController repeatController = TextEditingController();

  TextEditingController startController = TextEditingController();

  TextEditingController endController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    repeatController.dispose();
    startController.dispose();
    endController.dispose();
    super.dispose();
  }

  final medRepo = Get.put(MedicineRepository());

  void createMedicine(Medicines medicines) {
    medRepo.createNewMed(medicines);
  }

  TimeOfDay selectedTime = TimeOfDay.now();
  int id = 0;
  var start, end, Time, endTime, date;
  DateTime datetime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: getProportionateScreenWidth(230),
          top: getProportionateScreenHeight(35)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 126, 142, 189),
          // shape: CircleBorder(),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          padding: EdgeInsets.all(14),
        ),
        onPressed: () {
          showDialog(
              barrierDismissible: true,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text('Add New Reminder'),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                          ElevatedButton(
                              onPressed: () async {
                                final TimeOfDay? selectedTime =
                                    await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return MediaQuery(
                                            data: MediaQuery.of(context)
                                                .copyWith(
                                                    alwaysUse24HourFormat:
                                                        false),
                                            child: child!,
                                          );
                                        });

                                if (selectedTime == null) {
                                  return;
                                }
                                // _selectTime(context);
                                setState(() {
                                  start = selectedTime;
                                  Time = selectedTime.format(context);
                                });
                              },
                              child: Text("Time")),
                          ElevatedButton(
                              onPressed: () async {
                                final DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2095));

                                if (newDate == null) {
                                  return;
                                }
                                setState(() {
                                  datetime = newDate;
                                  date =
                                      "${datetime.year}-${datetime.month}-${datetime.day}";
                                });
                              },
                              child: Text("Date")),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (nameController.text != "") {
                            createMedicine(Medicines(
                              Name: nameController.text,
                              // repeat: repeatController.text,
                              Time: Time,
                              // endTime: "10:00",
                            ));
                          }
                          DemoMedicines.add(Medicines(
                            Name: nameController.text,
                            Time: start.format(context),
                          ));
                          Navigator.of(context, rootNavigator: true)
                              .pop('dialog');
                          DateTime newDT = DateTime(
                            datetime.year,
                            datetime.month,
                            datetime.day,
                            start.hour,
                            start.minute,
                          );
                          print(newDT);
                          NotificationsHelper.setNotification(
                              newDT, nameController.text, "Reminder!", id);
                          id++;
                        })
                  ],
                );
              });
        },
        child: Text("Add New Reminder +"),
        // child: Icon(Icons.add),
      ),
    );
  }
}
