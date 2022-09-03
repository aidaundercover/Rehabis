import 'package:flutter/material.dart';

class Goals extends StatefulWidget {
  const Goals({Key? key}) : super(key: key);

  @override
  State<Goals> createState() => _GoalsState();
}

class _GoalsState extends State<Goals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          Text("Week Goal", style: TextStyle()),

          Row(
            children:List.generate(
              7, (int index) => Padding(padding: EdgeInsets.symmetric(horizontal:10),
              child: Container(child: Text('')))
            )
          )
        
      ]),
    );
  }
}
