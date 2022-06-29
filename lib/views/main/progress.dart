import 'dart:ui';

import "package:flutter/material.dart";
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises_chart.dart';

class ProgressMain extends StatefulWidget {
  const ProgressMain({Key? key}) : super(key: key);

  @override
  State<ProgressMain> createState() => _ProgressMainState();
}

class _ProgressMainState extends State<ProgressMain> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    Widget buildSkill(String title, double value, Color color) {
      return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.1),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 22,
                      fontFamily: 'Inter'),
                ),
              ),
            ),
            const SizedBox(
              height: 13,
            ),
            SizedBox(
              width: width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(7)),
                child: LinearProgressIndicator(
                  backgroundColor: Color.fromARGB(255, 192, 192, 192),
                  color: color,
                  value: value,
                  minHeight: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      );
    }

    Widget dayDisplay(int days, Color color, String title, Color textColor) {
      return Column(
        children: [
          Container(
            width: width * 0.29,
            height: 68,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              "$days",
              style: TextStyle(
                  fontSize: 30, color: textColor, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12, color: color),
          )
        ],
      );
    }

    Widget daysActive() {
      return Container(
        width: width * 0.86,
        height: 200,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(3, 2),
              blurRadius: 5),
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(-3, -2),
              blurRadius: 5)
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(right: width * 0.25),
              child: Text(
                "Дни Активности",
                style: TextStyle(
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                dayDisplay(4, Color.fromARGB(255, 200, 200, 200),
                    "Дней на прошлой неделе", Colors.grey.shade800),
                dayDisplay(6, Color.fromRGBO(113, 122, 211, 1.0),
                    "Дней на этой неделе", Colors.white),
              ],
            ),
          ],
        ),
      );
    }

    Widget seeGraph() {
      return Container(
        width: width*0.86,
        height: 100,
        decoration: BoxDecoration(
          color: deepPink.withOpacity(0.9),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(3, 3),
              blurRadius: 5
            )
          ]
        ),
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ExercisesChart()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width*0.4,
                  child: Text("Динамика выполненных упражнений", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize:18),)),
                Row(
                  children: [
                    Image.asset('assets/chart_ani.gif'),
                    SizedBox(width:1),
                    Icon(Icons.arrow_forward_ios, color: Colors.white)
                  ],
                ),
              ],
            )),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'Общий прогресс',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.grey.shade800),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CircularPercentIndicator(
                radius: 150,
                lineWidth: 25,
                percent: 0.2,
                progressColor: Colors.deepPurple,
                backgroundColor: Colors.deepPurple.shade100,
                circularStrokeCap: CircularStrokeCap.round,
                center: Text("20%",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ruberoid',
                        fontSize: 40))),
            const SizedBox(
              height: 35,
            ),
            buildSkill("Речь", 0.1, primaryColor),
            buildSkill("Память", 0.1, secondaryColor),
            buildSkill("Решение задач", 0.1, deepPurple),
            buildSkill("Моторика", 0.1, Colors.purpleAccent),
            SizedBox(
              height: 10,
            ),
            daysActive(),
            SizedBox(
              height: 30,
            ),
            seeGraph(),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
