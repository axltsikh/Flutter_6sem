import 'package:cloud_firestore/cloud_firestore.dart';


class DataRepository {
  // 1
  final CollectionReference collection =
  FirebaseFirestore.instance.collection('pets');
  // 2
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

}