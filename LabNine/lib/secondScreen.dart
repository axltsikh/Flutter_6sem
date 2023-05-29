import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Model.dart';

class SecondRoute extends StatelessWidget {
  SecondRoute(this.trips,{super.key}){}
  final Model trips;
  @override
  Widget build(BuildContext context) {
    return Details(trips);
  }
}
class Details extends StatelessWidget{
  Details(this.model,{super.key});
  final Model model;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
          child: Column(
            children: [
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 35),
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(model.photoURL),
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                    margin: EdgeInsets.only(top: 5,left: 5),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          color: Colors.white ,
                                          icon: const Icon(Icons.arrow_back_outlined),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        Container(
                                          child: Text("Back",style: (TextStyle(color: Colors.white)),),
                                        )
                                      ],
                                    )
                                ),
                              )
                            ],
                          ),
                        ),const Expanded(
                            flex: 3,
                            child:Text("")
                        ),
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Image.network(model.iconPng,width: 100,height: 100,)
                              ),
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(model.countryName,style: TextStyle(color: Colors.white,fontSize: 25),),
                              ),
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(model.date,style: TextStyle(color: Colors.white,fontSize: 18),),
                              ),
                            )
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                width: 400,
                child: Column(
                  children: [
                    Align(
                      alignment:  Alignment.center,
                      child: Text(model.descriptionHeader,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Align(
                        alignment:  Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(model.fullDesciption,style: TextStyle(color: Colors.grey),),
                        )
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}