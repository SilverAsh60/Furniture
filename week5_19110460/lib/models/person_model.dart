
import 'package:flutter/cupertino.dart';

class Person with ChangeNotifier{
  String name;
  String age;

  Person({required this.name, required this.age});
}