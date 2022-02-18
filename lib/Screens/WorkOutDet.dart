import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/Break.dart';


import 'package:provider/provider.dart';

class WorkOutDet extends StatelessWidget {
  const WorkOutDet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>(
        create: (context)=>TimerModelSec(context) ,
    child: Scaffold(
      body: Column(

        children: [
          Container(
            height: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage("https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=920&q=80")
              )
            ),
          ),
          Spacer(),
          Text("Anulom Vilom" , style: TextStyle(fontWeight: FontWeight.w600 , fontSize: 35),),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 80),
            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 25),
           decoration: BoxDecoration(
             color: Colors.blueAccent,
             borderRadius: BorderRadius.circular(50)
           ),
            child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("00" , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30 ,color: Colors.white),),
                  Text(" : " , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30 ,color: Colors.white),),
                  Consumer<TimerModelSec>(
                    builder: (context , myModel , child){
                      return  Text(myModel.countdown.toString() ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 30 ,color: Colors.white),);
                    },

                  )],
              ),
          ),
          Spacer(),
SizedBox(height: 30,),
          ElevatedButton(onPressed: (){}, child: Container(
            padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
              child: Text("PAUSE" ,style: TextStyle(fontSize: 20),))),
          Spacer(),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){}, child: Text("Previous" , style: TextStyle(fontSize: 16),)),
                TextButton(onPressed: (){}, child: Text("Next" , style: TextStyle(fontSize: 16),))
              ],
            ),
          ),          Divider( thickness: 2,),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
                child: Text("Next: Anulom Vilom" , style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),),
              ))

        ],
      ),
    ),);
  }
}


class TimerModelSec with ChangeNotifier{
  TimerModelSec(context){
    MyTimerSec(context);
  }
  int countdown = 30;

  MyTimerSec(context) async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown == 0){
        timer.cancel();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>BreakTime(

        )));
      }
    });
  }
}

