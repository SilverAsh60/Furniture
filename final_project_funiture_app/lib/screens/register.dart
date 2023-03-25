import 'package:final_project_funiture_app/screens/login.dart';
import 'package:flutter/material.dart';

import 'package:glassmorphism/glassmorphism.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController comfirmPasswordController =
      TextEditingController();

  final name = "";
  final phone = "";
  final password = "";
  final comfirmPassword = "";

  bool passwordVisible_1 = true;
  bool passwordVisible_2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/background_register.jpg"),
          fit: BoxFit.fill,
        )),
        child: SafeArea(
          child: GlassmorphicContainer(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(20),
            borderRadius: 20,
            linearGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.8),
                  Colors.white.withOpacity(0.3),
                ],
                stops: const [
                  0.5,
                  1
                ]),
            border: 0,
            blur: 10,
            borderGradient: const LinearGradient(colors: [
              Colors.white,
              Colors.white,
            ]),
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        ClipPath(
                          clipper: WaveShape(),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/background_register.jpg"),
                              fit: BoxFit.cover,
                            )),
                            padding: const EdgeInsets.only(left: 70, right: 70),
                            height: 200,
                          ),
                        ),
                        Column(mainAxisSize: MainAxisSize.max, children: [
                          const Text(
                            "Sign up",
                            style: TextStyle(
                                color: Color(0xff410000),
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Text(
                              "Create your new account",
                              style: TextStyle(
                                color: Color(0xff410000),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          )
                        ]),
                      ],
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin: const EdgeInsets.only(
                        bottom: 10, top: 0, left: 20, right: 20),
                    borderRadius: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.2),
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
                    child: TextField(
                      cursorColor: const Color(0xff410000),
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color(0xff410000),
                      ),
                      controller: nameController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Name',
                        labelStyle:
                            TextStyle(color: Color(0xff410000), fontSize: 20),
                        prefixIcon: Icon(
                          Icons.account_circle,
                          color: Color(0xff7c0019),
                          size: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 20, right: 20, top: 10),
                    borderRadius: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.2),
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
                    child: TextField(
                      cursorColor: const Color(0xff410000),
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color(0xff410000),
                      ),
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Phone',
                        labelStyle:
                            TextStyle(color: Color(0xff410000), fontSize: 20),
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: Color(0xff7c0019),
                          size: 30,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 20, right: 20, top: 10),
                    borderRadius: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.2),
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
                    child: TextField(
                      cursorColor: const Color(0xff410000),
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color(0xff410000),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: passwordVisible_1,
                      controller: passwordController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Password',
                        labelStyle: const TextStyle(
                            color: Color(0xff410000), fontSize: 20),
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: Color(0xff7c0019),
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible_1
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff7c0019),
                          ),
                          onPressed: (() {
                            setState(() {
                              passwordVisible_1 = !passwordVisible_1;
                            });
                          }),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 20, right: 20, top: 10),
                    borderRadius: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.white.withOpacity(0.8),
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.2),
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
                    child: TextField(
                      cursorColor: const Color(0xff410000),
                      style: const TextStyle(
                        letterSpacing: 1,
                        fontSize: 20,
                        color: Color(0xff410000),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: passwordVisible_2,
                      controller: comfirmPasswordController,
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Comfirm Password',
                        labelStyle: const TextStyle(
                            color: Color(0xff410000), fontSize: 20),
                        prefixIcon: const Icon(
                          Icons.key_outlined,
                          color: Color(0xff7c0019),
                          size: 30,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible_2
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff7c0019),
                          ),
                          onPressed: (() {
                            setState(() {
                              passwordVisible_2 = !passwordVisible_2;
                            });
                          }),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "By creating, you are agreeing to our Terms of use and Privacy Policy.",
                          style: TextStyle(
                              color: Color(0xff410000),
                              fontStyle: FontStyle.normal,
                              fontSize: 16),
                          textAlign: TextAlign.center,
                        )),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin: const EdgeInsets.only(
                        bottom: 0, top: 10, left: 20, right: 20),
                    borderRadius: 50,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xff410000).withOpacity(0.8),
                          const Color(0xff410000).withOpacity(0.6),
                          const Color(0xff410000).withOpacity(0.3),
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
                          'Create',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {});
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account ? ",
                        style: TextStyle(
                            color: Color(0xff410000),
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          });
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WaveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(0, 50);
    p.cubicTo(width * 2 / 3, 0, width * 2 / 4, height, width, height - 50);
    p.lineTo(width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
