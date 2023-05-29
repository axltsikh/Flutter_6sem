import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void _register() async {
    final User? user = (await
    _auth.createUserWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    )
    ).user;
    if (user != null) {
      print("success");
    } else {
      print("error");
    }
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
          OutlinedButton(onPressed: (){_register();}, child: Text("Создать аккаунт"))
        ],
      ),
    );
  }
}