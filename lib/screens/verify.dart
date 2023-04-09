import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import 'home.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});

  @override
  State<Verify> createState() => _VerifyState();
}

int page = 0;

class _VerifyState extends State<Verify> {
  Widget getOTP() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xff410000),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Image(
                image: AssetImage("assets/images/verify1.png"),
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "We will send you a one-time password to this mobile number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Your Number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "+84 868 286 420",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 60,
                margin: const EdgeInsets.only(
                    bottom: 0, top: 70, left: 20, right: 20),
                borderRadius: 50,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xffffffff).withOpacity(0.8),
                      const Color(0xffffffff).withOpacity(0.6),
                      const Color(0xffffffff).withOpacity(0.3),
                    ],
                    stops: const [
                      0.5,
                      0.8,
                      1
                    ]),
                border: 0,
                blur: 0,
                borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.2),
                    ],
                    stops: const [
                      0.5,
                      1
                    ]),
                child: ButtonTheme(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: const Text(
                      'Get OTP',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        page = 1;
                      });
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget getVerify() {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xff410000),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Image(
                image: AssetImage("assets/images/verify2.png"),
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Text(
                    "Enter the OTP sent to",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("+84 868 286 420",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              OtpTextField(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                keyboardType: TextInputType.number,
                numberOfFields: 6,
                borderColor: const Color(0xFF410000),
                showFieldAsBox: true,
                fieldWidth: 50,
                filled: true,
                fillColor: Colors.white,

                onSubmit: (String verificationCode) {
                  setState(() {
                    page = 2;
                  });
                }, // end onSubmit
              ),
              GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 60,
                margin: const EdgeInsets.only(
                    bottom: 0, top: 70, left: 20, right: 20),
                borderRadius: 50,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xffffffff).withOpacity(0.8),
                      const Color(0xffffffff).withOpacity(0.6),
                      const Color(0xffffffff).withOpacity(0.3),
                    ],
                    stops: const [
                      0.5,
                      0.8,
                      1
                    ]),
                border: 0,
                blur: 0,
                borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.2),
                    ],
                    stops: const [
                      0.5,
                      1
                    ]),
                child: ButtonTheme(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: const Text(
                      'Verify',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        page = 1;
                      });
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget getSuccess() {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xff410000),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Image(
                image: AssetImage("assets/images/verify3.png"),
                width: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Verified",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Your account has been verified successfully",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
              ),
              GlassmorphicContainer(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                height: 60,
                margin: const EdgeInsets.only(
                    bottom: 0, top: 70, left: 20, right: 20),
                borderRadius: 50,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xffffffff).withOpacity(0.8),
                      const Color(0xffffffff).withOpacity(0.6),
                      const Color(0xffffffff).withOpacity(0.3),
                    ],
                    stops: const [
                      0.5,
                      0.8,
                      1
                    ]),
                border: 0,
                blur: 0,
                borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withOpacity(0.8),
                      Colors.white.withOpacity(0.2),
                    ],
                    stops: const [
                      0.5,
                      1
                    ]),
                child: ButtonTheme(
                  child: MaterialButton(
                    minWidth: double.infinity,
                    child: const Text(
                      'Done',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      });
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (page == 1) {
      return getVerify();
    } else if (page == 2) {
      return getSuccess();
    } else {
      return getOTP();
    }
  }
}
