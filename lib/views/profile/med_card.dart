import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';

class MedicalCard extends StatefulWidget {
  const MedicalCard({Key? key}) : super(key: key);

  @override
  State<MedicalCard> createState() => _MedicalCardState();
}

class _MedicalCardState extends State<MedicalCard> {
  bool isPressedChange = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void change() {
    setState(() {
      isPressedChange = true;
    });
  }

  final ref = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 251, 255),
      body: StreamBuilder(
          stream: ref.child('Users/$iinGlobal/MedicalData/').onValue,
          builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
            if (snapshot.hasData) {
              final myData = Map<String, dynamic>.from(
                  snapshot.data!.snapshot.value as Map<dynamic, dynamic>);

              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.2),
                    child: Row(
                      children: [
                        SizedBox(
                          width: width * 0.06,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios,
                              size: 30,
                              color: Colors.grey.shade300,
                            )),
                        Text("Медцицинские данные\nпациента",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.7),
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            height: height * 0.7,
                            width: width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      offset: Offset(3, 6),
                                      blurRadius: 14),
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.05),
                                      offset: Offset(-3, -6),
                                      blurRadius: 14)
                                ]),
                            child: Padding(
                              padding: EdgeInsets.only(left: width * 0.07),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Имя: ",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              nameGlobal,
                                              style: TextStyle(
                                                  color: deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              myData["Gender"] == "Ж"
                                                  ? "assets/female.png"
                                                  : "assets/men.png",
                                              width: 28,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Рост: ",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${myData["Height"]}" + "метров",
                                              style: TextStyle(
                                                  color: deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Вес: ",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${myData["Weight"]}" + "кг.",
                                              style: TextStyle(
                                                  color: deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Вид инсульта: ",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 18),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "${myData["StrokeType"]}",
                                              style: TextStyle(
                                                  color: deepPurple,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ]),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Dialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Container(
                                              height: height * 0.2,
                                              width: width * 0.8,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                      "Вы уверены что хотите удалить?"),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400)),
                                                            child: Text("Отмена",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                          )),
                                                        TextButton(
                                                          onPressed: () {
                                                            
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                border: Border.all(
                                                                    width: 1,
                                                                    color: Colors
                                                                        .grey
                                                                        .shade400)),
                                                            child: Text("Да",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey)),
                                                          ))
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    width: width * 0.35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                        border: Border.all(
                                            width: 1,
                                            color: Colors.grey.shade400),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.07),
                                              offset: Offset(
                                                3,
                                                3,
                                              ),
                                              blurRadius: 10)
                                        ]),
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Удалить",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Icon(
                                          Icons.delete_forever,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  )),
                              TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    width: width * 0.35,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: deepPurple,
                                        borderRadius: BorderRadius.circular(30),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.07),
                                              offset: Offset(
                                                3,
                                                3,
                                              ),
                                              blurRadius: 10)
                                        ]),
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Изменить",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Icon(
                                          Icons.edit,
                                          color: Colors.white,
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator(
              color: primaryColor,
            );
            // return Column(
            //   children: [
            //     Image.asset("assets/oops.png", width: width*0.8,)
            //   ],
            // );
          }),
    );
  }
}
