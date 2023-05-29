import 'package:cloud_firestore/cloud_firestore.dart';
class Transport{
  String brand;
  String model;
  Transport(this.model,this.brand);
  factory Transport.fromJson(Map<String, dynamic> json) =>
      _transportFromJson(json);
  // 4
  Map<String, dynamic> toJson() => _transportToJson(this);

  static List<Transport> fromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((e) => Transport( e.get("model"), e.get("brand"))).toList();
  }
}
Transport _transportFromJson(Map<String, dynamic> json) {
  return Transport(
      json['model'] as String,
      json['brand'] as String,
  );
}
// 2
Map<String, dynamic> _transportToJson(Transport instance) =>
    <String, dynamic>{
      'brand': instance.brand,
      'model': instance.model,
    };