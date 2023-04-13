import 'dart:async';
import 'dart:convert';

import 'package:third_lab_flutter/ierarchy/InfinitiCar.dart';
import 'package:third_lab_flutter/ierarchy/Mix.dart';

void main() {
  // Mix a = new Mix();
  // a.someBusMixinMethod();
  // a.someCarMixinMethod();
  // a.getInfo();
  //
  // //Json
  // var carBuffer = jsonEncode(InfinitiCar.FXII());
  // print(carBuffer);
  // InfinitiCar car = InfinitiCar.fromJson(jsonDecode(carBuffer));
  // print(car.model);


  //async
  asyncMethod();
  print("Output after asyncMethod call");

  //Future
  futureWork(1, 2).then((value) => {
    if(value==0){
      print("a<b")
    }
    else{
      print("a>b")
    }
  })
  .catchError((err)=>print(err.toString()));

  //Stream
  var singleStream = getSingleStreamData();
  singleStream.stream.listen((event) {print("single sub: " + event.toString());});
  singleStream.sink.add(1);
  singleStream.sink.add(3);
  var broadcast = getBroadcastData();
  broadcast.stream.listen((event) => print("first broadcast sub:" + event.toString()));
  broadcast.stream.listen((event) => print("second broadcast sub:" + event.toString()));
  broadcast.sink.add(1);
  broadcast.sink.add(2);
}

//Future
Future<void> asyncMethod() async{
  print("Async method started");
  String message = await getMessage();
  print(message);
}
Future<String> getMessage() {
  return Future.delayed(Duration(seconds: 3), () => "Hello Dart");
}
Future futureWork(int a,int b){
  return Future.delayed(Duration(seconds: 5),()=>{
    if(a>b){
      1
    }
    else if(a<b){
      0
    }
    else{
      throw("Equal")
      }
  });
}

//Stream
StreamController<int> getSingleStreamData() {
  return StreamController<int>();
}
StreamController<int> getBroadcastData() {
  return StreamController<int>.broadcast();
}