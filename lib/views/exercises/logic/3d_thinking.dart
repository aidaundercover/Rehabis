import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';

class SpaceThinking extends StatefulWidget {
  const SpaceThinking({Key? key}) : super(key: key);

  @override
  State<SpaceThinking> createState() => _SpaceThinkingState();
}

late int score;




List _questions = [
  {
    "title": "Lay one picture over the other.",
    "img": "assets/spacethink-1.png",
    "options": ["assets/st-1-1.png", "assets/st-1-2.png", "assets/st-1-3.png"],
    "selected": [false, false, false],
    "right": 1,
    "right-img": "assets/sp-1-exp.png"
  },
  {
    "title": "How many triangles there in the picture?",
    "img": "assets/spacethink-2.png",
    "options": ["6", "5", "4", "7"],
    "right": 0,
    "selected": [false, false, false, false],
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
    "right": 1,
    "selected": [false, false, false, false],
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
    "selected": [false, false, false, false],
    "right-img": ""
  }
];

class _SpaceThinkingState extends State<SpaceThinking> {

  void getPoint() {
    setState(() {
      score++;
    });
  }

  void minusPoints() {
    setState(() {
      score--;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    score = 0;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            "3D Thinking",
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
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: width * 0.6,
                  child: Text(
                    "The exercises below is designed to challange the ability to coordinate abstarct objects in space and predict the results.",
                    style: TextStyle(
                        color: Colors.grey.shade400, fontFamily: "Inter"),
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
            ),
            Center(
              child: SizedBox(
                  height: height * 0.75,
                  width: width * 0.96,
                  child: ListWheelScrollView.useDelegate(
                      perspective: 0.003,
                      diameterRatio: 1.9,
                      physics: FixedExtentScrollPhysics(),
                      itemExtent: height * 0.6,
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
                                          SizedBox(
                                            height: 100,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: List.generate(
                                                _questions[i]["options"].length,
                                                (index) => GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      _questions[i]["selected"]
                                                              [index] =
                                                          !_questions[i]
                                                                  ["selected"]
                                                              [index];

                                                      if (_questions[i]
                                                          ["selected"][index]) {
                                                        if (index ==
                                                            _questions[i]
                                                                ["right"]) {
                                                          getPoint();
                                                        }
                                                      } else {
                                                        if (index ==
                                                            _questions[i]
                                                                ["right"]) {
                                                          minusPoints();
                                                        }
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      decoration: BoxDecoration(
                                                        color: _questions[i]
                                                                    ["selected"]
                                                                [index]
                                                            ? secondPrimaryColor
                                                            : Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color:
                                                                secondPrimaryColor),
                                                      ),
                                                      width: _questions[i][
                                                                      "options"]
                                                                  .length ==
                                                              3
                                                          ? width * 0.27
                                                          : width * 0.2,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 15),
                                                      alignment:
                                                          Alignment.center,
                                                      child: _questions[i]["options"]
                                                                      [0]
                                                                  .length ==
                                                              1
                                                          ? Text(
                                                              _questions[i][
                                                                      "options"]
                                                                  [index],
                                                              style: TextStyle(
                                                                  fontSize: 22,
                                                                  fontFamily:
                                                                      "Inter"),
                                                            )
                                                          : Image.asset(
                                                              _questions[i][
                                                                      "options"]
                                                                  [index])),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                  ))))),
            ),
          ]),
        ));
  }
}
