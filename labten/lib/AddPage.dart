import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  Future<void> add()async{
    FirebaseFirestore.instance.collection("Transport").add({
      'model':_emailTextController.text,
      'brand':_passwordTextController.text
    }).then((value){

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title"),),
      body: Column(
        children: [
          TextField(controller: _emailTextController,),
          SizedBox(height: 15,),
          TextField(controller: _passwordTextController,),
          SizedBox(height: 15,),
          OutlinedButton(onPressed: (){add();}, child: Text("Создать"))
        ],
      ),
    );
  }

}