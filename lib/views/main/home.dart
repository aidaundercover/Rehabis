import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/widgets/audio_player.dart';
import 'package:rehabis/views/exercises/exercises_main.dart';
import 'package:rehabis/views/exercises/find_third_whhel.dart';
import 'package:rehabis/views/exercises/memory/similiar_words.dart';
import 'package:rehabis/views/exercises/motorics/findiandh.dart';
import 'package:rehabis/views/prediction/test_for_prediction.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    double percentage = value * 100;

    Widget appBar() {
      return Container(
          width: width,
          decoration: BoxDecoration(color: primaryColor, boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(0, 3),
                blurRadius: 5)
          ]),
          child: Container(
            width: width * 0.88,
            height: height * 0.5,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 7,
                  ),
                  const Text("Rehabis",
                      style: TextStyle(
                          fontFamily: "Ruberoid",
                          fontSize: 60,
                          color: Colors.white)),
                  Text("С возвращением,\n$nameGlobal!",
                      style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 29,
                          color: Colors.white)),
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ваш прогресс:",
                              style: TextStyle(
                                  fontFamily: "Roboto",
                                  fontSize: 15,
                                  color: Colors.white)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * 0.7,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(7)),
                                  child: LinearProgressIndicator(
                                    backgroundColor: Colors.purple,
                                    color: yellowSecondary,
                                    value: value,
                                    minHeight: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.05,
                              ),
                              Text("$percentage%",
                                  style: const TextStyle(
                                      fontFamily: "Roboto",
                                      fontSize: 16,
                                      color: Colors.white))
                            ],
                          )
                        ]),
                  )
                ],
              ),
            ),
          ));
    }

    Widget exerciseWidget(
        String title, int level, String skill, int minutes, Widget page, String instruction, String img) {
      TextStyle styleSmall = const TextStyle(fontSize: 14, color: Colors.white);

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
                          style: const TextStyle(fontFamily: "Inter", fontSize: 20),
                        ),
                      ),
                      Image.asset(
                        img, height: height*0.15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 70,
                              height: 35,
                              decoration: BoxDecoration(color: Colors.grey.shade300),
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
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  color: secondaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(2, 3),
                        blurRadius: 5)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text(
                                title,
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  skill,
                                  style: styleSmall,
                                ),
                                const Text(
                                  "·",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Уровень $level",
                                  style: styleSmall,
                                ),
                                const Text(
                                  "·",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "$minutes минут",
                                  style: styleSmall,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )));
    }

    
    Widget exercises() {
      return SizedBox(
        width: width * 0.91,
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Мои упражнения",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Inter'),
                ),
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ExerciseMain()));
                    },
                    child: Row(
                      children: [
                        Text(
                          "Все упражнения",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: primaryColor),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: primaryColor,
                          size: 20,
                        )
                      ],
                    )),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            exerciseWidget(
                "Одинаковые символы", 1, "Моторика", 2,  ExercizeOne(), "Нажмите на каждый символ в порядке слева направо, сверху вниз", 'assets/arrow_sky.png'),
            const SizedBox(
              height: 10,
            ),
            exerciseWidget(
                "Похожие звуки", 3, "Речь", 1,  ExerciseTwo(), "Прослушайте текст и выберете изображение которое отобржает сказанное", "assets/sound.png"),
            const SizedBox(
              height: 10,
            ),
            exerciseWidget(
                "Найди лишние", 3, "Логика", 3,  ExerciseThree(), "Найдите лишнее среди 4-х изображений", "assets/redundant.png"),
          ],
        ),
      );
    }

    Widget recommendations() {
      return SizedBox(
        width: width * 0.92,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Справка и рекомендации",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Inter'),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: height * 0.36,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.26,
                    width: width * 0.445,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.13),
                              offset: const Offset(3, 3),
                              blurRadius: 6)
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                                "Начинайте с самых слабых сторон организма",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    color: secondaryColor)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                                "Мы создали ряд упражнений навправленных именно на это.",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Roboto',
                                    color: secondaryColor)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text("Начать сейчас",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Roboto',
                                        color: secondaryColor)),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: ((context) =>
                                                  const ExerciseMain())));
                                    },
                                    child: Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: secondaryColor,
                                        size: 20))
                              ],
                            ),
                          )
                        ]),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.145,
                        width: width * 0.445,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 253, 239, 108),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.13),
                                  offset: const Offset(3, 3),
                                  blurRadius: 6)
                            ]),
                        alignment: Alignment.center,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                    "Cледите за своим прогрессом, чтобы оставаться мотивированным.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        color:
                                            Color.fromARGB(255, 96, 96, 96))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: ((context) =>
                                                      const ExerciseMain())));
                                        },
                                        child: Icon(
                                            Icons.arrow_forward_ios_outlined,
                                            color:
                                                Color.fromARGB(255, 96, 96, 96),
                                            size: 20))
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        height: height * 0.2,
                        width: width * 0.445,
                        decoration: BoxDecoration(
                            color: deepPink,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.13),
                                  offset: const Offset(3, 3),
                                  blurRadius: 6)
                            ]),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: Text(
                                    "Не забывайте достигать ежеждневных целей.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: 'Roboto',
                                        color: Colors.white)),
                              ),
                              Container(
                                width: width * 0.38,
                                child: const ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  child: LinearProgressIndicator(
                                    backgroundColor:
                                        Color.fromARGB(255, 209, 182, 211),
                                    color: Colors.white,
                                    value: 0.6,
                                    minHeight: 16,
                                  ),
                                ),
                              ),
                            ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      );
    }

    Widget prediction() {
      return SizedBox(
        width: width * 0.92,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 35,
            ),
            const Text(
              "Узнайте вероятность ССЗ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'Inter'),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const TestForPrediction()));
              },
              child: Container(
                width: width * 0.92,
                height: 95,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 192, 142, 242),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.13),
                        offset: const Offset(3, 3),
                        blurRadius: 6)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  const Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        "Пройди тест и узнай риск сердечно сосудистых заболеваний",
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Ruberoid",
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Image.asset(
                      'assets/predict_ball.png',
                      width: width*0.3,
                    ))
                ]),
              ),
            )
        ]),
      );
    }


    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 244, 244),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            appBar(),
            exercises(),
            recommendations(),
            prediction(),
            const SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
