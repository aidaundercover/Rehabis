import 'dart:async';
import 'package:confetti/confetti.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/services/exercise_api.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class ExerciseThree extends StatefulWidget {
  const ExerciseThree({Key? key}) : super(key: key);

  @override
  State<ExerciseThree> createState() => _ExerciseThreeState();
}

class _ExerciseThreeState extends State<ExerciseThree> {
  late int points;
  late int pressed;

  Duration duration = const Duration();
  Timer? timer;
  bool isRunning = false;

  List<List<bool>> isSelected = [];

  int capPosition = 1;
  bool isPressed = false;
  int count = 0;
  final controller = ConfettiController();


  void updateStarCount(Object? data) {
    setState(() {
      capPosition = int.parse(data.toString());

      if (capPosition % 2 == 1) {
        isPressed = true;
      }

      if (capPosition % 2 == 0) {
        isPressed = false;
      }

      count++;
    });
  }



  @override
  void initState() {
    // TODO: implement initState

    count = 0;

    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('LR/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      updateStarCount(data);
    });

    controller.addListener(() {
      isPressed ? controller.play() : controller.stop();
    });

    super.initState();
    points = 0;
    pressed = 0;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getPoint() {
    setState(() {
      if (points == 4) {
      } else {
        points++;
      }
    });
  }

  void getError() {
    setState(() {
      if (points == 4) {
      } else {
        pressed++;
      }
    });
  }

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    mounted
        ? setState(() {
            isRunning = true;
          })
        : () {};
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer(int errors, double width) {
    if (mounted) {
      setState(() async {
        timer?.cancel();
        isRunning = false;

        String twoDigits(int n) => n.toString().padLeft(2, '0');
        final minutes = twoDigits(duration.inMinutes.remainder(60));
        final seconds = twoDigits(duration.inSeconds.remainder(60));

        uploadExercise('None', points, '$minutes : $seconds',
            'Find a third wheel', "Attention", 1);

        showDialog(
            context: (context),
            builder: (_) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 210,
                  width:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? width * 0.8
                          : width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 4, color: Colors.purple)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Text("Well done!",
                              style: TextStyle(
                                  color: deepPurple,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Inter"))),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Row(
                          children: [
                            Text("Execution time:",
                                style: TextStyle(
                                  color: deepPurple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("$minutes: $seconds",
                                style: TextStyle(
                                  color: deepPurple,
                                  fontSize: 15,
                                ))
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13.0),
                        child: Row(
                          children: [
                            Text("Number of errors:",
                                style: TextStyle(
                                  color: deepPurple,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                )),
                            const SizedBox(
                              width: 5,
                            ),
                            Text("$errors",
                                style: TextStyle(
                                  color: deepPurple,
                                  fontSize: 15,
                                ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            child: Container(
                              width: 100,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.purple.shade200),
                              child: Row(
                                children: const [
                                  Text("Restart",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white)),
                                  Icon(Icons.replay, color: Colors.white)
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.of(context).pop();
                              isRunning = true;

                              startTimer();
                            },
                          ),
                          const SizedBox(width: 7),
                          TextButton(
                            child: Container(
                              width: 100,
                              height: 35,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.purple.shade200),
                              child: Row(
                                children: [
                                  Text("Exit",
                                      style:
                                          const TextStyle(color: Colors.white)),
                                  Icon(Icons.exit_to_app, color: Colors.white)
                                ],
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });

        duration = Duration();
        points = 0;
        pressed = 0;

      });
    }
  }


  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget appBar() {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textHeader(width * 0.7,
                    'The exercise helps with an attention and a logic, in order to execue an exercise one should be able to identify the exceeding element of a group'),
                TextButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Container(
                      width: width * 0.25,
                      height: 40,
                      decoration: BoxDecoration(
                        color: isRunning ? deepPurple : primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      alignment: Alignment.center,
                      child: Text(isRunning ? "GO!" : "Start!",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Ruberoid",
                              fontSize: 19,
                              shadows: [
                                isRunning
                                    ? Shadow(
                                        offset: const Offset(3, 3),
                                        color: Colors.white.withOpacity(0.3),
                                        blurRadius: 5)
                                    : const Shadow(
                                        offset: Offset(3, 3),
                                        color: Colors.transparent,
                                        blurRadius: 5)
                              ])),
                    ))
              ],
            ),
          ],
        ),
      );
    }

    Widget main() {
      return Center(
        child: SizedBox(
            width: width * 0.92,
            child: Column(children: [
              textHeader(width,
                  "Using 'Cubes' equipment user supposed to train the wrist and low-palm area"),
              SizedBox(
                height: height * 0.14,
              ),
              const Text(
                "Press cubes with both hands in turn",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Inter", fontSize: 27),
              ),
              const SizedBox(
                height: 30,
              ),
              Stack(children: [
                Container(
                  width: width * 0.9,
                  height: height * 0.4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3,),
                      shape: BoxShape.circle,
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: width * 0.35,
                        child: Text(
                          "Press LEFT cube",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 15,
                              fontFamily: "Inter"),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.35,
                        child: Text(
                          "Press RIGHT cube",
                          style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 15,
                              fontFamily: "Inter"),
                        ),
                      )
                    ],
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInCubic,
                  duration: const Duration(milliseconds: 450),
                  left: isPressed ? width * 0.45 : 0,
                  child: Container(
                    width: width * 0.45,
                    height: height * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(244, 173, 255, 1.0),
                          Color.fromRGBO(200, 186, 255, 1.0)
                        ])),
                  ),
                )
              ])
            ])),
      );
    }

    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
      appBar: exerciseAppbar('Find a Third Wheel', context, 'None', points,
          '$minutes : $seconds', "Attention", 1),
      persistentFooterButtons: [
        Center(
          child: TextButton(
            onPressed: () {
              if (isRunning) stopTimer(4 - points, width);
            },
            child: const Text(
              "STOP",
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              height: 20,
            ),
            main(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
