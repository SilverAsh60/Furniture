import 'dart:async';
import 'package:flutter/material.dart';
import 'home.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  static const page = '/welcome';

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  double widthBig = 0.0;
  double heightBig = 0.0;

  double widthSmall = 0.0;
  double heightSmall = 0.0;

  double fontSmall = 0;
  double fontBig = 0;

  double imageWidth = 0.0;

  bool visibleVersion = false;

  bool homePage = false;

  @override
  void initState() {

    super.initState();
    Timer(const Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>
      const MyHome()));
    });
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 1), () {
      setState(() {
        widthBig = 400;
        heightBig = 400;

        widthSmall = 300;
        heightSmall = 300;

        fontSmall = 30;
        fontBig = 50;

        imageWidth = 350;
      });
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        visibleVersion = true;
      });
    });

}
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
              colors: [
                Color(0xfff5af19),
                Color(0xfff12711),
              ]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 4000),
                  child: Text(
                    'iMusic'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontBig,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Rampart One',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 4000),
                  child: Text(
                    'Application'.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSmall,
                      fontFamily: 'Rampart One',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(
                  width: imageWidth,
                  duration: const Duration(milliseconds: 1000),
                  child: Image(
                    image: const AssetImage(
                        "assets/images/logo.png"),
                    fit: BoxFit.contain,
                    width: imageWidth,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: visibleVersion,
                  child: const Text(
                    'Version: 5.0',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(width * 1 / 2, 0, width * 2 / 4, height, width, height);
    p.lineTo(width, 0);
    p.close();

    return p;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
