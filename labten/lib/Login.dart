import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'MainPage.dart';
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
  String text = "";
  void showText(){
    setState(() {
      text = "Visible";
    });
  }
  final todos = <String>["first","second","third"];
  void _signInWithEmailAndPassword() async {
    final User? user = (await _auth?.signInWithEmailAndPassword(
      email: "lioshatichon@gmail.com",
      password: "123456",
    ))?.user;
    if (user != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
    } else {
      print("error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: SizedBox(

              width: 250,
              child: TextField(controller: _emailTextController,key: Key("EmailInput")),
            ),
          ),
          SizedBox(height: 15,),
          SizedBox(
            width: 250,
            child: TextField(controller: _passwordTextController,),
          ),
          SizedBox(height: 15,),
          OutlinedButton(onPressed: (){_signInWithEmailAndPassword();}, child: Text("Войти"),key: Key("asd"),),
          SizedBox(height: 15,),
          OutlinedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));}, child: Text("Регистрация"),key: Key("registerButton"),),
          // OutlinedButton(onPressed: (){showText();}, child: Text("Показать текст"),key: Key("showText"),),
          // Text(text),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];

                return Dismissible(
                  key: Key('$todo$index'),
                  onDismissed: (direction) => todos.removeAt(index),
                  background: Container(color: Colors.red),
                  child: ListTile(title: Text(todo)),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}