import 'package:secondlab/ierarchy/BusFactory.dart';

class ManBus extends BusFactory{
  @override
  String brand="Man";

  @override
  String model="";

  @override
  int capacity=0;

  @override
  double weight=0;

  @override
  int year=0;

  @override
  void display() {
    print("Brand: $brand\nRelease year: $year\Floors: $floors");
  }

  @override
  String functionToBeOverloaded() {
    return "Abstract class BusFactory overloaded function";
  }

  void decreaseCapacity([int capcacity=2]){
    capacity-=1;
  }
  void increaseCapacity({int capacity=1}){
    capacity+=1;
  }

  void callSomeFunction(Function func){
    func();
  }

  ManBus(this.brand,this.model,this.capacity,this.weight,this.year,type);

  ManBus.LionsCoach(){
    capacity=57;
    weight=23000;
    year=2002;
    floors=1;
    model="LION'S COACH";
  }

  static String classInfo(){
    return "This is a class for creating MAN buses";
  }
  static String staticField = "StaticField value";
}