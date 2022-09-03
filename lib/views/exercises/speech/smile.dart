import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class Smiley extends StatefulWidget {
  const Smiley({Key? key}) : super(key: key);

  @override
  State<Smiley> createState() => _SmileyState();
}

class _SmileyState extends State<Smiley> {
  bool isStarted = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isStarted = false;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    int score = 0;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TextButton(
        onPressed: () {
          setState(() {
            isStarted = !isStarted;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom:14.0),
          child: Container(
            width: width * 0.27,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: isStarted ? secondPrimaryColor.withOpacity(0.7) : secondPrimaryColor,
            ),
            alignment: Alignment.center,
            child: Text(isStarted ? "Stop" : "Start", style: TextStyle(fontFamily: "Inter", color: Colors.white, fontSize: 17, ))
          ),
        ),
      ),
      appBar: exerciseAppbar('Exercise "Smiley"', context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              headerExercise(width,
                  "It's better to use a mirror or selfie camera for this exercise. It is a simple speech therapy exercise that helps improve oral motor skills.", score),
              isStarted ? LottieBuilder.asset('assets/smiley.json', animate: isStarted,) : SizedBox(
                width: width * 0.88,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text(
                      "How to practice smiling:",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: secondPrimaryColor),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "1.Stand in front of the mirror or camera and smile.\n2.Stretch the corners of your mouth as much as possible.\n3.Hold for 2 seconds.\n4.Then, relax.",
                      style: TextStyle(
                          color: Colors.black54,
                          fontFamily: 'Inter',
                          fontSize: 17),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    !isStarted ? Container(
                      width: width * 0.88,
                      height: 65,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black.withOpacity(0.05),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.01),
                                offset: Offset(3, 3),
                                spreadRadius: 10,
                                blurRadius: 5)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.tips_and_updates,
                              color: Colors.yellow.withOpacity(0.6),
                              size: width * 0.1),
                          SizedBox(
                              width: width * 0.65,
                              child: Text(
                                  "Keep doing this for as long as you can. The mirror provides feedback that is important for tracking progress.",
                                  style: TextStyle(color: Colors.grey))),
                        ],
                      ),
                    ) : Container(),
                    SizedBox(height:20)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
