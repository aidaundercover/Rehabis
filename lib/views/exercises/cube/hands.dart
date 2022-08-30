import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class HandsOneExrcise extends StatefulWidget {
  const HandsOneExrcise({Key? key}) : super(key: key);

  @override
  State<HandsOneExrcise> createState() => _HandsOneExrciseState();
}

class _HandsOneExrciseState extends State<HandsOneExrcise> {
  var ref = FirebaseDatabase.instance.ref().child("Users");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: exerciseAppbar("Exercise Wrists", context),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: Center(
        child: SizedBox(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
              textHeader(width,
                  "Using 'Cubes' equipment user supposed to train the wrist and low-palm area"),
              Text(
                "Press cubes with both hands",
                style: TextStyle(fontFamily: "Inter", fontSize: 25),
              ),
              SizedBox(
                height: 15,
              ),
              StreamBuilder<DatabaseEvent>(
                  stream: ref.onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final myData = snapshot.data!;
                      bool isPressed =
                          int.parse(myData.toString()) % 2 == 0 ? true : false;

                      return Stack(
                        children: [
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
                            duration: Duration(seconds: 1),
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
                        ],
                      );
                    } else if (snapshot.hasError)
                      return Text("ERROR");
                    else
                      return CircularProgressIndicator();
                  })
            ])),
      ),
    );
  }
}
