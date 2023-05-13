import 'package:flutter/material.dart';
import 'play.dart';

class MyDetail extends StatelessWidget {
  const MyDetail({super.key});

  static const page = '/detail';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyDetailPage();
  }
}

class MyDetailPage extends StatefulWidget {
  const MyDetailPage({super.key});

  @override
  State<MyDetailPage> createState() => _MyDetailPageState();
}

class _MyDetailPageState extends State<MyDetailPage> {
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

  List<String> lyric = [
    """
  Vì ta yêu nhau như cơn sóng vỗ
  Quẩn quanh bao năm
  Không buông mặt hồ
  Thuyền anh đi xa bờ thì em vẫn dõi chờ
  Duyên mình dịu êm thơ rất thơ
  Và anh nâng niu em như đóa hoa
  Còn em xem anh như trăng ngọc ngà
  Tự do như mây vàng
  Mình phiêu du non ngàn
  Dẫu trần gian bao la đến đâu
  Nơi anh là nhà
  Khi anh qua thung lũng
  Và bóng đêm ghì bàn chân
  Đời khiến anh chẳng còn nhiều luyến lưu
  Em mong lau mắt anh khô
  Ta yêu sai hay đúng
  Còn thấy đau là còn thương
  Khi bão qua rồi biết đâu sẽ
  Đi tới nơi của ngày đầu hết muộn sầu
  Lạc bước giữa những đam mê tăm tối
  Liệu máu vẫn nóng nơi tim bồi hồi
  Người năm xưa đâu rồi
  Lạnh băng tiếng khóc cười
  Anh ở nơi xa xôi vô lối
  Mặt đất níu giữ đôi chân chúng ta
  Thì bay lên trong cơn mơ kỳ lạ
  Ở đó anh vẫn là
  Người yêu thương chan hòa
  Dẫu trần gian cho anh đắng cay
  Nơi em là nhà
  Khi anh qua thung lũng
  Và bóng đêm ghì bàn chân
  Đời khiến anh chẳng còn nhiều luyến lưu
  Em mong lau mắt anh khô
  Ta yêu sai hay đúng
  Còn thấy đau là còn thương
  Khi bão qua rồi biết đâu sẽ
  Đi tới nơi của ngày đầu hết muộn sầu
  Khi anh qua thung lũng
  Và bóng đêm ghì bàn chân
  Đời khiến anh chẳng còn nhiều luyến lưu
  Em mong lau mắt anh khô
  Ta yêu sai hay đúng
  Còn thấy đau là còn thương
  Khi bão qua rồi biết đâu sẽ
  Đi tới nơi của ngày đầu hết muộn sầu
    """,
  ];

  @override
  Widget build(BuildContext context) {
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
          Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: const [
                      Image(
                        image: AssetImage("assets/images/song.jpg"),
                        width: 150,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          Text(
                            song[0].toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Text(
                            singer[0],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const Text(
                            "13K viewers",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 70, right: 70, bottom: 10),

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
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      surfaceTintColor: const Color(0xfff5af19),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(18.0),
                      textStyle: const TextStyle(fontSize: 15,color: Color(0xffffffff),fontWeight: FontWeight.normal),
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).pushNamed(MyPlay.page);
                      });
                    },
                    icon: const Icon(Icons.play_circle),
                    label: const Text('Play'),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const <Widget>[
              SizedBox(width: 20),
              Icon(
                Icons.lyrics,
                color: Color(0xffe83d2a),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Lyrics",
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
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width / 2,
            child: Text(lyric[0]),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
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
              onPressed: () {
                Navigator.of(context).pushNamed(MyDetail.page);
              },
              icon: const Icon(
                Icons.home,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyDetail.page);
              },
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
              onPressed: () {
                Navigator.of(context).pushNamed(MyDetail.page);
              },
              icon: const Icon(
                Icons.bookmark,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MyDetail.page);
              },
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
