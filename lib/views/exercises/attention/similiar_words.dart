import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/database/getData.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/services/exercise_api.dart';
import 'package:rehabis/widgets/audio_player.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class ExerciseTwo extends StatefulWidget {
  const ExerciseTwo({Key? key}) : super(key: key);

  @override
  State<ExerciseTwo> createState() => _ExerciseTwoState();
}

class _ExerciseTwoState extends State<ExerciseTwo> {
  late int points;
  late int pressed;

  Duration duration = Duration();
  Timer? timer;
  bool isRunning = false;

  List<List<bool>> isSelected = [];

  void getPoint() {
    setState(() {
      points++;
    });
  }

  void getError() {
    setState(() {
      pressed++;
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
    setState(() {
      isRunning = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer(int errors, double width) {


    setState(() {
      timer?.cancel();
      isRunning = false;

      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));

      uploadExercise('None', points, '$minutes : $seconds',
          'Similiar sounds', "Attention", 3);

      showDialog(
          context: (context),
          builder: (_) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 210,
                width : MediaQuery.of(context).orientation == Orientation.portrait ? width*0.8 : width*0.6,
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
                              children: [
                                Text("Restart",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white)),
                                Icon(Icons.replay, color : Colors.white)
                              ],
                            ),
                          ),
                          onPressed: () {
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
                            child: Row(
                              children: [
                                const Text("Exit",
                                    style: TextStyle(color: Colors.white)),
                                Icon(Icons.exit_to_app, color : Colors.white)
                              ],
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.purple.shade200),
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
      isSelected = [
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false]
    ];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = [
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false]
    ];

    points = 0;
    pressed = 0;
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
            SizedBox(
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
                                        offset: Offset(3, 3),
                                        color:
                                            Colors.white.withOpacity(0.3),
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
      return SizedBox(
          width:  MediaQuery.of(context).orientation == Orientation.landscape ? width * 0.5 : width*0.5,
          height: MediaQuery.of(context).orientation == Orientation.landscape
              ? height * 0.75
              : height * 0.5,
          child: CarouselSlider(
            options: CarouselOptions(
              height:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? height * 0.45
                        : height * 0.75,
                clipBehavior: Clip.antiAlias,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false),
            items: List.generate(
                similiarWordsData.length,
                (index) => Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 248, 248, 248),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(3, 4),
                              color: Colors.black.withOpacity(0.17),
                              blurRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AudioPlay(
                            audioAsset: similiarWordsData[index]['audioFile']),
                        SizedBox(
                          child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10),
                              itemCount: 4,
                              itemBuilder: (BuildContext context, int i) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        pressed++;
                                        
                                        if (isRunning) {
                                          for (int indexBtn = 0;
                                              indexBtn < isSelected.length;
                                              indexBtn++) {
                                            if (indexBtn == i) {
                                              isSelected[index][indexBtn] =
                                                  !isSelected[index][indexBtn];
                                              if (isSelected[index][indexBtn]) {
                                                if (indexBtn ==
                                                    similiarWordsData[index]
                                                        ["right"]) {
                                                  getPoint();
                                                } 
                                              }
                                            } else {
                                              isSelected[index][indexBtn] =
                                                  false;
                                            }
                                          }
                                        }
                                      });
                                    },
                                    child: Container(
                                      // width: width * 0.3,
                                      decoration: BoxDecoration(
                                          color: isSelected[index][i]
                                              ? primaryColor.withOpacity(0.6)
                                              : Colors.white,
                                          border: Border.all(
                                              width: 1,
                                              color: isSelected[index][i]
                                                  ? Colors.white
                                                  : Colors.grey.shade600),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                              
                                      child: Center(
                                        child: Text(
                                            similiarWordsData[index]['options'][i]
                                                ["title"],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontFamily: "Roboto",
                                                fontSize: 19)),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ))),
          ));
    }


    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Scaffold(
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
      appBar: exerciseAppbar('Similiar Words', context, 'None', points,
          '$minutes : $seconds', "Attention", 3),
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            const SizedBox(
              height: 20,
            ),
            main(),
          
          ],
        ),
      ),
      // bottomNavigationBar: isRunning
      //     ? GestureDetector(
      //         onTap: () {
      //           startTimer();
      //         },
      //         child: Container(
      //           decoration: BoxDecoration(
      //             color: Color.fromARGB(255, 191, 43, 255),
      //           ),
      //           width: width,
      //           height: 50,
      //           alignment: Alignment.center,
      //           child: const Text(
      //             "Завершить",
      //             style: TextStyle(
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 15,
      //                 fontFamily: 'Inter'),
      //           ),
      //         ),
      //       )
      //     : Container(),
    );
  }
}
