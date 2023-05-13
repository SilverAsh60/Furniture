import 'package:flutter/material.dart';

class MyHome1Page extends StatefulWidget {
  const MyHome1Page({super.key});

  @override
  State<MyHome1Page> createState() => _MyHome1PageState();

  final page = "home_page";
}

class _MyHome1PageState extends State<MyHome1Page> {
  var page = 'home_page';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 40,
          flexibleSpace: Container(
            color: const Color(0xff26294D),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Furniture Store',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Roboto',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xfffffbd5),
                  Color(0xffD8DDED),
                  Color(0xffD8DCEE),
                  Color(0xffD7DBEE),
                  Color(0xffD3D6EC),
                  Color(0xffD4D7ED),
                  Color(0xffD2D5EA),
                  Color(0xffD4D7EB),
                ]),
          ),
          child: Stack(children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: Clipper(),
                child: Container(
                  color: const Color(0xffEDEEF7),
                  height: 120,
                ),
              ),
            ),
            ClipPath(
              clipper: Clipper(),
              child: Container(
                padding: const EdgeInsets.only(bottom: 50),
                color: const Color(0xff2F335D),
                height: 115,
                alignment: Alignment.center,

                child: Center(
                  child: FloatingActionButton.extended(
                    onPressed: () {  },
                    label: const Text("Search...                                ", style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.normal,
                    ),),
                    icon: const Icon(Icons.search , size: 13,),
                    backgroundColor: const Color(0xff2F335D),

                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
              child: Scrollbar(
                  child: ListView(
                    restorationId: 'list_view',
                    children: [
                      for(int index = 1; index < 20; index ++)
                        ListTile(
                          leading: ExcludeSemantics(
                            child: CircleAvatar(child: Text('$index')),
                          ),
                          title: Text(
                            'Item $index',
                          ),
                        )
                    ],
                  )),
            )

          ]),
          
        ));
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 50);
    var firstStart = Offset(size.width / 4, size.height);
    var firstEnd = Offset(size.width / 2, size.height - 60);

    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3), size.height - 95);
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
