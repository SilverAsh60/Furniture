import 'dart:ui';

import 'play.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';
import 'detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Thu Thao App Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyLogin(),
      routes: {
        MyLogin.page: (ctx) => const MyLogin(),
        MyHome.page: (ctx) => const MyHome(),
        MyDetail.page: (ctx) => const MyDetail(),
        MyPlay.page: (ctx) => const MyPlay(),
      },
      scrollBehavior: MyCustomScrollBehavior(),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
