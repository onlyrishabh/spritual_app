import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_yoga/Screens/WorkOutDet.dart';
import 'package:flutter_yoga/model/model.dart';
import 'package:provider/provider.dart';

class BreakTime extends StatelessWidget {
  List<Yoga> ListOfYoga;
  int yogaindex;

  BreakTime({
    required this.ListOfYoga,
    required this.yogaindex,

  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModelSec>
      (create:(context)=>TimerModelSec(context , ListOfYoga , yogaindex) ,
    child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage("https://images.unsplash.com/photo-1614236224416-9a88c2e195e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=329&q=80" )
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
        Text("Break Time" , style: TextStyle(fontSize: 35 , fontWeight: FontWeight.bold, color: Colors.white),),
            Consumer<TimerModelSec>(
              builder: (context , myModel , child){
                return  Text(myModel.countdown.toString() ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 65 ,color: Colors.white),);
              },

            ),
            SizedBox(height: 20,),
            Consumer<TimerModelSec>(
              builder: (context , myModel, child){
                return ElevatedButton(onPressed: (){

myModel.skip();

                }, child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 24),

                  child: Text("SKIP" ,style: TextStyle(fontSize: 19),),
                ));
              },

            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  yogaindex !=0 ?
                  Consumer<TimerModelSec>(
                      builder : (context ,myModel, child){
                        return TextButton(onPressed: () async{
                          myModel.Pass();
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BreakTime(ListOfYoga: ListOfYoga, yogaindex: yogaindex-1)));
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkOutDet(ListOfYoga: ListOfYoga, yogaindex: yogaindex-1)));
                        }, child: Text("Previous" , style: TextStyle(fontSize: 16),));
                      }

                  ): Container(),
                  yogaindex != ListOfYoga.length-1 ?



                  Consumer<TimerModelSec>(
                      builder : (context , myModel , child){
                        return TextButton(onPressed: () async{
                          myModel.Pass();

                          await Future.delayed(Duration(seconds: 1));
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BreakTime(ListOfYoga: ListOfYoga, yogaindex: yogaindex+1)));
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkOutDet(ListOfYoga: ListOfYoga, yogaindex: yogaindex+1)));
                        }, child: Text("Next" , style: TextStyle(fontSize: 16),));
                      }

                  ) : Container()
                ],
              ),
            ),          Divider( thickness: 2,),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(

                  padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 15),
                  child:  Text("Next: ${ yogaindex >= ListOfYoga.length-1 ? "FINISH" : ListOfYoga[yogaindex].YogaTitle}" , style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold ,color: Colors.white),),
                ))

          ],
        ),
      )


    ),);
  }
}



class TimerModelSec with ChangeNotifier{
  TimerModelSec(context, List<Yoga> ListOfYoga , int yogaindex ){
    MyTimerSec(context  , ListOfYoga , yogaindex);
  }
  int countdown = 25;
  bool isPassed = false;

bool  Isskip = false;
  MyTimerSec(context , List<Yoga> ListOfYoga , int yogaindex) async{
    Timer.periodic(Duration(seconds: 1), (timer) {
      countdown--;
      notifyListeners();
      if(countdown == 0 || Isskip){
        timer.cancel();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WorkOutDet(
ListOfYoga: ListOfYoga, yogaindex: yogaindex,
        )));
      }

      else if(isPassed) {
        timer.cancel();


      }
    });
  }


  void skip(){
    Isskip = true;
    notifyListeners();
  }


  void Pass(){
    isPassed = true;
    notifyListeners();
  }

}
