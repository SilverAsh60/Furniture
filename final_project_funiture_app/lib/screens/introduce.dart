import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_funiture_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

final List<String> imgList = [
  'assets/images/introduce1.png',
  'assets/images/introduce2.png',
  'assets/images/introduce2.png',
];

final List<String> textList = [
  'Easy Shopping Online',
  'Free Ship EveryWhere',
  'Free installation at home',
];

class _IntroduceState extends State<Introduce> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        child: OnBoardingSlider(
            finishButtonText: 'Get Started',
            finishButtonTextStyle: const TextStyle(
              color: Color(0xff410000),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            onFinish: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            skipIcon: const Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            totalPage: 3,
            finishButtonStyle: const FinishButtonStyle(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.0)))),
            skipTextButton: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            controllerColor: Colors.white,
            headerBackgroundColor: const Color(0xff410000),
            pageBackgroundColor: const Color(0xff410000),
            background: const [
              Image(
                image: AssetImage("assets/images/introduce1.png"),
                height: 400,
              ),
              Image(
                image: AssetImage("assets/images/introduce2.png"),
                height: 400,
              ),
              Image(
                image: AssetImage("assets/images/introduce1.png"),
                height: 400,
              ),
            ],
            speed: 1.8,
            pageBodies: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 480,
                    ),
                    Text(
                      textList[0],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 480,
                    ),
                    Text(
                      textList[1],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 480,
                    ),
                    Text(
                      textList[2],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
