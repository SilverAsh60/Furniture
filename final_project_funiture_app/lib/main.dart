//import 'package:final_project_funiture_app/screens/introduce.dart';
import 'package:final_project_funiture_app/screens/introduce.dart';
//import 'package:final_project_funiture_app/screens/login.dart';
//import 'package:final_project_funiture_app/screens/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xff562135),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      debugShowCheckedModeBanner: false,
      home: const Introduce(),
    );
  }
}
