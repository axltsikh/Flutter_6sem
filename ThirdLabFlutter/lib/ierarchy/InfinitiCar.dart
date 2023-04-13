import 'package:third_lab_flutter/ierarchy/CarFactory.dart';
import 'dart:convert';
class InfinitiCar extends CarFactory implements Comparable{
  @override
  String brand="Infiniti";

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
    print("Brand: $brand\nModel: $model\nRelease year: $year\nCapacity: $capacity\nWeight: $weight kg\nType: $type");
  }

  @override
  String functionToBeOverloaded() {
    return "Abstract class CarFactory overloaded function";
  }

  void decreaseCapacity([int capacity=1]){
    capacity-=1;
  }
  void increaseCapacity({int capacity=1}){
    capacity+=1;
  }
  void callSomeFunction(Function func){
    func();
  }
  InfinitiCar(this.brand,this.model,this.capacity,this.weight,this.year,type);
  InfinitiCar.FXII(){
    capacity=4;
    weight=2000;
    year=2008;
    type="SUV";
    model="FXII";
  }
  static String classInfo(){
    return("This is a class for creating Infiniti cars");
  }
  static String staticField="StaticField value";

  InfinitiCar.fromJson(Map<String,dynamic> json)
    : brand = json['brand'],
     model = json['model'],
     capacity = json['capacity'],
     weight = json['weight'],
     year = json['year'];
  Map<String,dynamic> toJson()=>{
    'brand': brand,
    'model':model,
    'capacity':capacity,
    'weight':weight,
    'year':year,
  };
  @override
  int compareTo(other) {
    return year-(other as InfinitiCar).year;
  }


}