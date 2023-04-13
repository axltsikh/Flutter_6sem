import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPage extends StatefulWidget{
  SharedPage({required this.prefs});
  SharedPreferences prefs;
  @override
  State<StatefulWidget> createState() => _SharedPageState(prefs: prefs);

}


class _SharedPageState extends State<SharedPage> {
  _SharedPageState({required this.prefs});
  SharedPreferences prefs;
  TextEditingController addKey = TextEditingController();
  TextEditingController addValue = TextEditingController();
  TextEditingController getKey = TextEditingController();
  TextEditingController deleteKey = TextEditingController();
  String? result = "";
  String delResultString = "";
  void addPref() async{
    await prefs.setString(addKey.text, addValue.text);
  }
  void readPref() async{
    String? res = await prefs.getString(getKey.text);
    setState(() {
      result = "Ключ: ${getKey.text}; Значение: ${res}";
    });
  }
  void deletePref() async{
    bool delResult = await prefs.remove(deleteKey.text);
    setState(() {
      if(delResult){
        delResultString = "Успешно удалено";
      }else{
        delResultString = "Запись не найдена";
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SharedPreferences"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 250,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CupertinoTextField(
                        placeholder: "Ключ",
                        controller: addKey,
                      ),
                      CupertinoTextField(
                        placeholder: "Значение",
                        controller: addValue,
                      ),
                    ],
                  ),
                ),
                CupertinoButton(
                    child: Text("Записать"),
                    onPressed: addPref
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                ),
                CupertinoTextField(
                  placeholder: "Введите ключ для считывания",
                  controller: getKey,
                ),
                CupertinoButton(
                    child: Text("Считать значение")
                    , onPressed: readPref
                ),
                Text(result ?? "Значение не существует"),
                Container(
                  margin: EdgeInsets.only(top: 50),
                ),
                CupertinoTextField(
                  placeholder: "Введите ключ для удаления",
                  controller: deleteKey,
                ),
                CupertinoButton(
                    child: Text("Удалить значение"),
                    onPressed: deletePref
                ),
                Text(delResultString)
              ],
            ),
          ),
        )
      )
    );
  }

}