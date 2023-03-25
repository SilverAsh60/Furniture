import 'package:final_project_funiture_app/screens/home.dart';
import 'package:final_project_funiture_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final phone = "";
  final password = "";

  bool passwordVisible = true;

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
          image: AssetImage("assets/images/background_login.jpg"),
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
                  Colors.white.withOpacity(0.6),
                  Colors.white.withOpacity(0.3),
                ],
                stops: const [
                  0.5,
                  1
                ]),
            border: 0,
            blur: 20,
            borderGradient: const LinearGradient(colors: [
              Colors.white,
              Colors.white,
            ]),
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ClipPath(
                    clipper: Clipper(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("assets/images/background_login.jpg"),
                        fit: BoxFit.fill,
                      )),
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      height: 250,
                    ),
                  ),
                  const Text(
                    "Welcom back",
                    style: TextStyle(
                        color: Color(0xff410000),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Login to your account",
                    style: TextStyle(
                      color: Color(0xff410000),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin: const EdgeInsets.all(20),
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
                      decoration: InputDecoration(
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        labelText: 'Phone',
                        labelStyle: const TextStyle(
                            color: Color(0xff410000), fontSize: 20),
                        prefixIcon: const Icon(
                          Icons.phone_android,
                          color: Color(0xff7c0019),
                          size: 30,
                        ),
                        suffixIcon: phone.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    phoneController.clear();
                                  });
                                },
                              )
                            : null,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GlassmorphicContainer(
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.center,
                    height: 60,
                    margin:
                        const EdgeInsets.only(bottom: 10, left: 20, right: 20),
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
                      obscureText: passwordVisible,
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
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: const Color(0xff7c0019),
                          ),
                          onPressed: (() {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          }),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(right: 30),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forget Password ?",
                          style: TextStyle(
                              color: Color(0xff410000),
                              fontStyle: FontStyle.italic,
                              fontSize: 17),
                        )),
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
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Home()));
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have account ?",
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
                                    builder: (context) => const Register()));
                          });
                        },
                        child: const Text(
                          "Sign up",
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

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 70);

    var firstStart = Offset(size.width / 2, size.height);
    var firstEnd = Offset(size.width, size.height - 70);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
