import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Login.dart';
import 'firebase_options.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}