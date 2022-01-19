import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Indian Yoga App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak")
                    ],
                  ),
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak")
                    ],
                  ),
                  Column(
                    children: [
                      Text("1"),
                      Text("Streak")
                    ],
                  )

                ],
              ),
            ),
            Divider(thickness: 3,indent: 20, endIndent: 20,),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text("Yoga For All"),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5),
                   child: Container(
                     color: Colors.blueGrey,
                     height: 150,

                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 5),
                   child: Container(
                     color: Colors.blueGrey,
                     height: 150,

                   ),
                 )
               ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Yoga For Students"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      color: Colors.blueGrey,
                      height: 150,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      color: Colors.blueGrey,
                      height: 150,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      color: Colors.blueGrey,
                      height: 150,

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      color: Colors.blueGrey,
                      height: 150,

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
