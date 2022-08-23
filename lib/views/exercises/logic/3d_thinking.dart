import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class SpaceThinking extends StatefulWidget {
  const SpaceThinking({Key? key}) : super(key: key);

  @override
  State<SpaceThinking> createState() => _SpaceThinkingState();
}

late int score;
List<List<bool>> isSelected = [];

List _questions = [
  {
    "title": "Lay one picture over the other.",
    "img": "assets/spacethink-1.png",
    "options": [
      "assets/st-1-1.png",
      "assets/st-1-2.png",
      "assets/st-1-3.png",
      "assets/st-1-3.png"
    ],
    "right": 1,
    "right-img": "assets/sp-1-exp.png"
  },
  {
    "title": "How many triangles there in the picture?",
    "img": "assets/spacethink-2.png",
    "options": ["6", "5", "4", "7"],
    "right": 0,
    "right-img": "assets/sp-2-exp.png"
  },
  {
    "title": "Select the view of the figure from the given side",
    "img": "assets/spacethink-3.png",
    "options": [
      "assets/st-3-1.png",
      "assets/st-3-2.png",
      "assets/st-3-3.png",
      "assets/st-3-4.png",
    ],
    "right": 0,
    "right-img": ""
  },
  {
    "title": "Select the view of the figure from the given side",
    "img": "assets/spacethink-4.png",
    "options": [
      "assets/st-4-1.png",
      "assets/st-4-2.png",
      "assets/st-4-3.png",
      "assets/st-4-4.png",
    ],
    "right": 0,
    "right-img": ""
  }
];

class _SpaceThinkingState extends State<SpaceThinking> {
  void getPoint() {
    setState(() {
      if (score >= 4) {
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
    score = 0;

    isSelected = [
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false],
      [false, false, false, false]
    ];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: exerciseAppbar("3D Thinking", context),
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            headerExercise(
                width,
                "The exercises below is designed to challange the ability to coordinate abstarct objects in space and predict the results.",
                score),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(
                  height: height * 0.5,
                  width: width * 0.96,
                  child: ListWheelScrollView.useDelegate(
                      perspective: 0.003,
                      diameterRatio: 1.9,
                      physics: FixedExtentScrollPhysics(),
                      itemExtent: height * 0.4,
                      squeeze: 0.99,
                      childDelegate: ListWheelChildLoopingListDelegate(
                          children: List.generate(
                              _questions.length,
                              (i) => Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.02),
                                              offset: Offset(3, 3),
                                              blurRadius: 20,
                                              spreadRadius: 10)
                                        ]),
                                    width: width * 0.9,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: width * 0.8,
                                            child: Text(
                                              _questions[i]["title"],
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontFamily: "Inter",
                                                  fontSize: 21),
                                            ),
                                          ),
                                          Image.asset(
                                            _questions[i]["img"],
                                            width: width * 0.75,
                                          ),
                                        ]),
                                  ))))),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: isSelected.length,
                  itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: SizedBox(
                          height: 90,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              _questions.length,
                              (i) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    print('$index');
                                    for (int indexBtn = 0;
                                        indexBtn < isSelected.length;
                                        indexBtn++) {
                                      if (indexBtn == i) {
                                        isSelected[index][indexBtn] =
                                            !isSelected[index][indexBtn];
                                        if (isSelected[index][indexBtn]) {
                                          if (indexBtn ==
                                              _questions[index]["right"]) {
                                            getPoint();
                                          }
                                        } else {
                                          if (indexBtn ==
                                              _questions[index]["right"]) {
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
                                      color: isSelected[index][i]
                                          ? secondPrimaryColor
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: secondPrimaryColor),
                                    ),
                                    width: _questions[i]["options"].length == 3
                                        ? width * 0.27
                                        : width * 0.2,
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    alignment: Alignment.center,
                                    child: _questions[index]["options"][0]
                                                .length ==
                                            1
                                        ? Text(
                                            _questions[index]["options"][i],
                                            style: TextStyle(
                                                fontSize: 22,
                                                fontFamily: "Inter"),
                                          )
                                        : Image.asset(
                                            _questions[index]["options"][i])),
                              ),
                            ),
                          ),
                        ),
                      )),
                ))
          ]),
        ));
  }
}
