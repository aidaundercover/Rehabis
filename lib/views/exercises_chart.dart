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
  List<Exercise> _chartDataHands = [];
  List<Exercise> _chartDataLegs = [];
  List<Exercise> _chartDataCore = [];

  TooltipBehavior _tooltipBehavior = TooltipBehavior();

  @override
  void initState() {
    // TODO: implement initState
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  final ref = FirebaseDatabase.instance.ref();

  Widget colorShow(Color color, String title) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: color
          ),
        ),
        SizedBox(width: 7,),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,))
      ],
    );
  }


  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;


    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Динамика упражнений"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          StreamBuilder(
              stream: ref.child('Users/$iinGlobal/Trainings/').onValue,
              builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                if (snapshot.hasData) {
                  final myTrainings = Map<String, dynamic>.from(
                      snapshot.data!.snapshot.value as Map<dynamic, dynamic>);

                  myTrainings.forEach((key, value) async {
                    final nextMarker = Map<String, dynamic>.from(value);

                    if (nextMarker["BodyPart"] == "Cap") {
                      final mapre = Exercise(nextMarker["BodyPart"],
                          nextMarker["Count"], nextMarker["Date"]);

                      _chartDataHands.add(mapre);
                    }

                    if (nextMarker["BodyPart"] == "Glove") {
                      final mapre = Exercise(nextMarker["BodyPart"],
                          nextMarker["Count"], nextMarker["Date"]);

                      _chartDataLegs.add(mapre);
                    }

                    if (nextMarker["BodyPart"] == "Cube") {
                      final mapre = Exercise(nextMarker["BodyPart"],
                          nextMarker["Count"], nextMarker["Date"]);

                      _chartDataCore.add(mapre);
                    }
                  });

                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      height: height*0.7,
                      child: SfCartesianChart(
                        tooltipBehavior: _tooltipBehavior,
                        primaryXAxis: CategoryAxis(),
                        series: <CartesianSeries>[
                          LineSeries<Exercise, String>(
                              dataSource: _chartDataHands,
                              color: deepPurple,
                              xAxisName: "Дата выполнения",
                              yAxisName: "Количество выполнений",
                              name: "Кепка",
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
            height:10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              colorShow(deepPurple, "Кепка"),
              colorShow(deepPink, "Перчатка"),
          colorShow(orange, "Кубики")
            ],
          ),
          
        ],
      ),
    ));
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
