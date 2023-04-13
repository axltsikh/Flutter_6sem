import 'package:secondlab/ierarchy/Transport.dart';

abstract class CarFactory implements Transport{
  String type="";
  String functionToBeOverloaded();
}