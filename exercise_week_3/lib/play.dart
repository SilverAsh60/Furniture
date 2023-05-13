import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyPlay extends StatelessWidget {
  const MyPlay({super.key});

  static const page = '/play';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MyPlayPage();
  }
}

class MyPlayPage extends StatefulWidget {
  const MyPlayPage({super.key});

  @override
  State<MyPlayPage> createState() => _MyPlayPageState();
}

class _MyPlayPageState extends State<MyPlayPage> {
  bool play = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;

  void initPlayer() async {
    await player.setSource(AssetSource("assets/sounds/audio.mp3"));
    duration = await player.getDuration();
  }

  //init the player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Ngày Chưa Dông Bão',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  /*
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        flexibleSpace: Container(
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Ngày Chưa Dông Bão',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.white,
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
                Color(0xfff5af19),
                Color(0xfff12711),
              ]),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 50,left: 30,right: 30,bottom: 20),
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: const Image(
                image: AssetImage("assets/images/background.png"),
                width: 150,
                height: 150,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${(value / 60).floor()}: ${(value % 60).floor()}",
                  style: const TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 260.0,
                  child: Slider.adaptive(
                    onChangeEnd: (newValue) async {

                      setState(() {
                        value = newValue;
                      });
                      await player.seek(Duration(seconds: newValue.toInt()));
                    },
                    min: 0.0,
                    value: value,
                    max: 214.0,
                    onChanged: (value) {},
                    activeColor: Colors.white,
                  ),
                ),
                Text(
                  "${duration!.inMinutes} : ${duration!.inSeconds % 60}",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),

          ],
        ),
      ),
    );*/
}
