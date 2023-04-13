import 'package:third_lab_flutter/ierarchy/InfinitiCar.dart';

class realize implements Iterator<InfinitiCar>,Iterable<InfinitiCar>{
  List<InfinitiCar> cars;
  int currentIndex=0;
  realize(this.cars);
  @override
  InfinitiCar get current => cars[currentIndex];

  @override
  bool moveNext() {
    currentIndex++;
    return currentIndex < cars.length;
  }
  @override
  Iterator<InfinitiCar> get iterator => cars.iterator;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}