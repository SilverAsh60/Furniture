import 'package:flutter/cupertino.dart';

class Person with ChangeNotifier {
  String name;
  int age;

  Person({required this.name, required this.age});

  void increase() {
    age ++;
    notifyListeners();
  }

  void changeName(String newName) {
    name = newName;
    notifyListeners();
  }
}