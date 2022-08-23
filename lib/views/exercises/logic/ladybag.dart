import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class LadyBag extends StatefulWidget {
  const LadyBag({Key? key}) : super(key: key);

  @override
  State<LadyBag> createState() => _LadyBagState();
}

List isSelected = [
  false,
  false,
  false,
];

List images = [
  "assets/r.png",
  "assets/r_t.png",
  "assets/c_r_t.png",
];

class _LadyBagState extends State<LadyBag> {
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
      backgroundColor: Colors.white,
      appBar: exerciseAppbar("Find a Ladybag", context),
      body: Center(
        child: Column(
          children: [
            textHeader(width,
                "The exercise below is designed to improve attention, problem solving and critical thinking"),
            SizedBox(
              height: 17,
            ),
            Text("Where is the ladybag?", style: TextStyle(fontFamily: "Inter",fontSize: 23),),
            Image.asset(
              "assets/find_ladybag.png",
              width: width * 0.8,
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(isSelected.length, (index) => GestureDetector(
                onTap: () {
                  
                  for (int indexBtn = 0;
                              indexBtn < isSelected.length;
                              indexBtn++) {
                            if (indexBtn == index) {
                              isSelected[indexBtn] =
                                  !isSelected[indexBtn];
                              if (isSelected[indexBtn]) {
                                if (indexBtn == 1) {
                                  showDialog(context: context, builder: (context) => Dialog(child: Text("Well done!")));
                                }
                              } 
                            } else {
                              isSelected[indexBtn] = false;
                            }
                          }

                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.01),
                        spreadRadius: 7,
                        blurRadius: 13,
                        offset: Offset(2,3)
                      ),
                      BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 7,
                                blurRadius: 13,
                                offset: Offset(-2, -3)),
                    ],
                    color: isSelected[index] ? secondPrimaryColor :Color.fromARGB(255, 249, 249, 249)
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
                  child: Image.asset(images[index], height: 49,),
                ),
              )),
            )
          ],
        ),
      ),
    );
  }
}
