import 'package:flutter/material.dart';

class IGave extends ChangeNotifier {
  final controller = TextEditingController();
  bool showAdditionField = false;
  bool changeColor = false;

  void changeButtonColor() {
    if (controller.text.isEmpty) {
      changeColor = false;
    } else {
      changeColor = true;
    }
    notifyListeners();
  }
}
