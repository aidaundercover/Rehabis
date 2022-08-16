import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HandsOneExrcise extends StatefulWidget {
  const HandsOneExrcise({Key? key}) : super(key: key);

  @override
  State<HandsOneExrcise> createState() => _HandsOneExrciseState();
}

class _HandsOneExrciseState extends State<HandsOneExrcise> with SingleTickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.0, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      body: Center(
        child: SizedBox(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Press cubes with both hands",
            style: TextStyle(fontFamily: "Inter", fontSize: 25),
          ),
          SizedBox(
            height: 15,
          ),
          // StreamBuilder(
          //     stream: FirebaseDatabase.instance.ref("LR/").onValue,
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         final myData = snapshot.data;

          //         return 
                  Stack(
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
                      SizedBox(
                        width: width*0.9,
                        height: height*0.4,
                        child: SlideTransition(
                          position: _offsetAnimation,
                          child: Column(
                            children: [
                              Container(
                                                    width: width * 0.45,
                                                    height: height * 0.4,
                                                    decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(244, 173, 255, 1.0),
                                  Color.fromRGBO(200, 186, 255, 1.0)
                                ])),
                                                  ),
                            ],
                          ),
                        ),
                      )
                    ],)
              //     );
              //   } else
              //     return CircularProgressIndicator();
              // })
        ])),
      ),
    );
  }
}
