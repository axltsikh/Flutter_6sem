import 'package:hive_flutter/adapters.dart';
part 'Transport.g.dart';

@HiveType(typeId: 0)
class Transport{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String type;
  @HiveField(2)
  int year;
  @HiveField(3)
  String brand;
  @HiveField(4)
  String model;

  Transport({required this.id,required this.type,required this.year,required this.brand,required this.model});
  Map<String,dynamic> toMap(){
    return{
      'id' : id,
      'type' : type,
      'year' : year,
      'brand' : brand,
      'model' : model
    };
  }
  @override
  String toString(){
    return "Transport: id: $id type: $type year: $year brand: $brand model: $model";
  }
  String toHiveString(){
    return "type: $type year: $year brand: $brand model: $model";
  }

}