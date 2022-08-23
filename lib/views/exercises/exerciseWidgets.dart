import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/attention/find_third_whhel.dart';
import 'package:rehabis/views/exercises/attention/similiar_words.dart';
import 'package:rehabis/views/exercises/cube/hands.dart';
import 'package:rehabis/views/exercises/exercises_main.dart';
import 'package:rehabis/views/exercises/logic/3d_thinking.dart';
import 'package:rehabis/views/exercises/logic/ladybag.dart';
import 'package:rehabis/views/exercises/logic/patterns.dart';
import 'package:rehabis/views/exercises/logic/sentence_based.dart';
import 'package:rehabis/views/exercises/logic/sorting.dart';
import 'package:rehabis/views/exercises/logic/whats_more.dart';
import 'package:rehabis/views/exercises/memory/matcing_game.dart';
import 'package:rehabis/views/exercises/motorics/findiandh.dart';
import 'package:rehabis/views/exercises/speech/breathe.dart';
import 'package:rehabis/views/exercises/speech/smile.dart';
import 'package:rehabis/views/exercises/speech/tongue_one.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

//Data for ALL exercises

//Memory

List oneMemory = [
  // {
  //   'title': "Memorise",
  //   "minutes": 4,
  //   "page": ExercizeOne(),
  //   "skill": "Memory"
  // },
];

List twoMemory = [];

List threeMemory = [
  {
    'title': "Matching Game",
    "minutes": 5,
    "page": MatchingGame(),
    "skill": "Memory"
  },
];

//Speaking

List oneSpeaking = [
  {'title': "Smiley", "minutes": 4, "page": Smiley(), "skill": "Speaking"},
];

List twoSpeaking = [
  {
    'title': "Tongue Actions",
    "minutes": 6,
    "page": TongueActions(),
    "skill": "Speaking"
  },
];

List threeSpeaking = [
  {
    'title': "Breathing",
    "minutes": 4,
    "page": Breathing(),
    "skill": "Speaking"
  },
];

//Arm mobility

List oneArm = [
  {
    'title': "Wrists",
    "minutes": 4,
    "page": HandsOneExrcise(),
    "skill": "Arm mobility"
  },
];

List twoArm = [
  {
    'title': "Hands",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Arm mobility"
  },
];

List threeArm = [
  {
    'title': "Palms",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Arm mobility"
  },
];

//Problem solving

List oneProblem = [
  {
    'title': "What's More?",
    "minutes": 3,
    "page": WhatsMore(),
    "skill": "Problem Solving",
    "instruction": "",
    "img": "",
  },
  {
    'title': "Find Ladybag",
    "skill": "Problem Solving",
    "minutes": 2,
    "page": LadyBag(),
  },
];

List twoProblem = [
  {
    'title': "3D Thinking",
    "minutes": 2,
    "page": SpaceThinking(),
    "skill": "Problem Solving"
  },
  {
    'title': "Sorting and Ordering",
    "skill": "Problem Solving",
    "minutes": 4,
    "page": SortingExercise(),
  },
];

List threeProblem = [
  {
    'title': "Word-based puzzle",
    "minutes": 4,
    "page": SentencedQuiz(),
    "skill": "Problem Solving"
  },
];

//Leg mobility

List oneLeg = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Leg mobility"
  },
];

List twoLeg = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Leg mobility"
  },
];

List threeLeg = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Leg mobility"
  },
];

//Core

List oneCore = [];

List twoCore = [];

List threeCore = [];

//Attention

List oneAttention = [
  {
    'title': "Finger Dancing",
    "skill": "Attention",
    "minutes": 2,
    "page": ExerciseThree(),
  },
];

List twoAttention = [];

List threeAttention = [
  {
    'title': "Similiar sounds",
    "minutes": 4,
    "page": ExerciseTwo(),
    "skill": "Attention"
  },
];

Widget exerciseWidgetMain(
    String title,
    int level,
    String skill,
    int minutes,
    Widget page,
    String instruction,
    String img,
    double width,
    double height,
    BuildContext context) {
  TextStyle styleSmall = const TextStyle(fontSize: 12, color: Colors.white);

  return Container(
    child: Stack(alignment: AlignmentDirectional.topEnd, children: [
      GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => page));
          showDialog(
              context: context,
              builder: (_) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 4, color: Colors.purple)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Инструкция по выполнению!",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Ruberoid",
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                              fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            instruction,
                            style: const TextStyle(
                                fontFamily: "Inter", fontSize: 20),
                          ),
                        ),
                        Image.asset(
                          img,
                          height: height * 0.15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 70,
                                height: 35,
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade300),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                            // TextButton(onPressed: () {}, child: Text("Не показывать больше")),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 85,
          width: width * 0.44,
          child: Container(
              height: 80,
              alignment: Alignment.center,
              width: width * 0.42,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(2, 3),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(-2, -3),
                        blurRadius: 10)
                  ]),
              child: Container(
                width: width * 0.36,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontFamily: "Inter"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          skill,
                          style: styleSmall,
                        ),
                        Text(
                          "$minutes min",
                          style: styleSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
      Positioned(
        // bottom: 10,
        // left: 10,
        child: Container(
          width: width * 0.1,
          height: 20,
          decoration: BoxDecoration(
            color: level == 1
                ? Color.fromRGBO(34, 210, 39, 1.0)
                : level == 2
                    ? Color.fromRGBO(219, 210, 0, 1.0)
                    : Color.fromRGBO(244, 144, 38, 1.0),
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            level == 1
                ? "Easy"
                : level == 2
                    ? "Middle"
                    : "Hard",
            style: TextStyle(color: Colors.white, fontSize: 10.5),
          ),
        ),
      ),
    ]),
  );
}

Widget exerciseWidget(
    String title,
    String skill,
    int minutes,
    Widget page,
    String instruction,
    String img,
    double width,
    double height,
    BuildContext context) {
  TextStyle styleSmall = const TextStyle(fontSize: 12, color: Colors.white);

  void nothing() {}

  return GestureDetector(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
      instruction.isEmpty
          ? nothing()
          : showDialog(
              context: context,
              builder: (_) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 4, color: Colors.purple)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Инструкция по выполнению!",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: "Ruberoid",
                              fontWeight: FontWeight.bold,
                              color: secondaryColor,
                              fontSize: 18),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            instruction,
                            style: const TextStyle(
                                fontFamily: "Inter", fontSize: 20),
                          ),
                        ),
                        Image.asset(
                          img,
                          height: height * 0.15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 70,
                                height: 35,
                                decoration:
                                    BoxDecoration(color: Colors.grey.shade300),
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      "OK",
                                      style: TextStyle(color: Colors.black),
                                    )),
                              ),
                            ),
                            // TextButton(onPressed: () {}, child: Text("Не показывать больше")),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 11.0,
      ),
      child: Container(
          height: 60,
          alignment: Alignment.center,
          width: width * 0.42,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(2, 3),
                    blurRadius: 5),
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: const Offset(-2, -3),
                    blurRadius: 10)
              ]),
          child: Container(
            width: width * 0.36,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, color: Colors.white, fontFamily: "Inter"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      skill,
                      style: styleSmall,
                    ),
                    Text(
                      "$minutes min",
                      style: styleSmall,
                    ),
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}

Widget buildTimeCard(String time, String header) {
  return Column(
    children: [
      Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
            color: deepPurple, borderRadius: BorderRadius.circular(10)),
        alignment: Alignment.center,
        child: Text(
          time,
          style: TextStyle(fontSize: 40, color: Colors.white),
        ),
      ),
      const SizedBox(
        height: 2,
      ),
      Text(
        header,
        style: TextStyle(
          fontSize: 11,
        ),
      ),
    ],
  );
}

Widget headerExercise(double width, String text, int score) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: width * 0.6,
        child: Text(
          text,
          style: TextStyle(color: Colors.grey.shade400, fontFamily: "Inter"),
        ),
      ),
      Column(
        children: [
          Text(
            "SCORE",
            style: TextStyle(
              color: secondaryColor,
              fontSize: 27,
            ),
          ),
          Text(
            '$score',
            style: TextStyle(
              color: secondaryColor,
              fontSize: 29,
            ),
          ),
        ],
      )
    ],
  );
}

Widget textHeader(double width, String text) {
  return SizedBox(
    width: width * 0.9,
    child: Text(
      text,
      style: TextStyle(color: Colors.grey.shade400, fontFamily: "Inter"),
    ),
  );
}

PreferredSizeWidget exerciseAppbar(String title, BuildContext context) {
  return AppBar(
    title: Text(
      title,
      style: TextStyle(
          color: Colors.grey, fontFamily: "Inter", fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.0,
    leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.grey,
        )),
  );
}
