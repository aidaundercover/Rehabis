import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class WhatsMore extends StatefulWidget {
  const WhatsMore({Key? key}) : super(key: key);

  @override
  State<WhatsMore> createState() => _WhatsMoreState();
}

late int score;
List<List<bool>> isSelected = [];

List q1 = ["assets/orange.png", "assets/melon.png", "assets/watermelon.png"];

List q2 = [
  "assets/purple_box.png",
  "assets/red_box.png",
  "assets/green_box.png"
];

class _WhatsMoreState extends State<WhatsMore> {

   void getPoint() {
    setState(() {
      if (score > 2) {
      } else {
        score++;
      }
    });
  }

  void minusPoints() {
    setState(() {
      if (score <= 0) {
      } else {
        score--;
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = [
      [false, false, false],
      [false, false, false]
    ];
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Widget buildCard(
        String title, String img, List list, int index, int right) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
            width: width * 0.94,
            height: height * 0.6,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.005),
                      offset: Offset(3, 3),
                      spreadRadius: 10,
                      blurRadius: 5),
                  BoxShadow(
                      color: Colors.black.withOpacity(0.001),
                      offset: Offset(-3, -3),
                      spreadRadius: 10,
                      blurRadius: 5)
                ]),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                Image.asset(img, width: width * 0.9),
                SizedBox(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                            list.length,
                            (i) => GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      for (int indexBtn = 0;
                                          indexBtn < isSelected.length;
                                          indexBtn++) {
                                        if (indexBtn == i) {
                                          isSelected[index][indexBtn] =
                                              !isSelected[index][indexBtn];
                                          if (isSelected[index][indexBtn]) {
                                            if (indexBtn == right) {
                                              getPoint();
                                            }
                                          } else {
                                            if (indexBtn == right) {
                                              minusPoints();
                                            }
                                          }
                                        } else {
                                          isSelected[index][indexBtn] = false;
                                        }
                                      }
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: isSelected[index][i] ? secondPrimaryColor : Colors.white,
                                        border: Border.all(
                                            width: 1.5,
                                            color: secondPrimaryColor)),
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 2),
                                    child: Image.asset(
                                      list[i],
                                      height: 70,
                                    ),
                                  ),
                                ))))
              ],
            )),
      );
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            "What's more ..?",
            style: TextStyle(
                color: Colors.grey,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold),
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
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              headerExercise(
                  width,
                  "'What's more' stretches user's ability to make calculataion within limited amount of time.",
                  score, ),
              SizedBox(
                height: 25,
              ),
              buildCard(
                  "What's more expensive?", "assets/what_expensive.png", q1, 0, 1 ),
              buildCard("What's more heavy?", "assets/what_heavy.png", q2, 1, 2),
              SizedBox(
                height: 0,
              ),
            ],
          ),
        ));
  }
}
