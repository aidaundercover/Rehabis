
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class GloveOne extends StatefulWidget {
  const GloveOne({Key? key}) : super(key: key);

  @override
  State<GloveOne> createState() => _GloveOneState();
}

class _GloveOneState extends State<GloveOne> {
  int fingerPosition = 1;
  List<bool> fingers = [false, false, false, false, false];
  int counter = 0;

  void updateStarCount(Object? data) {
    setState(() {
      fingerPosition = int.parse(data.toString());

      fingers[fingerPosition - 1] = true;

      switch (fingerPosition - 1) {
        case 0:
          {
            fingers[1] = false;
            fingers[2] = false;
            fingers[3] = false;
            fingers[4] = false;
          }
          break;
        case 1:
          {
            fingers[0] = false;
            fingers[2] = false;
            fingers[3] = false;
            fingers[4] = false;
          }
          break;
        case 2:
          {
            fingers[0] = false;
            fingers[1] = false;
            fingers[3] = false;
            fingers[4] = false;
          }
          break;
        case 3:
          {
            fingers[0] = false;
            fingers[1] = false;
            fingers[2] = false;
            fingers[4] = false;
          }
          break;
        case 4:
          {
            fingers[0] = false;
            fingers[1] = false;
            fingers[3] = false;
            fingers[3] = false;
          }
      }

      counter++;
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('LR/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      updateStarCount(data);

      print(data);
    });

    counter = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait ? true: false;

    Widget circle(Color color) {
      return Container(decoration: BoxDecoration(color: color));
    }

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: exerciseAppbar("Fingers exercise", context, "Glove", counter, 'timer', 'Arm mobility', 1 ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  headerExercise(width,
                      "This exercise is created to enhance finger flexibility and reduce bone tremor", counter),
                  
                ],
              ),
              Stack(children: [
                SizedBox(
                  height: height*0.86,
                  child: Image.asset("assets/glove.png")),
                isPortrait ? AnimatedPositioned(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 450),
                  left: fingers[0]
                      ? width * 0.37

                      : fingers[1]
                          ? width * 0.285
                          : fingers[2]
                              ? width * 0.43
                              : fingers[3]
                                  ? width * 0.577
                                  : width * 0.83,
                  top: fingers[0]
                      ? 150
                      : fingers[1]
                          ? 110
                          : fingers[2]
                              ? 95
                              : fingers[3]
                                  ? 135
                                  : 270,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(244, 173, 255, 1.0),
                          Color.fromRGBO(200, 186, 255, 1.0)
                        ])),
                    alignment: Alignment.center,
                    child: Text("$fingerPosition"),
                  ),
                ) : AnimatedPositioned(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 450),
                  left: fingers[0]
                      ? width * 0.13
                      : fingers[1]
                          ? width * 0.285
                          : fingers[2]
                              ? width * 0.43
                              : fingers[3]
                                  ? width * 0.577
                                  : width * 0.83,
                  top: fingers[0]
                      ? 150
                      : fingers[1]
                          ? 110
                          : fingers[2]
                              ? 95
                              : fingers[3]
                                  ? 135
                                  : 270,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(244, 173, 255, 1.0),
                          Color.fromRGBO(200, 186, 255, 1.0)
                        ])),
                    alignment: Alignment.center,
                    child: Text("$fingerPosition"),
                  ),
                )
              ])
            ],
          ),
        ));
  }
}
