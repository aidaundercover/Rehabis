import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
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
    final addSeconds = 1;

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

  void stopTimer(int errors) {
    setState(() {
      timer?.cancel();
      isRunning = false;

      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));

      showDialog(
          context: (context),
          builder: (_) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                height: 210,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 4, color: Colors.purple)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text("???????????????? ????????????!",
                            style: TextStyle(
                                color: deepPurple,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ruberoid"))),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Row(
                        children: [
                          Text("?????????? ????????????????????:",
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
                          Text("???????????????????? ????????????:",
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
                            child: Text("???????????? ??????????????",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white)),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.purple.shade200),
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
                            child: const Text("??????????????????",
                                style: TextStyle(color: Colors.white)),
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

  List _questionsData = [
    {
      "audioFile": "cry.mp3",
      "options": [
        {"img": "assets/executioner.jpeg", "title": "??????????"},
        {"img": "assets/cry.png", "title": "??????????"},
        {"img": "assets/cloak.jpeg", "title": "????????"},
        {"img": "assets/rook.jpeg", "title": "????????"},
      ],
      "right": 1
    },
    {
      "audioFile": "pay.mp3",
      "options": [
        {"img": "assets/prophet.jpeg", "title": "????????????????"},
        {"img": "assets/shirt.png", "title": "??????????????"},
        {"img": "assets/hillock.jpeg", "title": "??????????"},
        {"img": "assets/payment.png", "title": "??????????????????"},
      ],
      "right": 3
    },
    {
      "audioFile": "ghost.mp3",
      "options": [
        {"img": "assets/ghost.png", "title": "????????????????????"},
        {"img": "assets/dream.jpeg", "title": "????????????????????"},
        {"img": "assets/behaviour.png", "title": "??????????????????"},
        {"img": "assets/history.jpeg", "title": "??????????????????????"},
      ],
      "right": 1
    },
    {
      "audioFile": "flaw.mp3",
      "options": [
        {"img": "assets/prophet.jpeg", "title": "????????????"},
        {"img": "assets/flaw.png", "title": "??????????"},
        {"img": "assets/flow.png", "title": "??????????"},
        {"img": "assets/pie.png", "title": "??????????"},
      ],
      "right": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    Widget appBar() {
      return Container(
          width: width,
          decoration: BoxDecoration(color: deepPurple, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 3),
                blurRadius: 5)
          ]),
          child: Container(
            width: width * 0.92,
            height: height * 0.25,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                      Text(
                        "??????????",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text("?????????????? ??????????",
                      style: TextStyle(
                          fontFamily: "Ruberoid",
                          fontSize: 25,
                          color: Colors.white)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timelapse,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text("3 ????????????",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.settings_accessibility_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              const Text("1 ??????????????",
                                  style: TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 18,
                                      color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
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
                            child: Text(isRunning ? "????????????!" : "????????????!",
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
                                          : Shadow(
                                              offset: Offset(3, 3),
                                              color: Colors.transparent,
                                              blurRadius: 5)
                                    ])),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ));
    }

    Widget timerWidget() {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      final minutes = twoDigits(duration.inMinutes.remainder(60));
      final seconds = twoDigits(duration.inSeconds.remainder(60));

      return SizedBox(
        width: width * 0.94,
        child: Row(
          children: [
            SizedBox(
              width: width * 0.55,
              child: Text(
                "???????????????????? ?????? ???????? ?????????????? ?? ????????????",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromARGB(255, 82, 82, 82), fontSize: 17),
              ),
            ),
            Row(
              children: [
                buildTimeCard(minutes.toString(), "????????????"),
                const SizedBox(
                  width: 7,
                ),
                buildTimeCard(seconds.toString(), "??????????????")
              ],
            ),
          ],
        ),
      );
    }

    Widget main() {
      return SizedBox(
          width: width * 0.95,
          child: CarouselSlider(
            options: CarouselOptions(
                height: height * 0.55,
                clipBehavior: Clip.antiAlias,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                autoPlay: false),
            items: List.generate(
                _questionsData.length,
                (index) => Container(
                    width: width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 248, 248, 248),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(3, 4),
                              color: Colors.black.withOpacity(0.17),
                              blurRadius: 5),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AudioPlay(
                            audioAsset: _questionsData[index]['audioFile']),
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
                                                    _questionsData[index]
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
                                            _questionsData[index]['options'][i]
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            SizedBox(
              height: 18,
            ),
            timerWidget(),
            SizedBox(
              height: 20,
            ),
            main(),
            TextButton(
              onPressed: () {
                if (isRunning) stopTimer(4-points);
              },
              child: Text(
                "STOP",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )
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
      //             "??????????????????",
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
