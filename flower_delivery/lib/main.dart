import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';
import 'introduce.dart';
import 'home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class MyAppState extends ChangeNotifier {
  var selectPage = 0;
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;


  void _startTimer() {

    Timer(const Duration(seconds: 5), () {
      setState(() {
        selectedIndex = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _startTimer();
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const MyIntroducePage();
        break;
      case 1:
        page = const MyHome1Page();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return page;
  }
}
