import 'package:exercise_week_3/detail.dart';
import 'package:flutter/material.dart';

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
  TextEditingController searchController = TextEditingController();
  final searchText = "";
  List<String> singer = [
    "Bùi Lan Hương",
    "Casper",
    "Phạm Quỳnh Anh",
    "Diệu Kiên",
    "H-Kray",
    "Da Lab"
  ];

  List<String> song = [
    "Ngày chưa dông bão",
    "Bao tiền một mớ bình yên",
    "Hello Vietnam",
    "Thuyền Quyên",
    "Khuất lối",
    "Thanh xuân",
  ];

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
          Flexible(
            fit: FlexFit.loose,
            child: Container(
                margin: const EdgeInsets.all(20),
                height: 100,
                child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: singer.length,
                  itemBuilder: (BuildContext context, int index) {
                    var text = singer[index];
                    return Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: Column(
                        children: <Widget>[
                          const Image(
                            image: AssetImage("assets/images/singer.png"),
                            width: 70,
                            height: 70,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            text,
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ),
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
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0),
                  itemCount: song.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/song.jpg"),
                          width: 170,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        FloatingActionButton.small(
                          onPressed: () {
                            Navigator.of(context).pushNamed(MyDetail.page);
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                            ),
                            child: const Icon(
                              Icons.play_arrow,
                              size: 40,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          song[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          singer[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.of(context).pushNamed(MyDetail.page);},
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
              onPressed: () {Navigator.of(context).pushNamed(MyDetail.page);},
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {Navigator.of(context).pushNamed(MyDetail.page);},
              icon: const Icon(
                Icons.collections,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 30,),
            IconButton(
              onPressed: () {Navigator.of(context).pushNamed(MyDetail.page);},
              icon: const Icon(
                Icons.bookmark,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {Navigator.of(context).pushNamed(MyDetail.page);},
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
