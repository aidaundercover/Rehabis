import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class HandsOneExrcise extends StatefulWidget {
  const HandsOneExrcise({Key? key}) : super(key: key);

  @override
  State<HandsOneExrcise> createState() => _HandsOneExrciseState();
}

class _HandsOneExrciseState extends State<HandsOneExrcise> {
  int handPosition = 1;
  bool isPressed = false;

  void updateStarCount(Object? data) {
    setState(() {
      handPosition = int.parse(data.toString());

      if (handPosition%2 ==1) {
        isPressed = true;
      }

      if (handPosition%2 == 0) {
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
      // appBar: exerciseAppbar("Exercise Wrists", context),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: Center(
        child: SizedBox(
          width: width * 0.92,
            child: Column(
        
                children: [
              textHeader(width,
                  "Using 'Cubes' equipment user supposed to train the wrist and low-palm area"),
              SizedBox(
            height: height * 0.14,
          ),
              Text(
                "Press cubes with both hands in turn",
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: "Inter", fontSize: 27),
              ),
              SizedBox(
                height: 30,
              ),

                      Stack(children: [
                        Container(
                          width: width * 0.9,
                          height: height * 0.4,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  width: 3, color: Colors.grey.shade500),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        ),
                        AnimatedPositioned(
                          curve: Curves.easeInCubic,
                          duration: const Duration(milliseconds: 450),
                          left: isPressed ? width * 0.45 : 0,
                          child: Container(
                            width: width * 0.45,
                            height: height * 0.4,
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
