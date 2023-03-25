//import 'package:final_project_funiture_app/screens/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final username = "";
  final password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
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
                height: 10,
              ),
              const Text(
                "Register a new account",
                style: TextStyle(
                  color: Color(0xff410000),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffdee3),
                      focusColor: const Color(0xffffdee3),
                      labelText: '  Phone  ',
                      labelStyle: const TextStyle(
                          color: Color(0xff410000), fontSize: 20),
                      floatingLabelStyle: const TextStyle(
                        color: Color(0xff410000),
                        fontSize: 0,
                      ),
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: Color(0xff7c0019),
                        size: 30,
                      ),
                      suffixIcon: username.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            usernameController.clear();
                          });
                        },
                      )
                          : null,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color(0xffffb7c5),
                          )),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color(0xffffb7c5),
                          ))),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(20),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffdee3),
                      labelText: '  Password  ',
                      labelStyle: const TextStyle(
                        color: Color(0xff410000),
                        fontSize: 20,
                      ),
                      floatingLabelStyle: const TextStyle(
                          color: Color(0xffffdee3), fontSize: 0),
                      prefixIcon: const Icon(
                        Icons.key,
                        color: Color(0xff7c0019),
                        size: 30,
                      ),
                      suffixIcon: password.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            passwordController.clear();
                          });
                        },
                      )
                          : null,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color(0xffffdee3),
                          )),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color(0xffffdee3),
                            width: 0,
                          ))),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffffdee3),
                      focusColor: const Color(0xffffdee3),
                      labelText: '  Confirm Password  ',
                      labelStyle: const TextStyle(
                          color: Color(0xff410000), fontSize: 20),
                      floatingLabelStyle: const TextStyle(
                        color: Color(0xff410000),
                        fontSize: 0,
                      ),
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: Color(0xff7c0019),
                        size: 30,
                      ),
                      suffixIcon: username.isNotEmpty
                          ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            usernameController.clear();
                          });
                        },
                      )
                          : null,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color(0xffffb7c5),
                          )),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          borderSide: BorderSide(
                            color: Color(0xffffb7c5),
                          ))),
                ),
              ),
            ],
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
