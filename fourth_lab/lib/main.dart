import 'package:flutter/material.dart';
import 'package:fourth_lab/secondScreen.dart';

import 'Channel.dart';
import 'Model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {

  List<Model> users = <Model>[
    Model("Moscow","Autumn 2023 - 7 days","https://upload.wikimedia.org/wikipedia/commons/8/85/Saint_Basil%27s_Cathedral_and_the_Red_Square.jpg",
        "Heart of Russia","Moscow is situated on the Moskva River in the Central Federal District of European Russia making it the world's most populated inland city. The city is well known for its unique architecture which consists of many different historic buildings such as Saint Basil's Cathedral with its brightly coloured domes.","https://cdn.pixabay.com/photo/2014/03/24/17/18/maple-295344_1280.png"),
    Model("Warsaw","Spring 2023 - 3 days","https://images.unsplash.com/photo-1519197924294-4ba991a11128?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2Fyc2F3fGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        "The capital of Poland","Warsaw is the epitome of a dynamic European metropolis, its trademarks – besides a rich history – being its open-minded residents, the River Vistula and exceptional cuisine. The Polish capital is a city that is constantly changing, to be discovered anew with every successive visit.","https://static.wixstatic.com/media/936d70_a600f9546b5c4bf885b1bac36864af4d~mv1.png/v1/crop/x_0,y_0,w_772,h_897/fill/w_640,h_750,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/936d70_a600f9546b5c4bf885b1bac36864af4d~mv1.png"),
    //https://cdn3.iconfinder.com/data/icons/flower-16/32/Lily_flower-512.png
    Model("Prague","Summer 2023 - 10 days ","https://images.unsplash.com/photo-1600623471616-8c1966c91ff6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJhZ3VlfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
        "Сity of hundred spires","Prague is the capital and the largest city of the Czech Republic situated in the middle of Bohemia on the Vltava River. It took the city eleven centuries to get the look we know today. Nowadays it covers an area of 496 square kilometres and has about 1 240 000 inhabitants.","https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Sun_white_icon.svg/2040px-Sun_white_icon.svg.png"),
    Model("Cortina","Winter 2023 - 15 days","https://100dorog.ru/upload/contents/432/2017/7023513-Luchshie_gornolyzhny12232923.jpg?width=795&scale=both",
        "Cortina d'Ampezzo","The traditions, the ski events, and a film set right in the heart of this UNESCO World Heritage Site all make it a glamorous destination. Italy held its first Olympic games here in 1956; the games return to Italy in 2026, co-hosted by the Queen of the Dolomites and Milan.","https://static.vecteezy.com/system/resources/thumbnails/011/025/390/small/christmas-snowflake-winter-free-png.png")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ThirdLab"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25),
                    child: Text("My trips",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 200),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> Channel()));
                      },
                      child: Text("Channel"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 671,
                child: ListView.builder(
                  itemCount: users.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (BuildContext context,int index){
                    return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=> SecondRoute(users,index)));
                          },
                          child: Container(

                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(users[index].photoURL),
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.topCenter
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(30))
                            ),
                            child: Row(
                              children: [

                                Expanded(
                                    flex: 3,
                                    child: Column(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Text(""),
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: Image.network(users[index].iconPng,width: 200,height: 200,)
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Column(
                                              children: [
                                                Text(users[index].countryName,style: TextStyle(color: Colors.white,fontSize: 25),),
                                                Text(users[index].date,style: TextStyle(color: Colors.white,fontSize:15),)
                                              ],
                                            )
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: Text(""),
                                        )
                                      ],
                                    )
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      margin: const EdgeInsets.only(top: 110,left: 80),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: const CircleAvatar(
                                          maxRadius: 10.0,
                                          backgroundImage: NetworkImage(
                                            "https://sun9-9.userapi.com/impf/c845523/v845523112/cdc35/NNmgtX0BlH8.jpg?size=720x480&quality=96&sign=c8665e8fec56d8c0f1443c3629139737&type=album",
                                          ),
                                        )
                                      )
                                    )
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      );
  }
}
