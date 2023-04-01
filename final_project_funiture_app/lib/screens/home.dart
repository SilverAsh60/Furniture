import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: TextButton(
            onPressed: () {},
            child: const Text(
              "Home",
              style: TextStyle(
                  color: Color(0xff410000),
                  fontStyle: FontStyle.italic,
                  fontSize: 17),
            )),
      ),
    );
  }
}
