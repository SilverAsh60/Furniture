
import 'package:flutter/material.dart';
import 'package:week7_19110460/models/person.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Person>(
      create: (context) => Person(name: "Thao", age: 23),
      child: MaterialApp(
          home: const MyHomePage(title: 'My Home Page'),
        title: 'Thu Thao App Music',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Person>(builder: (context, myModel, child) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(myModel.name,style: const TextStyle(
                fontSize: 30
              ),),
              const SizedBox(height: 30,),
              Text(myModel.age.toString(), style: const TextStyle(
                  fontSize: 50
              )),
              const SizedBox(height: 30,),
              FloatingActionButton(
                isExtended: true,
                onPressed: () {
                  context.read<Person>().increase();
                },
                child: const Icon(Icons.add),
              )
            ],
          ),
        )
      );
    });
  }
}
