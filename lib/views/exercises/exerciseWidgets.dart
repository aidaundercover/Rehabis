import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/logic/whats_more.dart';
import 'package:rehabis/views/exercises/motorics/findiandh.dart';


//Data for ALL exercises

//Memory

List oneMemory = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
    "instruction": ""
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoMemory = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeMemory = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

//Speaking

List oneSpeaking = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoSpeaking = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeSpeaking = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];


//Arm mobility

List oneArm = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoArm = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeArm = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];


//Problem solving

List oneProblem = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoProblem = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeProblem = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];


//Leg mobility

List oneLeg = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoLeg = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeLeg = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];


//Core

List oneCore = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoCore = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeCore = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];


//Attention

List oneAttention = [
  {
    'title': "Memorise цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Memory"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Memory",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List twoAttention = [
  {
    'title': "Запомни цифры",
    "minutes": 4,
    "page": ExercizeOne(),
    "skill": "Память"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];

List threeAttention = [
  {
    'title': "Что дороже?",
    "minutes": 4,
    "page": ExercizeFour(),
    "skill": "Логика"
  },
  {
    'title': "Танцы пальцев",
    "skill": "Моторика",
    "minutes": 7,
    "page": ExercizeOne(),
  },
  {
    'title': "Похожие звуки",
    "skill": "Речь/Слух",
    "minutes": 3,
    "page": ExercizeOne(),
  },
  {
    "title": "Шерлок Холмс: Кто украл морковку?",
    'skill': "Логика",
    "page": ExercizeOne(),
    "minutes": 10
  },
];



Widget exerciseWidgetMain(String title, int level, String skill, int minutes,
    Widget page, String instruction, String img, double width, BuildContext context) {
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
    BuildContext context) {
  TextStyle styleSmall = const TextStyle(fontSize: 12, color: Colors.white);

  return GestureDetector(
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
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal:11.0,),
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