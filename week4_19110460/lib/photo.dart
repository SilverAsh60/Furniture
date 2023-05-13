import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:week3_19110460/home.dart';

class Album1 {
  final int userId;
  final int id;
  final String title;

  Album1({
    required this.title,
    required this.id,
    required this.userId,
  });
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.title,
    required this.url,
    required this.albumId,
    required this.id,
    required this.thumbnailUrl
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'].toString(),
      url: json['url'].toString(),
      thumbnailUrl: json['thumbnailUrl'].toString(),
    );
  }
}

class MyPhoto extends StatefulWidget {
  const MyPhoto({super.key, required this.newAlbum});
  static const page = '/photo';
  final Album newAlbum;

  @override
  State<MyPhoto> createState() => _MyPhotoState();
}

class _MyPhotoState extends State<MyPhoto> {
  // This widget is the root of your application.

  late Future<List<Photo>> futurePhoto;

  static List<Photo> parsePhoto(String responseBody) {
    final List parsed = jsonDecode(responseBody);
    List<Photo> listAlbum = parsed.map((e) => Photo.fromJson(e)).toList();
    return listAlbum;
  }

  static Future<List<Photo>> fetchPhoto(http.Client client) async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    return compute(parsePhoto, response.body);
  }

  @override
  void initState() {
    super.initState();
    futurePhoto = fetchPhoto(http.Client());
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget photoList({required List<Photo> photo, required Album album}) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10),
        itemCount: photo.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          if (photo[index].albumId == album.id) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: NetworkImage(photo[index].url),
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10,),
                ClipRRect(
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
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            photo.remove(photo[index]);
                          });
                        },
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
                            Icons.delete_forever,
                            size:30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: Text(
                  photo[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),),
                const SizedBox(height: 30,),
              ],
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final Album album = ModalRoute.of(context)!.settings.arguments as Album;

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
                    children: [
                      const SizedBox(
                        width: 20,
                      ),

                      Expanded(child: Text(
                        album.title,
                        style: const TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),)
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
            child: FutureBuilder<List<Photo>>(
              future: fetchPhoto(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  return photoList(photo: snapshot.data! , album: album);
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
