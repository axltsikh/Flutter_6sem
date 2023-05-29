import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Register.dart';
import 'firebase_options.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  _LoginPageState(){
    init();
  }
  Future<void> init()async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((value) => {
      _auth = FirebaseAuth.instance
    });

  }
  FirebaseAuth? _auth;
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  void _signInWithEmailAndPassword() async {
    final User? user = (await _auth?.signInWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    ))?.user;

    if (user != null) {
      print("login success");
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
          OutlinedButton(onPressed: (){_signInWithEmailAndPassword();}, child: Text("Войти")),
          SizedBox(height: 15,),
          OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));}, child: Text("Регистрация"))
        ],
      ),
    );
  }
}