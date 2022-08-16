import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/first_view/add_data_view.dart';
import 'package:rehabis/widgets/slider_fv.dart';

class SelectWeakness extends StatefulWidget {
  const SelectWeakness({Key? key}) : super(key: key);

  @override
  State<SelectWeakness> createState() => _SelectWeaknessState();
}

List _selected = [
  {"title": "Memory", "selected": false},
  {"title": "Speaking", "selected": false},
  {"title": "Arm mobility", "selected": false},
  {"title": "Problem Solving", "selected": false},
  {"title": "Leg Mobility", "selected": false},
  {"title": "Core", "selected": false},
  {"title": "Attention", "selected": false},
];

class _SelectWeaknessState extends State<SelectWeakness> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      floatingActionButton: GestureDetector(
        onTap: () {
          setState(() {
            for (int i = 0; i < _selected.length; i++) {
              if (_selected[i]["selected"]) {
                selected.add(_selected[i]["title"]);
              }
            }
          });
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddDataView()));
        },
        child: Padding(
          padding: EdgeInsets.only(right: width*0.04),
          child: Container(
            width: width*0.33,
            height: 45,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Next", style: TextStyle(color: Colors.white, fontSize: 20),),
                Icon(Icons.arrow_forward_ios, color: Colors.white)
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: width * 0.86,
          child: SingleChildScrollView(
            child: Column(
                children: [
                  slider(1, width),
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      "Select your weak points.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: "Ruberoid",
                          color: Color.fromARGB(255, 50, 50, 50)),
                    ),
                  ),
                  SizedBox(
                      child: ListView.builder(
                          itemCount: _selected.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) => 
                          Container(
                            height: 70,
                            margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: _selected[index]["selected"] ? Colors.black.withOpacity(0.15) : Colors.black.withOpacity(0.07),
                                      offset: Offset(4,3),
                                      blurRadius: 10
                                    )
                                  ]
                                ),
                                alignment: Alignment.center,
                                child: ListTile(
                                  title: Padding(
                                    padding:  EdgeInsets.only(left: width*0.03),
                                    child: Text(_selected[index]["title"]),
                                  ),
                                  trailing: IconButton(
                                    icon: _selected[index]["selected"]
                                        ? Icon(Icons.check_circle, color: primaryColor,)
                                        : Icon(Icons.circle_outlined),
                                    onPressed: () {
                                      setState(() {
                                        _selected[index]["selected"] =
                                            !_selected[index]["selected"];
                                      });
                                    },
                                  ),
                                ),
                              ))),
                  SizedBox(height: 40,)
                ]),
          ),
        ),
      ),
    );
  }
}
