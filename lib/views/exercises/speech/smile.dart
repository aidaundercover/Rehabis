import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class Smiley extends StatefulWidget {
  const Smiley({Key? key}) : super(key: key);

  @override
  State<Smiley> createState() => _SmileyState();
}

class _SmileyState extends State<Smiley> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: exerciseAppbar('Exercise "Smiley"', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            textHeader(width, "It's better to use a mirror or selfie camera for this exercise. It is a simple speech therapy exercise that helps improve oral motor skills."),
            LottieBuilder.asset('assets/smiley.json'),
            SizedBox(
              width: width*0.88,
              child: Column(
                children: [
                  Text("How to practice smiling:", style: TextStyle(fontFamily: "Inter", fontSize: 24, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.92)),),
                  SizedBox(height:15),
                  Text("1.Stand in front of the mirror or camera and smile.\n2.Stretch the corners of your mouth as much as possible.\n3.Hold for 2 seconds.\n4.Then, relax.",
                        style: TextStyle(color: Colors.black54, fontFamily: 'Inter', fontSize: 17),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    width: width * 0.88,
                    height:65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.05),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.01),
                          offset: Offset(3,3),
                          spreadRadius: 10,
                          blurRadius: 5
                        )
                      ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.tips_and_updates,color: Colors.yellow.withOpacity(0.6), size:width*0.1),
                        SizedBox(
                          width: width*0.65,
                          child: Text("Keep doing this for as long as you can. The mirror provides feedback that is important for tracking progress.", style: TextStyle(color: Colors.grey))),
                      ],
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
