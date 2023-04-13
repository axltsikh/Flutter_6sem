import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Transport.dart';

class HivePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HivePageState();
}
class _HivePageState extends State<HivePage> {
  Future<void> insertTransport(Transport transport) async{
    var box = Hive.box<Transport>("transport");
    box.add(transport);
  }
  void getClick() async{
    setState(() {
      output.text="";
    });
    var box = Hive.box<Transport>("transport").values.cast();
    int counter = 0;
    box.forEach((element) {
      setState(() {
        output.text += "Transport: index: $counter " + element.toHiveString();
        counter++;
        print(element.id);
      });
    });
  }
  Future<void> deleteTransport(int id) async{
    var box = Hive.box<Transport>("transport");
    box.deleteAt(id);
  }
  Future<void> updateTransport(Transport transport, int index) async{
    var box = Hive.box<Transport>("transport");
    box.putAt(index, transport);
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
          title: Text("Hive"),
        ),
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
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
                        placeholder: "Индекс для изменения",
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
                      insertTransport(new Transport(id: 0, type: type.text, year: int.parse(year.text), brand: brand.text, model: model.text));
                    }
                    else{
                      updateTransport(new Transport(id: 0, type: type.text, year: int.parse(year.text), brand: brand.text, model: model.text),int.parse(id.text));
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
                    placeholder: "Индекс удаляемого элемента",
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
