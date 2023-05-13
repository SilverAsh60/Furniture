import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyIntroducePage extends StatelessWidget {
  const MyIntroducePage({super.key});

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitFadingCircle(
      color: Colors.white,
      size: 50.0,
    );


    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          /*gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffD6DAED) , Color(0xffD6DAED) , Color(0xffD6DAED) , Color(0xffD6DAED)]
        )*/

          gradient: RadialGradient(
              colors: [Color(0xff7096BB), Color(0xff19283d)], radius: 0.75),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Furniture Delivery',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: Color(0xff7ea0c2),
                fontWeight: FontWeight.normal,
                fontFamily: 'Anton',

              ),
            ),
            const SizedBox(height: 50),
            Image.asset(
              'assets/images/main-item.png',
              width: 250,
              height: 250,
            ),

            spinkit,
            const SizedBox(height: 100),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Version 1.0",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),

              ),
            )
          ],
        ),
      ),
    );
  }
}
