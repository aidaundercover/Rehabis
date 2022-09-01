import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class DiagonaleHands extends StatefulWidget {
  const DiagonaleHands({Key? key}) : super(key: key);

  @override
  State<DiagonaleHands> createState() => _DiagonaleHands();
}

class _DiagonaleHands extends State<DiagonaleHands> {
  int handPosition = 1;
  bool isPressed = false;

  void updateStarCount(Object? data) {
    setState(() {
      handPosition = int.parse(data.toString());

      if (handPosition == 1) {
        isPressed = true;
      }

      if (handPosition == 2) {
        isPressed = false;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('LR/');
    starCountRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      updateStarCount(data);

      print(data);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: exerciseAppbar("Flexing Elbow", context),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: Center(
        child: SizedBox(
            width: width * 0.92,
            child: Column(children: [
              textHeader(width,
                  "Using 'Cubes' equipment user supposed to train the wrist and low-palm area"),
              SizedBox(
                height: height * 0.14,
              ),
              Text(
                "Slide cube on diagonale",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Inter", fontSize: 27),
              ),
              SizedBox(
                height: 30,
              ),

              Stack(children: [
                Container(
                  width: width * 0.9,
                  height: width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 3, color: Colors.grey.shade500),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.35,
                            child: Text(
                              "Press RIGHT cube",
                              style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 15,
                                  fontFamily: "Inter"),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height:width * 0.6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: width * 0.35,
                              
                              child: Text(
                                "Press LEFT cube",
                                style: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: 15,
                                    fontFamily: "Inter"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  curve: Curves.easeInCubic,
                  duration: const Duration(milliseconds: 750),
                  right: isPressed ? width * 0.45 : 0,
                  top: isPressed ? 0 : width * 0.45,
                  child: Container(
                    width: width * 0.45,
                    height:  width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(244, 173, 255, 1.0),
                          Color.fromRGBO(200, 186, 255, 1.0)
                        ])),
                  ),
                )
              ])
              //   } else if (snapshot.hasError) {
              //     return const Text("ERROR");
              //   } else if (!snapshot.hasData) {
              //     return Text("no data");
              //   } else if (snapshot.connectionState ==
              //       ConnectionState.waiting) {
              //     return const CircularProgressIndicator();
              //   } else {
              //     return Text("HZ");
              //   }
              // })
            ])),
      ),
    );
  }
}
