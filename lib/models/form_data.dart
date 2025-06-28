import 'package:flutter/material.dart';

class FormData extends ChangeNotifier {
  String name = '';
  String? homeAddress;
  String? officeAddress;

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateHomeAddress(String? address) {
    homeAddress = address;
    notifyListeners();
  }

  void updateOfficeAddress(String? address) {
    officeAddress = address;
    notifyListeners();
  }

  void reset() {
    name = '';
    homeAddress = null;
    officeAddress = null;
    notifyListeners();
  }
}
