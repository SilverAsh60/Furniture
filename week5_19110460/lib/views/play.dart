
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

const defaultPlayerCount = 4;

typedef OnError = void Function(Exception exception);


class MyPlayPage extends StatefulWidget {
  const MyPlayPage({super.key, required this.title});

  final String title;

  @override
  State<MyPlayPage> createState() => _MyPlayPageState();
}

class _MyPlayPageState extends State<MyPlayPage> with TickerProviderStateMixin {
  late AudioPlayer player;

  late final AnimationController controller =
  AnimationController(vsync: this, duration: const Duration(seconds: 4))
    ..repeat(reverse: false);
  late final Animation<double> animation =
  CurvedAnimation(parent: controller, curve: Curves.linear);

  //init the player
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    player = AudioPlayer();
  }

  @override
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String title = ModalRoute.of(context)!.settings.arguments as String;
    // TODO: implement build
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
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
        child: Stack(
          alignment: AlignmentDirectional.topStart,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: RotationTransition(
                turns: animation,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(255, 255, 255, 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(300)),
                  ),

                  child: const Image(
                    image: AssetImage("assets/images/logo.png"),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.all(20),
              color: Colors.deepOrange.withOpacity(0),
              child: AudioState(
                player: player,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioState extends StatefulWidget {
  final AudioPlayer player;
  const AudioState({Key? key, required this.player}) : super(key: key);

  @override
  State<AudioState> createState() => _AudioStateState();
}

class _AudioStateState extends State<AudioState> {
  Duration duration = const Duration();
  Duration position = const Duration();

  final String path = "sounds/audio.mp3";
  bool isPlay = true;
  bool isPause = false;
  bool isLoop = false;

  List<IconData> icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    widget.player.onDurationChanged.listen((s) {
      setState(() {
        duration = s;
      });
    });
    widget.player.onPositionChanged.listen((s) {
      setState(() {
        position = s;
      });
    });

    widget.player.setSource(AssetSource(path));
    widget.player.play(AssetSource(path));
  }

  Widget start() {
    return IconButton(
      color: Colors.white,
      iconSize: 70,
      padding: const EdgeInsets.only(bottom: 10),
      icon: isPlay == false
          ? Icon(icons[0])
          : Icon(
        icons[1],
      ),
      onPressed: () async {
        if (isPlay == false) {
          await widget.player.play(AssetSource(path));
          setState(() {
            isPlay = true;
          });
        } else {
          await widget.player.pause();
          setState(() {
            isPlay = false;
          });
        }
      },
    );
  }
  Widget next() {
    return IconButton(
      color: Colors.white,
      iconSize: 40,
      padding: const EdgeInsets.only(bottom: 10),
      icon: const Icon(Icons.fast_forward),
      onPressed: () {},
    );
  }
  Widget pre() {
    return IconButton(
      color: Colors.white,
      iconSize: 40,
      padding: const EdgeInsets.only(bottom: 10),
      icon: const Icon(Icons.fast_rewind),
      onPressed: () {},
    );
  }
  Widget repeat() {
    return IconButton(
      color: Colors.white,
      iconSize: 40,
      padding: const EdgeInsets.only(bottom: 10),
      icon: const Icon(Icons.restart_alt),
      onPressed: () {},
    );
  }
  Widget loop() {
    return IconButton(
      color: Colors.white,
      iconSize: 40,
      padding: const EdgeInsets.only(bottom: 10),
      icon: const Icon(Icons.all_inclusive),
      onPressed: () {},
    );
  }

  Widget slider() {
    return Slider(
        inactiveColor: Colors.red,
        activeColor: Colors.amber,
        min: 0.0,
        max: duration.inSeconds.toDouble(),
        value: position.inSeconds.toDouble(),
        onChanged: (double value) {
          setState(() {
            changeSecond(value.toInt());
            value = value;
          });
        });
  }

  void changeSecond(int second) {
    Duration newDur = Duration(seconds: second);
    widget.player.seek(newDur);
  }

  Widget loadAsset() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: const EdgeInsets.all(0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 150),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  position.toString().split(".")[0],
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                slider(),
                Text(
                  duration.toString().split(".")[0],
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                repeat(),
                pre(),
                start(),
                next(),
                loop(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return loadAsset();
  }
}
