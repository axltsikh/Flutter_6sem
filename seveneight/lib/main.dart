import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path/path.dart';
import 'package:seveneight/Pages/DatabasePage.dart';
import 'package:seveneight/Pages/FileSystemPage.dart';
import 'package:seveneight/Pages/HivePage.dart';
import 'package:seveneight/Pages/SharedPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'Transport.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
      join(await getDatabasesPath(),"tranport.db"),
      version: 1,
      onCreate: (db,version){
        return db.execute("CREATE TABLE Transport(id INTEGER PRIMARY KEY,type text,year INTEGER,brand text,model text)");
      }
  );
  final prefs = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(TransportAdapter());
  var box = await Hive.openBox<Transport>("transport");
  runApp(MyApp(database: database,prefs: prefs));
}

class MyApp extends StatelessWidget {
  MyApp({super.key,required this.database,required this.prefs});
  Future<Database> database;
  SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page',database: database, prefs: prefs,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title, required this.database,required this.prefs});
  final String title;
  Future<Database> database;
  SharedPreferences prefs;
  @override
  State<MyHomePage> createState() => _MyHomePageState(database,prefs);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.database,this.prefs);
  Future<Database> database;
  SharedPreferences prefs;
  List<Widget>? _widgetOptions;
  @override
  void initState() {
    _widgetOptions = <Widget>[
      DatabasePage(database: database),
      SharedPage(prefs: prefs),
      FileSystemPage(),
      HivePage()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.dataset),label: "База данных"),
            BottomNavigationBarItem(icon: Icon(Icons.share),label: "Shared preferences"),
            BottomNavigationBarItem(icon: Icon(Icons.file_open),label: "FileSystem"),
            BottomNavigationBarItem(icon: Icon(Icons.hive),label: "Hive"),
          ],
        ),
        tabBuilder: (BuildContext context,int index){
          return CupertinoTabView(
            builder: (BuildContext context){
              return _widgetOptions![index];
            },
          );
        }
    );
  }
}
