import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week5_19110460/models/singer_model.dart';
import 'package:week5_19110460/views/play.dart';

import '../models/song_model.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  static const page = '/home';

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController searchController = TextEditingController();
  final searchText = "";

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      final searchText = searchController.text.toLowerCase();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }



  // singer
  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('singer').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return buildList(context, snapshot.data?.docs ?? []);
        });
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      width: 150,
      child: ListView(
        itemExtent: 120,
        scrollDirection: Axis.horizontal,
        children: snapshot.map((e) => buildListItem(context, e)).toList(),
      ),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
    final singer = Singer.fromSnapshot(data);
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.network(
            singer.avatar,
            width: 100,
            height: 100,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        Text(
          singer.name,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  //song
  Widget buildBody2(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('song').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const CircularProgressIndicator();
          return buildList2(context, snapshot.data?.docs ?? []);
        });
  }

  getSing(String iD) async {
    String name = "";
    var collection = FirebaseFirestore.instance.collection('singer');
    var querySnapshot = await collection.doc(iD)
        .get().then((value) {
          name = value['name'].toString();
    });

    return name;
  }

  Widget buildList2(BuildContext context, List<DocumentSnapshot> snapshot) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        itemExtent: 170,
        scrollDirection: Axis.vertical,
        children: snapshot.map((e) => buildListItem2(context, e)).toList(),
      ),
    );
  }

  Widget buildListItem2(BuildContext context, DocumentSnapshot data) {
    final song = Song.fromSnapshot(data);
    
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                child: Image.network(
                  song.img,
                  width: 130,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      song.name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      //getSing(song.sing),
                      song.sing,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.favorite_border_outlined),
                    Text(song.liker),
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.date_range_outlined),
                    Text(song.year),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                FloatingActionButton.small(
                  heroTag: song.name,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyPlayPage(title: song.name),
                        settings: RouteSettings(
                          arguments: song.name,
                        ),
                      ),
                    );
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
                      Icons.play_arrow,
                      size: 40,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0.0,
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xfff5af19),
                  Color(0xfff12711),
                ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(
                image: AssetImage("assets/images/logo.png"),
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                'iMusic',
                style: TextStyle(
                  fontFamily: 'Rampart One',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
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
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                        labelText: '  Search ........  ',
                        labelStyle:
                            const TextStyle(color: Colors.white, fontSize: 12),
                        isDense: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        contentPadding: const EdgeInsets.all(5),
                        fillColor: Colors.white,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 20,
                        ),
                        suffixIcon: searchText.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: () {
                                  setState(() {
                                    searchController.clear();
                                  });
                                },
                              )
                            : null,
                        focusedBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(
                              color: Color(0xfff5af19),
                            )),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40.0)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ))),
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
                Icons.person,
                color: Color(0xffe83d2a),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Singer",
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
          buildBody(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(width: 20),
              Icon(
                Icons.library_music,
                color: Color(0xffe83d2a),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Song",
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
          buildBody2(context),
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
            Icons.music_note,
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
