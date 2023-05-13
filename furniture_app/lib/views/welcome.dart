import 'dart:async';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'home.dart';

class MyWelcome extends StatefulWidget {
  const MyWelcome({super.key});

  @override
  State<MyWelcome> createState() => _MyWelcomeState();
}

class _MyWelcomeState extends State<MyWelcome> {
  @override
  void initState() {
    super.initState();
    _startTimer();

    /*Timer(const Duration(seconds: 10), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MyHome()));
    });*/
  }

  double widthBig = 0.0;
  double heightBig = 0.0;

  double widthSmall = 0.0;
  double heightSmall = 0.0;

  double fontSmall = 0;
  double fontBig = 0;

  double imageWidth = 0.0;

  bool visibleVersion = false;

  double glassHeight = 0;
  double glassWidth = 0;

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        widthBig = 400;
        heightBig = 400;

        widthSmall = 300;
        heightSmall = 300;

        fontSmall = 30;
        fontBig = 50;

        imageWidth = 350;

        glassHeight = MediaQuery.of(context).size.height;
        glassWidth = MediaQuery.of(context).size.width;
      });
    });

    Timer(const Duration(seconds: 5), () {
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.fill,
              )),
            ),
            AnimatedContainer(
              height: glassHeight,
              width: glassWidth,
              duration: const Duration(seconds: 1),
              child: GlassmorphicContainer(
                height: glassHeight,
                width: glassWidth,
                borderRadius: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xffffffff).withOpacity(0.0),
                      const Color(0xffffffff).withOpacity(0.0),
                      const Color(0xffffffff).withOpacity(0.0),
                      const Color(0xffffffff).withOpacity(0.0),
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
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: visibleVersion,
                      child: Text(
                        'Furniture'.toUpperCase(),
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
                    Visibility(
                      visible: visibleVersion,
                      child: Text(
                        'Delivery'.toUpperCase(),
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
                      duration: const Duration(seconds: 2),
                      child: Image(
                        image: const AssetImage("assets/images/logo.png"),
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
                        'Version: 1.0',
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
          ],
        ),
      ),
    );
  }
}

child: CarouselSlider(
                carouselController: carouselController,
                items: [
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/introduce1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/introduce2.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 2.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                ))));
  

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

Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color(0xff410000),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: CarouselSlider(
            carouselController: carouselController,
            items: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset("assets/images/introduce1.png",
                            fit: BoxFit.cover, width: 1000.0),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text("Easy Shopping Online"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset("assets/images/introduce1.png",
                            fit: BoxFit.cover, width: 1000.0),
                        const SizedBox(
                          height: 30,
                        ),
                        const Text("Easy Shopping Online"),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(5.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.asset("assets/images/introduce1.png",
                            fit: BoxFit.cover, width: 1000.0),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(top: 400),
                          child: const Text(
                            "Easy Shopping Online",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              aspectRatio: 0.5,
              initialPage: 2,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                  current_index = index;
                });
              }
            ),
          ),
        ),
      ),
    );


Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          textList[imgList.indexOf(item)],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),