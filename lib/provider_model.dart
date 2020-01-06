import 'package:flutter/material.dart';

class FormItems with ChangeNotifier {
  String name = '';
  String lastName = '';
  DateTime birthDay;
  bool like = false;

  void addname(String n) {
    name = n;
    notifyListeners();
  }

  void addLastname(String n) {
    lastName = n;
    notifyListeners();
  }

  void addBD(DateTime n) {
    birthDay = n;
    notifyListeners();
  }

  void fav(bool n) {
    like = n;
    notifyListeners();
  }
}
