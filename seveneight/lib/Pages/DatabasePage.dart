import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../Transport.dart';

class DatabasePage extends StatefulWidget{
  DatabasePage({super.key,required this.database}){}
  Future<Database> database;
  @override
  State<StatefulWidget> createState() => _DatabasePageState(database);

}


class _DatabasePageState extends State<DatabasePage>{
  _DatabasePageState(this.database);
  Future<Database> database;
  Future<void> insertTranport(Transport transport) async{
    final db = await database;
    await db.insert("Transport", transport.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
  }
  void getClick() async{
    String buffer = "";
    List<Transport> transport = await getTransport();
    transport.forEach((element) {
      buffer += element.toString() + "\n";
    });
    setState(() {
      output.text = buffer;
    });
  }
  Future<List<Transport>> getTransport() async{
    final db = await database;
    final List<Map<String,dynamic>> maps = await db.query('Transport');
    return List.generate(maps.length, (index){
      return Transport(id: maps[index]['id'], type: maps[index]['type'], year: maps[index]['year'], brand: maps[index]['brand'], model: maps[index]['model']);
    });
  }
  Future<void> deleteTransport(int id) async{
    final db = await database;
    int a = await db.delete(
        'Transport',
        where: "id = ?",
        whereArgs: [id]
    );
    setState(() {
      if(a>0){
        deleteResult.text = "Успешно удалено";
      }else{
        deleteResult.text = "Запись не найдена";
      }
    });
  }
  Future<void> updateTransport(Transport transport) async{
    final db = await database;
    await db.update(
        'Transport',
        transport.toMap(),
        where: "id = ?",
        whereArgs: [transport.id]
    );
  }
  TextEditingController id = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController brand = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController output = TextEditingController();

  TextEditingController deleteID = TextEditingController();
  TextEditingController deleteResult = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Database"),
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25,bottom: 15),
                  child: Text("Добавление/изменение"),
                ),
                Container(
                  width: 250,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CupertinoTextField(
                        placeholder: "ID для изменения",
                        controller: id,
                      ),
                      CupertinoTextField(
                        placeholder: "Тип",
                        controller: type,
                      ),
                      CupertinoTextField(
                        placeholder: "Год",
                        keyboardType: TextInputType.number,
                        controller: year,
                      ),
                      CupertinoTextField(
                        placeholder: "Марка",
                        controller: brand,
                      ),
                      CupertinoTextField(
                        placeholder: "Модель",
                        controller: model,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: CupertinoButton(child: Text("Добавить"), onPressed: (){
                    if(id.text == "" || id.text == null){
                      insertTranport(new Transport(id: null, type: type.text, year: int.parse(year.text), brand: brand.text, model: model.text));
                    }
                    else{
                      updateTransport(new Transport(id: int.parse(id.text), type: type.text, year: int.parse(year.text), brand: brand.text, model: model.text));
                    }
                  }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  child: CupertinoButton(child: Text("Получить данные"), onPressed: (){
                    getClick();
                  }),
                ),
                Text(
                    output.text
                ),
                Container(
                  margin: EdgeInsets.only(top: 0,bottom: 15),
                  child: Text("Удаление"),
                ),
                Container(
                  width: 250,
                  child: CupertinoTextField(
                    placeholder: "ID удаляемого элемента",
                    keyboardType: TextInputType.number,
                    controller: deleteID,
                  ),
                ),
                CupertinoButton(child: Text("Удалить"), onPressed: (){
                  deleteTransport(int.parse(deleteID.text));
                }),
                Text(
                    deleteResult.text
                ),
              ],
            ),
          )
        )
    );
  }
}