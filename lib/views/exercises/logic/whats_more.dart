import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';

class WhatsMore extends StatefulWidget {
  const WhatsMore({Key? key}) : super(key: key);

  @override
  State<WhatsMore> createState() => _WhatsMoreState();
}

class _WhatsMoreState extends State<WhatsMore> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List q1 = [
      "assets/orange.png", 
      "assets/melon.png", 
      ];

    List q2 = [
      "assets/purple_box.png",
      "assets/red_box.png",
      "assets/green_box.png"
    ];

    Widget buildCard(String title, String img, List list) {
      return Container(
          width: width * 0.88,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
              boxShadow: [BoxShadow()]),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(fontFamily: "Inter"),
              ),
              Image.asset(img, width: width * 0.82),
              SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                          list.length,
                          (i) => GestureDetector(
                            onTap: () {
                              setState(() {
                                
                              });
                            },
                            child: Container(
                                  decoration: BoxDecoration(),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    list[i],
                                    height: 80,
                                  ),
                                ),
                          ))))
            ],
          ));
    }

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text(
            "What's more ...?",
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
            children: [
              buildCard(
                "What's more expensive?", 
                "assets/what_expensive.png",
                q1
                ),
                buildCard(
                  "What's more heavy?", "assets/what_heavy.png", q2
                )],
          ),
        ));
  }
}
