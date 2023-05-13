import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:week3_19110460/photo.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.title,
    required this.id,
    required this.userId,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  static const page = '/home';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Album>> futureAlbum;

  static List<Album> parseAlbums(String responseBody) {
    final List parsed = jsonDecode(responseBody);
    List<Album> listAlbum = parsed.map((e) => Album.fromJson(e)).toList();
    return listAlbum;
  }

  static Future<List<Album>> fetchAlbum(http.Client client) async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums"));
    return compute(parseAlbums, response.body);
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum(http.Client());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget albumList({required List<Album> album}) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: album.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 100,
                width: 100,
                child: Image(
                  image: NetworkImage(
                      "https://cdn-icons-png.flaticon.com/512/6887/6887306.png"),
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
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
                        surfaceTintColor: const Color(0xfff5af19),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.only(left: 30,right: 30,top: 0,bottom: 0),
                        textStyle: const TextStyle(fontSize: 15,color: Color(0xffffffff),fontWeight: FontWeight.normal),
                      ),
                      onPressed: () {
                        setState(() {
                          final Album newAlbum = Album(title: album[index].title, id: album[index].id, userId: album[index].userId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyPhoto(newAlbum: newAlbum),
                              // Pass the arguments as part of the RouteSettings. The
                              // DetailScreen reads the arguments from these settings.
                              settings: RouteSettings(
                                arguments: newAlbum,
                              ),
                            ),
                          );
                        });
                      },
                      child: const Text('View' , style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ],
                ),
              ),
              Text(
                album[index].title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20,),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    var num = 0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfff5af19),
                  Color(0xfff12711),
                ]),
          ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipPath(
                clipper: Clipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xfff5af19),
                          Color(0xfff12711),
                        ]),
                  ),
                  padding: const EdgeInsets.only(left: 70, right: 70),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'App Gallery',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(width: 20),
              Icon(
                Icons.browse_gallery,
                color: Color(0xffe83d2a),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Gallery",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Container(
            alignment: Alignment.topRight,
            width: MediaQuery.of(context).size.width,
            height: 2,
            margin: EdgeInsets.only(
                top: 5, right: MediaQuery.of(context).size.width / 3, left: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color(0xfff5af19),
                    Color(0xfff12711),
                  ]),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<List<Album>>(
              future: fetchAlbum(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  return albumList(album: snapshot.data!);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfff5af19),
                  Color(0xfff12711),
                ]),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xfff12711),
        surfaceTintColor: Colors.amber,
        height: 50,
        notchMargin: 10.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.collections,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
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
    // TODO: implement shouldReclip
    return false;
  }
}

class ClipperLine extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height);
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
