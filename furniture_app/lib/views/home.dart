import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xfff9f9f9), Color(0xfff9f9f9)],
          ),
        ),
        child: Stack(
          children: [
            GlassmorphicContainer(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              borderRadius: 0,
              linearGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xffffffff).withOpacity(0.2),
                    const Color(0xffffffff).withOpacity(0.2),
                    const Color(0xffffffff).withOpacity(0.2),
                    const Color(0xffffffff).withOpacity(0.1),
                    const Color(0xffffffff).withOpacity(0),
                  ],
                  stops: const [
                    0.2,
                    0.4,
                    0.6,
                    0.8,
                    1,
                  ]),
              border: 0,
              blur: 20,
              borderGradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFFffffff).withOpacity(0.6),
                  const Color((0xFFFFFFFF)).withOpacity(0.6),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
