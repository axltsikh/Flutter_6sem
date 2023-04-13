import 'package:flutter/material.dart';

import 'ierarchy/InfinitiCar.dart';

void main() {
  InfinitiCar car = new InfinitiCar.FXII();
  print(InfinitiCar.staticField);
  print(InfinitiCar.classInfo());
  print("Overloaded function: ${car.functionToBeOverloaded()}");
  car.decreaseCapacity();
  car.decreaseCapacity();
  car.increaseCapacity(capacity: 1);
  car.display();
  car.callSomeFunction(functionToBeCalled);
  
  print("\nList:");
  List<int> listOfIntegers = [1,2,3,4,5,6,7,8,9,10];
  listOfIntegers.add(11);
  listOfIntegers.remove(1);
  listOfIntegers.removeRange(2,4);
  print("First list element: ${listOfIntegers[0]}");
  print("First four list elements: ${listOfIntegers.take(4)}");
  print("All list elements: $listOfIntegers");
  listOfIntegers.clear();

  print("\nSet:");
  Set<int> setOfItntegers = {1,2,3,4,5};
  Set<int> secondSetOfInteger = {3,4,5,6,7};
  setOfItntegers.add(6);
  secondSetOfInteger.add(8);
  print("First set: $setOfItntegers");
  print("Second set: $secondSetOfInteger");
  print("Intersection: ${setOfItntegers.intersection(secondSetOfInteger)}");
  print("Difference: ${setOfItntegers.difference(secondSetOfInteger)}");
  print("Union: ${setOfItntegers.union(secondSetOfInteger)}");

  print("\nMap:");
  Map<int,String> mapOfPersons = {
    1:"Alex",
    2:"Anton",
    3:"Ivan"
  };
  mapOfPersons[1] = "newPerson";
  print("All map elements: ${mapOfPersons.entries}");
  print("All map keys: ${mapOfPersons.keys}");
  print("All map values: ${mapOfPersons.values}");
  mapOfPersons.remove(1);
  print(mapOfPersons.containsValue("Alex"));
  print("All map elements: ${mapOfPersons.entries}");

  print("Continue и break:");
  for(int i=0;i<15;i++){
    if(i==12) {
      print("Break statement");
      break;
    }
    if(i%3==0) {
      print("Continue statement");
      continue;
    }
    print(i);
  }

  print("Exceprion handling:");
  try{
    print(listOfIntegers[25]);
  }
  on IndexError{
    print("IndexError catched");
  }
  catch(e){
    print("Some exception catched: ${e.toString()}");
  }
  finally{
    print("Try-catch block end");
  }
}


void functionToBeCalled(){
  print("Function as parameter");
}
