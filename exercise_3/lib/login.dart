import 'package:flutter/material.dart';
import 'home.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({super.key});

  static const page = '/login';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyLoginPage();
  }
}
class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> with RestorationMixin {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RestorableBoolN checkboxRemember = RestorableBoolN(false);

  @override
  String get restorationId => 'checkbox_demo';

  final username = "";
  final password = "";

  @override
  void initState() {
    super.initState();
    usernameController.addListener(() {
      final username = usernameController.text.toLowerCase().trim();
    });

    passwordController.addListener(() {
      final password = passwordController.text.trim();
    });
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(checkboxRemember, 'checkbox_1');
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    checkboxRemember.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.white;
      }
      return const Color(0xfff12711);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(children: <Widget>[
            ClipPath(
              clipper: Clipper(),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xfff5af19),
                        Color(0xfff12711),
                      ]),
                ),
                padding: const EdgeInsets.only(bottom: 0),
                height: 200,
                alignment: Alignment.center,
                /*child: const Text('Login', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),),*/
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              width: MediaQuery.of(context).size.width,
              height: 230,
              padding: const EdgeInsets.fromLTRB(0, 110, 50, 0),
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: const Image(
                      image: AssetImage("assets/images/login.png"),
                      width: 70,
                      height: 70,
                      alignment: Alignment.center,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff3A6073),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 50, right: 50, top: 0),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    labelText: '  Username  ',
                    labelStyle: const TextStyle(
                      color: Color(0xff3A6073),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xfff5af19),
                    ),
                    prefixIcon: const Icon(
                      Icons.account_circle,
                      color: Color(0xfff12711),
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
                          color: Color(0xfff5af19),
                        )),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(
                          color: Color(0xff3A6073),
                        ))),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 50, right: 50, top: 130),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: '  Password  ',
                    labelStyle: const TextStyle(
                      color: Color(0xff3A6073),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Color(0xfff5af19),
                    ),
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Color(0xfff12711),
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
                          color: Color(0xfff5af19),
                        )),
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        borderSide: BorderSide(
                          color: Color(0xff3A6073),
                        ))),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 50, right: 50, top: 260),
              child: Row(
                children: [
                  Row(
                    children: <Widget>[
                      Checkbox(
                          value: checkboxRemember.value,
                          checkColor: const Color(0xfff5af19),
                          fillColor: MaterialStateProperty.resolveWith(getColor),
                          onChanged: (value) {
                            setState(() {
                              checkboxRemember.value = value;
                            });
                          }),
                      const Text(
                        "Remember me",
                        style: TextStyle(
                          color: Color(0xff3A6073),
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 70, right: 70, bottom: 80),

              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),

                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xfff5af19),
                              Color(0xfff12711),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(18.0),
                        textStyle: const TextStyle(fontSize: 20,color: Color(0xffffffff),fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).pushNamed(MyHome.page);
                        });
                      },
                      child: const Text('     Submit     '),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 40),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Forget Password ?',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Color(0xfff12711),
                  ),
                ),
                onPressed: () {
                  setState(() {

                  });
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: const EdgeInsets.only(left: 50, right: 50, bottom: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () {

                },
                child: const Text(
                  "Haven't account ? Sign up",
                  style: TextStyle(
                    color: Color(0xff3A6073),
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 80);
    var firstStart = Offset(size.width / 4, size.height);
    var firstEnd = Offset(size.width / 2, size.height - 60);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 7), size.height - 170);
    var secondEnd = Offset(size.width, size.height);

    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
