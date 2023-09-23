import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:med_reminder/models/data.dart';

class MedicineModel extends ChangeNotifier {
  final List<Medicines> _items = DemoMedicines;
  UnmodifiableListView<Medicines> get items => UnmodifiableListView(_items);
  void add(Medicines item) {
    if (items == _items) {
      return;
    }
    DemoMedicines.add(item);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  /// Removes all items from the cart.
  void removeAll() {
    _items.clear();
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
