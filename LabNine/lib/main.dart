
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:labnine/home_event.dart';
import 'package:labnine/secondScreen.dart';

import 'Model.dart';
import 'home_bloc.dart';
import 'home_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeSreen(),
    ),
  );
}

class HomeSreen extends StatefulWidget {
  const HomeSreen({Key? key}) : super(key: key);
  @override
  State<HomeSreen> createState() => _HomeSreenState();
}

class _HomeSreenState extends State<HomeSreen> {
  late BuildContext mycontext;
  @override
  void initState() {
    super.initState();
    mycontext = context;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("BLoC architecture")),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {

          },
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            if (state is HomeSuccessFetchDataState) {
              return Center(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _buildCard(state.foods[index],context);
                  },
                  itemCount: state.foods.length,
                ),
              );
            }
            return Center(
              child: ElevatedButton(
                child: const Text("Fetch Data"),
                onPressed: () {

                  mycontext.read<HomeBloc>().add(FetchDataEvent());
                },
              ),
            );
          },
        ),
      ),
    );
  }
  Widget _buildCard(Model model,BuildContext context){
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: InkWell(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) => SecondRoute(model)));
          },
          child: Container(

            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(model.photoURL),
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
                            child: Image.network(model.iconPng,width: 200,height: 200,)
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Text(model.countryName,style: TextStyle(color: Colors.white,fontSize: 25),),
                                Text(model.date,style: TextStyle(color: Colors.white,fontSize:15),)
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
  }
}