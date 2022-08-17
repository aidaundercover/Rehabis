import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/logic/whats_more_expensive.dart';
import 'package:rehabis/views/exercises/motorics/findiandh.dart';

class ExerciseMain extends StatelessWidget {
  const ExerciseMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black.withOpacity(0.9));
    TextStyle styleSmall = const TextStyle(fontSize: 14, color: Colors.white);


   List one = [
      {
        'title' : "Запомни цифры",
        "minutes" : 4,
        "page" : ExercizeOne(),
        "skill" : "Память"
      },
      {
        'title' : "Танцы пальцев",
        "skill" : "Моторика",
        "minutes" : 7,
        "page" : ExercizeOne(),
      },
      {
        'title' : "Похожие звуки",
        "skill" : "Речь/Слух",
        "minutes" : 3,
        "page" :  ExercizeOne(),
      },
      {
        "title" : "Шерлок Холмс: Кто украл морковку?",
        'skill' : "Логика",
        "page" : ExercizeOne(),
        "minutes" : 10
      },
    ];

    List two = [
      {
        'title' : "Запомни цифры",
        "minutes" : 4,
        "page" : ExercizeOne(),
        "skill" : "Память"
      },
      {
        'title' : "Танцы пальцев",
        "skill" : "Моторика",
        "minutes" : 7,
        "page" : ExercizeOne(),
      },
      {
        'title' : "Похожие звуки",
        "skill" : "Речь/Слух",
        "minutes" : 3,
        "page" :  ExercizeOne(),
      },
      {
        "title" : "Шерлок Холмс: Кто украл морковку?",
        'skill' : "Логика",
        "page" : ExercizeOne(),
        "minutes" : 10
      },
    ];

   List three = [
      {
        'title' : "Что дороже?",
        "minutes" : 4,
        "page" : ExercizeFour(),
        "skill" : "Логика"
      },
      {
        'title' : "Танцы пальцев",
        "skill" : "Моторика",
        "minutes" : 7,
        "page" : ExercizeOne(),
      },
      {
        'title' : "Похожие звуки",
        "skill" : "Речь/Слух",
        "minutes" : 3,
        "page" :  ExercizeOne(),
      },
      {
        "title" : "Шерлок Холмс: Кто украл морковку?",
        'skill' : "Логика",
        "page" : ExercizeOne(),
        "minutes" : 10
      },
    ];

    var width = MediaQuery.of(context).size.width;


    Widget workouts(String title, List exercises, int level) {

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              title,
              style: titleStyle,
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(exercises.length, (index) {
                return InkWell(
                    onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => exercises[index]["page"] ));
                      },
                    child: Column(
                      children: [
                        SizedBox(height: 17),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width * 0.7,
                            height: 110,
                            decoration: BoxDecoration(
                              color: secondaryColor,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 4,
                                    color: Colors.black.withOpacity(0.25),
                                    offset: Offset(2, 2))
                              ],
                              
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 12.0, left: 20),
                              child: Text(
                                exercises[index]['title'],
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                width: width*0.4,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      exercises[index]["skill"],
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
                                      "${exercises[index]['minutes']} минут",
                                      style: styleSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:20.0),
                                  child: Text(
                                    "Уровень $level",
                                    style: styleSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right:20.0),
                                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                                )
                              ],
                            ),
                            SizedBox(height: 10,)
                          ],
                            ),
                          ),
                        ),
                      ],
                    ));
              }),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 60,
        title: Text("Все упражнения",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined,
              size: 25,
              color: Colors.grey.shade600,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, size: 25, color: Colors.grey.shade600),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            workouts("1 уровень", one, 1),
            workouts("2 уровень", two, 2),
            workouts("3 уровень", three, 3)
          ],
        ),
      ),
    );
  }
}
