import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rehabis/globalVars.dart';

class TestForPrediction extends StatefulWidget {
  const TestForPrediction({Key? key}) : super(key: key);

  @override
  State<TestForPrediction> createState() => _TestForPredictionState();
}

String gender = "none";
TextEditingController age = TextEditingController(text: "");
TextEditingController bp = TextEditingController(text: "");
String isSmoker = 'unknown';
TextEditingController cholesterol = TextEditingController(text: "");
bool isDiabetes = false;
TextEditingController bmi = TextEditingController(text: "");

//buttons//
bool isMPressed = false;
bool isFPressed = false;
bool isSYPressed = false;
bool isSNPressed = false;
bool isSFPressed = false;
bool isSmokerPressed = false;
bool diabetesHas = false;
bool diabetesHasNot = false;

//prediction vars//
String bloodPressure = "";
String fat = "";
String smokingStatus = "";
String cholesterolStatus = "";

class _TestForPredictionState extends State<TestForPrediction> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    var titleStyle = const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Inter",
        color: Color.fromARGB(255, 74, 74, 74));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor.withOpacity(0.5),
        title: const Text("Тест на ССЗ",
            style: TextStyle(color: Colors.white, fontFamily: "Ruberoid")),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.arrow_back_ios_outlined,
                size: 25, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
        child: SizedBox(
          width: width * 0.9,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Введите как можно больше информации для получения точного результата",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Пол", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = 'male';

                            isMPressed = !isMPressed;

                            if (isMPressed == true) {
                              isFPressed = false;
                            }
                          });
                        },
                        child: Container(
                          width: width * 0.43,
                          height: 150,
                          decoration: BoxDecoration(
                              color: isMPressed
                                  ? primaryColor
                                  : Color.fromARGB(255, 217, 217, 217)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/male.png"),
                              const SizedBox(height: 10),
                              Text(
                                "Мужской",
                                style: const TextStyle(
                                    fontFamily: "Intel", fontSize: 14),
                              )
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            gender = 'female';
                            isFPressed = !isFPressed;

                            if (isFPressed == true) {
                              isMPressed = false;
                            }
                          });
                        },
                        child: Container(
                          width: width * 0.43,
                          height: 150,
                          decoration: BoxDecoration(
                              color: isFPressed
                                  ? primaryColor
                                  : Color.fromARGB(255, 217, 217, 217)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/female.png"),
                              const SizedBox(height: 10),
                              Text(
                                "Женский",
                                style: const TextStyle(
                                    fontFamily: "Intel", fontSize: 14),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Возраст", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: age,
                  validator: (value) {
                    try {
                      int.parse(age.text);
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "Возраст должен указываться численно");
                      age = TextEditingController(text: "");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 226, 225, 225),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'Например 37',
                    hintStyle: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: Color.fromARGB(255, 67, 67, 67)),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Артериальное давление", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: bp,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    try {
                      double.parse(bp.text);
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "Давление должен указываться численно");
                      age = TextEditingController(text: "");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 226, 225, 225),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'Например 3.5 ммоль/л',
                    hintStyle: TextStyle(fontFamily: 'Inter', fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Курите ли вы?", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isSmoker = 'yes';
                            isSYPressed = !isSYPressed;

                            if (isSYPressed) {
                              isSNPressed = false;
                              isSFPressed = false;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isSYPressed
                                  ? primaryColor
                                  : Color.fromARGB(255, 174, 156, 175)),
                          width: width * 0.28,
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Да",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "Intel",
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isSmoker = 'no';
                            isSNPressed = !isSNPressed;

                            if (isSNPressed) {
                              isSYPressed = false;
                              isSFPressed = false;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isSNPressed
                                  ? primaryColor
                                  : Color.fromARGB(255, 174, 156, 175)),
                          width: width * 0.28,
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Нет",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "Intel",
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isSmoker = 'former';
                            isSFPressed = !isSFPressed;

                            if (isSFPressed) {
                              isSYPressed = false;
                              isSNPressed = false;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isSFPressed
                                  ? primaryColor
                                  : Color.fromARGB(255, 174, 156, 175)),
                          width: width * 0.28,
                          height: 80,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Курил(a) раньше",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "Intel",
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Уровень холестерола", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: cholesterol,
                  validator: (value) {
                    try {
                      double.parse(bp.text);
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "Холестерол должен указываться численно");
                      age = TextEditingController(text: "");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 226, 225, 225),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'Например 120 мм p.c.',
                    hintStyle: TextStyle(fontFamily: 'Arial', fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("Диагностированный диабет", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isDiabetes = true;

                            diabetesHas = !diabetesHas;
                            if (diabetesHas) {
                              diabetesHasNot = false;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: diabetesHas
                                  ? primaryColor
                                  : Color.fromARGB(255, 185, 185, 148)),
                          width: width * 0.42,
                          height: 70,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Да",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: "Intel",
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        )),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            isDiabetes = false;

                            diabetesHasNot = !diabetesHasNot;
                            if (diabetesHasNot) {
                              diabetesHas = false;
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: diabetesHasNot
                                  ? primaryColor
                                  : Color.fromARGB(255, 185, 185, 148)),
                          width: width * 0.42,
                          height: 70,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Нет",
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontFamily: "Intel",
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Text("ИМТ", style: titleStyle),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: bmi,
                  validator: (value) {
                    try {
                      double.parse(bp.text);
                    } catch (e) {
                      Fluttertoast.showToast(
                          msg: "ИМТ должен указываться численно");
                      age = TextEditingController(text: "");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(255, 226, 225, 225),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    hintText: 'Например 25.3',
                    hintStyle: TextStyle(fontFamily: 'Arial', fontSize: 14),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      )),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          predict(context);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 191, 43, 255),
          ),
          width: width,
          height: 50,
          alignment: Alignment.center,
          child: const Text(
            "УЗНАТЬ ПРОГНОЗ",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15,
                fontFamily: 'Inter'),
          ),
        ),
      ),
    );
  }

  Widget smokerWidget(String title, String info, double width) {
    return GestureDetector(
        onTap: () {
          setState(() {
            if (info == "no") {
              isSmoker = 'no';
              isSNPressed = !isSNPressed;

              isSmokerPressed = isSNPressed;

              if (isSmokerPressed) {
                isSYPressed = false;
                isSFPressed = false;
              }
            } else if (info == "yes") {
              isSmoker = 'yes';
              isSYPressed = !isSYPressed;

              isSmokerPressed = isSYPressed;

              if (isSYPressed) {
                isSNPressed = false;
                isSFPressed = false;
              }
            } else if (info == "former") {
              isSmoker = 'former';
              isSFPressed = !isSFPressed;

              isSmokerPressed = isSFPressed;

              if (isSFPressed) {
                isSNPressed = false;
                isSYPressed = false;
              }
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: isSmokerPressed
                  ? primaryColor
                  : Color.fromARGB(255, 186, 128, 190)),
          width: width * 0.28,
          height: 80,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: "Intel",
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }

  Widget diabetesWidget(String title, bool info, double width) {
    return GestureDetector(
        onTap: () {
          setState(() {
            isDiabetes = info;
          });
        },
        child: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 228, 226, 97)),
          width: width * 0.42,
          height: 70,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: "Intel",
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ));
  }
}

Future predict(BuildContext context) async {
  if (gender == "none") {
    Fluttertoast.showToast(msg: "Пол пользователя не был указан!");
  } else if (age.text.isEmpty) {
    Fluttertoast.showToast(msg: "Возраст пользователя не был указан!");
  } else if (bp.text.isEmpty) {
    Fluttertoast.showToast(
        msg: "Артериальное давление пользователя не было указано!");
  } else if (isSmoker == "unknown") {
    Fluttertoast.showToast(msg: "Статус курения пользователя не был указан!");
  } else if (cholesterol.text.isEmpty) {
    Fluttertoast.showToast(
        msg: "Уровень холестерина пользователя не был указан!");
  } else if (bmi.text.isEmpty) {
    Fluttertoast.showToast(msg: "ИМТ пользователя не был указан!");
  } else {
    if (double.parse(bp.text) < 130 && double.parse(bp.text) > 110) {
      bloodPressure = "Уровень артериального давления номрмальный.";
    } else if (double.parse(bp.text) < 110) {
      bloodPressure =
          "Уровень артериального давления низкий, это признак гипотонии. Гипотония сопровождается слабостью, головокружением, учащенным сердцебиением, одышкой, потерей сознания и другими симптомами.";
    } else if (double.parse(bp.text) < 145 &&
        double.parse(bp.text) > 110 &&
        gender == "female" &&
        int.parse(age.text) > 50) {
      bloodPressure = "Уровень артериального давления номрмальный.";
    } else if (double.parse(bp.text) > 130) {
      bloodPressure =
          "Уровень артериального давления высокий, это признак гипотонии. От гипертонии неизбежно страдает головной мозг. Ухудшение памяти, внимания, рассеянность - в том числе последствия запущенной гипертонии. Страдает и сердце, нарушается его ритм, появляется одышка. Но есть риск и куда более серьёзных последствий: инсульт или инфаркт";
    }

    if (isSmoker == "yes") {
      smokingStatus =
          "При продолжительном и частом курение появляется риск недостаточности сердечной деятельности.Никотин вызывает повышение артериального давления и частоты сердцебиений, а окись углерода — недостаточность сердечной деятельности. Спазм сосудов сердца — наиболее частое осложнение при курении. Результатом такого спазма может быть инфаркт миокарда — омертвение участка сердечной мышцы вследствие нарушения её питания";
    } else if (isSmoker == "former") {
      smokingStatus =
          "Бросить курить было полезным решением. При продолжительном и частом курение появляется риск недостаточности сердечной деятельности";
    }

    if (double.parse(cholesterol.text) < 5.1 &&
        double.parse(cholesterol.text) > 3.2) {
      cholesterolStatus = "Уровень холестерола в норме.";
    } else if (double.parse(cholesterol.text) > 5.1) {
      cholesterolStatus =
          "Уровень холестерола высокий. Есть риск образования атеросклеротических бляшек на стенках сосудов";
    } else if (double.parse(cholesterol.text) < 3.2) {
      cholesterolStatus =
          "Уровень холестерола низкий. Есть риск образования гипохолестеринемия";
    }

    if (gender == "male") {
    } else if (gender == "female") {}

    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(4, 4),
                        color: Colors.black.withOpacity(0.3))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text("Медицинские выводы:",
                        style: TextStyle(
                            fontFamily: 'Ruberoid',
                            fontSize: 20,
                            color: primaryColor)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Text(
                      '$bloodPressure\n$smokingStatus\n$cholesterolStatus',
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          gender = "none";
                          age = TextEditingController(text: "");
                          bp = TextEditingController(text: "");
                          isSmoker = 'unknown';
                          cholesterol = TextEditingController(text: "");
                          isDiabetes = false;
                          bmi = TextEditingController(text: "");
                          isMPressed = false;
                          isFPressed = false;
                          isSYPressed = false;
                          isSNPressed = false;
                          isSFPressed = false;
                          isSmokerPressed = false;
                          diabetesHas = false;
                          diabetesHasNot = false; 
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
