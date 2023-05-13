import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  static const platform = MethodChannel("hcmute.edu.vn/music");
  String _batteryLevel = 'Unknown battery level';

  Future<void> getBatteryLevel() async {
    String batteryLevel;

    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: getBatteryLevel,
                child: const Text('Get Battery Level')),
            Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
