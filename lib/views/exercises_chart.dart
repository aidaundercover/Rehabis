import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:firebase_database/firebase_database.dart';

class ExercisesChart extends StatefulWidget {
  const ExercisesChart({Key? key}) : super(key: key);

  @override
  State<ExercisesChart> createState() => _ExercisesChartState();
}

class _ExercisesChartState extends State<ExercisesChart> {
  List<bool> isSelected = [false, false, false];

  List<Exercise> _chartDataHands = [];
  List<Exercise> _chartDataLegs = [];
  List<Exercise> _chartDataCore = [];
  List<Exercise> _cognitivedData = [];

  TooltipBehavior _tooltipBehavior = TooltipBehavior();

  @override
  void initState() {
    // TODO: implement initState
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final ref = FirebaseDatabase.instance.ref();

  Widget colorShow(Color color, String title) {
    return Text(title,
        style:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color));
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var style = TextStyle(color: Colors.grey, fontFamily: "Inter");

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: ToggleButtons(
                children: [
                  Text("Today", style: style),
                  Text("Last week", style: style),
                  Text("Last month", style: style),
                ],
                isSelected: isSelected,
                selectedColor: secondPrimaryColor.withOpacity(0.4),
                fillColor: secondPrimaryColor.withOpacity(0.4),
                splashColor: secondPrimaryColor.withOpacity(0.4),
                focusColor: secondPrimaryColor.withOpacity(0.4),
                onPressed: (i) {
                  setState(() {
                    isSelected[i] = !isSelected[i];

                    switch (i) {
                      case 0:
                        {
                          isSelected[1] = false;
                          isSelected[2] = false;
                        }
                        break;
                      case 1:
                        {
                          isSelected[0] = false;
                          isSelected[2] = false;
                        }
                        break;
                      case 2:
                        {
                          isSelected[0] = false;
                          isSelected[1] = false;
                        }
                        break;
                    }
                  });
                }),
          ),
          StreamBuilder(
              stream: ref.child('Users/$iinGlobal/Trainings/').onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  final myTrainings = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>);

                  myTrainings.forEach((key, value) async {
                    final nextMarker = Map<String, dynamic>.from(value);

                    String time = '';
                    if(isSelected[0]){
                      
                    }

                    if (nextMarker["Equipment"] == "Cap") {
                      final mapre = Exercise(
                          time, nextMarker["Count"], nextMarker["Time"]);

                      _chartDataHands.add(mapre);
                    }

                    if (nextMarker["Equipment"] == "Glove") {
                      final mapre = Exercise(
                          time, nextMarker["Count"], nextMarker["Time"]);

                      _chartDataLegs.add(mapre);
                    }

                    if (nextMarker["Equipment"] == "Cube") {
                      final mapre = Exercise(
                          key, nextMarker["Count"], nextMarker["Time"]);

                      _chartDataCore.add(mapre);
                    }

                    if (nextMarker["Equipment"] == "None") {
                      final mapre = Exercise(
                          key, nextMarker["Count"], nextMarker["Time"]);

                      _cognitivedData.add(mapre);
                    }
                  });

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: height * 0.35,
                      width: width * 0.82,
                      child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehavior,
                        primaryXAxis: CategoryAxis(),
                        series: <CartesianSeries>[
                          LineSeries<Exercise, String>(
                              dataSource: _chartDataHands,
                              color: deepPurple,
                              xAxisName: "Дата выполнения",
                              yAxisName: "Количество выполнений",
                              name: "Cap",
                              enableTooltip: true,
                              xValueMapper: (Exercise exercises, _) =>
                                  exercises.time,
                              yValueMapper: (Exercise exercises, _) =>
                                  exercises.count),
                          LineSeries<Exercise, String>(
                              dataSource: _chartDataLegs,
                              color: deepPink,
                              enableTooltip: true,
                              xValueMapper: (Exercise exercises, _) =>
                                  exercises.time,
                              yValueMapper: (Exercise exercises, _) =>
                                  exercises.count),
                          LineSeries<Exercise, String>(
                              dataSource: _chartDataLegs,
                              color: deepPink,
                              enableTooltip: true,
                              xValueMapper: (Exercise exercises, _) =>
                                  exercises.time,
                              yValueMapper: (Exercise exercises, _) =>
                                  exercises.count),
                          LineSeries<Exercise, String>(
                              dataSource: _chartDataCore,
                              color: orange,
                              enableTooltip: true,
                              xValueMapper: (Exercise exercises, _) =>
                                  exercises.time,
                              yValueMapper: (Exercise exercises, _) =>
                                  exercises.count)
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: primaryColor,
                  ));
                }
              }),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: width * 0.6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                colorShow(deepPurple, "Cap"),
                colorShow(deepPink, "Gloves"),
                colorShow(orange, "Cubes")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Exercise> getChartData() {
  final List<Exercise> chartData = <Exercise>[
    Exercise("Hands", 13, "04.30.2022 11:03"),
    Exercise("Hands", 3, "04.30.2022 11:02"),
    Exercise("Hands", 7, "04.30.2022 11:01"),
  ];

  DatabaseReference starCountRef =
      FirebaseDatabase.instance.ref('Users/123456789012/Trainings/');
  starCountRef.onValue.listen((DatabaseEvent event) {
    final data = event.snapshot.value as Exercise;
    chartData.add(data);
  });

  return chartData;
}

class Exercise {
  final String bodyPart;
  final int count;
  final String time;

  Exercise(this.bodyPart, this.count, this.time);

  // factory Exercise.fromMap(Map<dynamic, dynamic> map) {
  //   return Exercise(
  //     bodyPart: map['BodyPart'] ?? '',
  //     count: map['Count'] ?? 0,
  //     time : map['Date'] ?? ''
  //   );
  // }
}
