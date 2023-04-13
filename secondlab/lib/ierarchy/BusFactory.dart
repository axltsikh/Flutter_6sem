import 'Transport.dart';

abstract class BusFactory implements Transport{
  int floors=0;
  String functionToBeOverloaded();
}