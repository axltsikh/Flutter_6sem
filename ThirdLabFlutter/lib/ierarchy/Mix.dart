import 'package:third_lab_flutter/ierarchy/CarFactory.dart';

import 'Bus.dart';
import 'Car.dart';

class Mix extends CarFactory with Bus,Car{
  @override
  String brand="Mixed";

  @override
  int capacity=25;

  @override
  String model="SomeModel";

  @override
  double weight=134;

  @override
  int year=2023;

  @override
  void display() {
    print("CarFactoryDisplay");
  }

  @override
  String functionToBeOverloaded() {
    return "Overloaded function";
  }

}