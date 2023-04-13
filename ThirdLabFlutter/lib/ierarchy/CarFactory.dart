import 'package:third_lab_flutter/ierarchy/Transport.dart';

abstract class CarFactory implements Transport{
  String type="";
  String functionToBeOverloaded();
}