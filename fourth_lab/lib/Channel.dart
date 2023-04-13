import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class _ChannelState extends State<Channel>{
  String? firstValue;
  static const battery = MethodChannel('samples.flutter.dev/battery');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThirdLab"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            OutlinedButton(
                onPressed: _getBatteryLevel,
                child: const Text("Get battery level")
            ),
            Text(firstValue ?? "")
          ],
        ),
      )
    );
  }
  Future<void> _getBatteryLevel() async{
    String batteryBuffer;
    try{
      final int result = await battery.invokeMethod('getBatteryLevel',<String,String>{
        "sender" : "flutterFourthLab"
      });
      batteryBuffer="Battery level: " + result.toString() + "%";
    }on PlatformException catch(e){
      batteryBuffer = "Failed to get battery level";
    }
    setState(() {
      firstValue = batteryBuffer;
    });
  }
}
class Channel extends StatefulWidget{
  Channel({super.key});
  @override
  _ChannelState createState() => _ChannelState();
}