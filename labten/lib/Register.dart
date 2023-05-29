import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  _RegisterPageState(){
    init();
  }
  Future<void> init()async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,).then((value) => {
      _auth = FirebaseAuth.instance
    });
  }
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  FirebaseAuth? _auth;
  void _register() async {
    final User? user = (await
    _auth!.createUserWithEmailAndPassword(
      email: _emailTextController.text,
      password: _passwordTextController.text,
    )
    ).user;
    if (user != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Notification"),
              content: Text("Регистрация успешна"),
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
          OutlinedButton(onPressed: (){_register();}, child: Text("Создать аккаунт"))
        ],
      ),
    );
  }
}