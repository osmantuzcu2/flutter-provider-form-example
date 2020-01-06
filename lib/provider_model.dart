import 'package:flutter/material.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}
class FormItems with ChangeNotifier{
  String name='';
  String lastName='';
  DateTime birthDay;
  bool like=false;

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