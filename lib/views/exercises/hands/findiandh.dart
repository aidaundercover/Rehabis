import 'dart:async';
import 'dart:core';
import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';
import 'package:rehabis/views/exercises/exercises_main.dart';

class ExercizeOne extends StatefulWidget {
  const ExercizeOne({Key? key}) : super(key: key);

  @override
  State<ExercizeOne> createState() => _ExercizeOneState();
}

class _ExercizeOneState extends State<ExercizeOne> {
  int points = 0;
  int pressed = 0;

  List<int> selectedItems = [];

  List<String> letters = const <String>[
    "h",
    "h",
    "i",
    "j",
    "f",
    "l",
    "f",
    "k",
    "f",
    "j",
    "i",
    "f",
    "f",
    "l",
    "l",
    "f",
    "i",
    "j",
    "k",
    "h",
    "j",
    "f",
    "i",
    "h",
    "t",
    "i",
    "l",
    "i",
    "f",
    "h",
    "k",
    "g",
    "h",
    "l",
    "i",
    "h",
    "l",
    "h",
    "k",
    "j",
    "i",
    "h",
    "i",
    "i",
    "h",
    "g",
    "r",
    "i",
    "g",
  ];

  /// TIMER IMPLEMENTING ///
  Duration duration = Duration();
  Timer? timer;
  bool isRunning = false;

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

  void stopTimer() {
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
                        child: Text("Отличная работа!",
                            style: TextStyle(
                                color: deepPurple,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Ruberoid"))),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0),
                      child: Row(
                        children: [
                          Text("Время выполнения:",
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
                          Text("Количество ошибок:",
                              style: TextStyle(
                                color: deepPurple,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Text("$pressed",
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
                            width: 120,
                            height: 35,
                            child: Text("Начать сначала",
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
                        SizedBox(width: 7),
                        TextButton(
                          child: Container(
                            width: 100,
                            height: 35,
                            child: const Text("Завершить",
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
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                        "Назад",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Text("Одинаковые символы",
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
                              Text("2 минуты",
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
                              const Text("1 уровень",
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
                            child: Text(isRunning ? "Вперед!" : "Начать!",
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

    Widget mainWidget() {
      return GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7, mainAxisSpacing: 8),
          itemCount: letters.length,
          itemBuilder: (BuildContext context, int index) {
            bool isPressed = false;
            return Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5),
              child: SizedBox(
                height: 20,
                width: 20,
                child: ElevatedButton(
                  onPressed: () {
                    isPressed = true;
                    setState(() {
                      // pressed++;

                      if (isRunning) {
                        if (selectedItems.contains(index)) {
                        } else {
                          selectedItems.add(index);
                        }
                        if (letters[index] == "i" || letters[index] == "h") {
                          points++;
                        } else
                          pressed++;

                        if (points == 21) {
                          stopTimer();
                        }
                      }
                    });
                  },
                  style: ButtonStyle(
                      backgroundColor: selectedItems.contains(index)
                          ? MaterialStateProperty.all(primaryColor)
                          : MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(color: primaryColor))),
                      shadowColor: MaterialStateProperty.all(
                          Colors.black.withOpacity(0.15))),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      letters[index],
                      style: selectedItems.contains(index)
                          ? TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)
                          : TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: primaryColor),
                    ),
                  ),
                ),
              ),
            );
          });
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
                "Выделите все символы i и h как можно быстрее",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color.fromARGB(255, 82, 82, 82), fontSize: 17),
              ),
            ),
            Row(
              children: [
                buildTimeCard(minutes.toString(), "Минуты"),
                const SizedBox(
                  width: 7,
                ),
                buildTimeCard(seconds.toString(), "Секунды")
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBar(),
            SizedBox(
              height: 20,
            ),
            timerWidget(),
            SizedBox(
              height: 10,
            ),
            mainWidget()
          ],
        ),
      ),
    );
  }
}
