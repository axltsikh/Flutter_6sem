import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class FileSystemPage extends StatefulWidget{
  FileSytemPage(){}

  @override
  State<StatefulWidget> createState() => _FielSystemPageState();

}

class _FielSystemPageState extends State<FileSystemPage> {
  TextEditingController fileContentController = TextEditingController();
  String fileContentString = "";
  void temporaryDirectory(bool isWrite) async{
    setState(() {
      fileContentString = "";
    });
    String path = (await getTemporaryDirectory()).path;
    File file = File('$path/temporary.txt');
    if(isWrite){
      file.writeAsString(fileContentController.text);
    }else{
      String fileContent = await file.readAsString();
      setState(() {
        fileContentString = fileContent;
      });
    }
  }
  void ApplicationDocumentsDirectory(bool isWrite) async{
    setState(() {
      fileContentString = "";
    });
    String path = (await getApplicationDocumentsDirectory()).path;
    File file = File('$path/index.txt');
    if(isWrite){
      file.writeAsString(fileContentController.text);
    }else{
      String fileContent = await file.readAsString();
      setState(() {
        fileContentString = fileContent;
      });
    }
  }
  void ApplicationSupportDirectory(bool isWrite) async{
    setState(() {
      fileContentString = "";
    });
    String path = (await getApplicationSupportDirectory()).path;
    File file = File('$path/index.txt');
    if(isWrite){
      file.writeAsString(fileContentController.text);
    }else{
      String fileContent = await file.readAsString();
      setState(() {
        fileContentString = fileContent;
      });
    }
  }
  void LibraryDirectory(bool isWrite) async{
    if(defaultTargetPlatform == TargetPlatform.android){
      setState(() {
        fileContentString = "Library directory не доступна в Android!";
      });
      return;
    }
    setState(() {
      fileContentString = "";
    });
    String path = (await getLibraryDirectory()).path;
    File file = File('$path/index.txt');
    if(isWrite){
      file.writeAsString(fileContentController.text);
    }else{
      String fileContent = await file.readAsString();
      setState(() {
        fileContentString = fileContent;
      });
    }
  }
  void ExternalStorageDirectory(bool isWrite) async{
    setState(() {
      fileContentString = "";
    });
    String? path = (await getExternalStorageDirectory())?.path;
    File file = File('$path/index.txt');
    if(isWrite){
      file.writeAsString(fileContentController.text);
    }else{
      String fileContent = await file.readAsString();
      setState(() {
        fileContentString = fileContent;
      });
    }
  }
  void ExternalCacheDirectories(bool isWrite) async{
    setState(() {
      fileContentString = "";
    });
    String? path = (await getExternalCacheDirectories())?.first.path;
    File file = File('$path/index.txt');
    if(isWrite){
      file.writeAsString(fileContentController.text);
    }else{
      String fileContent = await file.readAsString();
      setState(() {
        fileContentString = fileContent;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FileSystem")),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 25),
                width: 250,
                child: CupertinoTextField(
                  placeholder: "Введите содержимое файла",
                  controller: fileContentController,
                ),
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Записать в\nTemporaryDirectory"),
                      onPressed: (){
                        temporaryDirectory(true);
                      }
                  ),
                  CupertinoButton(
                      child: Text("Считать из\nTemporaryDirectory "),
                      onPressed: (){
                        temporaryDirectory(false);
                      }
                  )
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Записать в\nDocumentsDirectory"),
                      onPressed: (){
                        ApplicationDocumentsDirectory(true);
                      }
                  ),
                  CupertinoButton(
                      child: Text("Считать из\nDocumentsDirectory "),
                      onPressed: (){
                        ApplicationDocumentsDirectory(false);
                      }
                  )
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Записать в\nSupportDirectory"),
                      onPressed: (){
                        ApplicationSupportDirectory(true);
                      }
                  ),
                  CupertinoButton(
                      child: Text("Считать из\nSupportDirectory "),
                      onPressed: (){
                        ApplicationSupportDirectory(false);
                      }
                  )
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Записать в\nLibraryDirectory"),
                      onPressed: (){
                        LibraryDirectory(true);
                      }
                  ),
                  CupertinoButton(
                      child: Text("Считать из\nLibraryDirectory "),
                      onPressed: (){
                        LibraryDirectory(false);
                      }
                  )
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Записать в\nStorageDirectory"),
                      onPressed: (){
                        ExternalStorageDirectory(true);
                      }
                  ),
                  CupertinoButton(
                      child: Text("Считать из\nStorageDirectory "),
                      onPressed: (){
                        ExternalStorageDirectory(false);
                      }
                  )
                ],
              ),
              Row(
                children: [
                  CupertinoButton(
                      child: Text("Записать в\nCacheDirectories"),
                      onPressed: (){
                        ExternalCacheDirectories(true);
                      }
                  ),
                  CupertinoButton(
                      child: Text("Считать из\nCacheDirectories "),
                      onPressed: (){
                        ExternalCacheDirectories(false);
                      }
                  )
                ],
              ),
              Text(fileContentString)
            ],
          ),
        )
      )
    );
  }
  
  
}