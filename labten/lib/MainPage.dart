import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labten/AddPage.dart';
import 'DataRepository.dart';
import 'Transport.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
Future<void> _messageHandler(RemoteMessage message) async {
  print('background message ${message.notification!.body}');
}
class _MainPageState extends State<MainPage> {
  final DataRepository repository = DataRepository();
  late FirebaseMessaging messaging;
  @override
  void initState() {
    super.initState();
    messaging = FirebaseMessaging.instance;
    messaging.getToken().then((value) {
      print("token: " + value.toString());
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification!.body);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text(event.notification!.body!),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
    FirebaseMessaging.onBackgroundMessage(_messageHandler);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => AddPage())); },

      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("Transport").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text('Loading');
            }
            List<Transport> developers =
            Transport.fromSnapshot(snapshot.data!);
            return ListView.builder(
              itemCount: developers.length,
              itemBuilder: (context,index){
                return Dismissible(key: Key("my"), child:ListTile(
                  title: Text(developers[index].model),
                  subtitle: Text(developers[index].brand),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: ()async{
                      await FirebaseFirestore.instance.collection("Transport").doc(snapshot.data!.docs[index].id).delete();
                    },
                  ),
                ),onDismissed: (direction) =>()async{await FirebaseFirestore.instance.collection("Transport").doc(snapshot.data!.docs[index].id).delete();});
              },
            );
          }),
    );
  }
}