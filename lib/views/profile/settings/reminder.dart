import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:rehabis/database/database.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/services/notification_api.dart';
import 'package:rehabis/views/some_page.dart';
import 'package:intl/intl.dart';


class Reminder extends StatefulWidget {
  const Reminder({Key? key}) : super(key: key);

  @override
  State<Reminder> createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {

  TimeOfDay selectedTime = TimeOfDay.now();
  bool showTime = false;
  List<bool> isSelected = [false, false, false];

    TextEditingController days = TextEditingController(text: "");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NotificationApi.init(initSchedule: true);
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotification.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SomePage(payload: payload!)));

    Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }
      
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
      decoration: BoxDecoration(color: secondaryColor.withOpacity(0.1)),
      child: Column(
        children: [
          TextFormField(
            controller: days,
            keyboardType: TextInputType.number,
          ),
          ToggleButtons(children: [
            Text('Every Day'),
            Text('Every 2 days'),
            Text('Every 3 days'),
          ], isSelected: isSelected),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _selectTime(context);
                showTime = true;
              },
              child: const Text('Timer Picker'),
            ),
          ),
          showTime
              ? Center(child: Text(getTime(selectedTime)))
              : const SizedBox(),
          TextButton(
              onPressed: () {
                NotificationApi.showScheduledNotification(
                    title: "Its time for streching up!",
                    time: selectedTime,
                    days: int.parse(days.text),
                    body:
                        "The instensity of your exercising will Directly affect your rehab duration!",
                    payload: "rehabis.com");
                Scaffold.of(context).showBottomSheet((context) => Container(
                      height: 10,
                      decoration: BoxDecoration(),
                      alignment: Alignment.center,
                      child: Text("Notification Set"),
                    ));
              },
              child: Text("Show  Notification")),
          TextButton(onPressed: () {
              DatabaseHelper _dataBaseHelper = DatabaseHelper.instance;
              _dataBaseHelper.deleteAll();
          }, child: Text('Clear Databse',), ),
          TextButton(onPressed: () {
              // ExerciseApi.uploadExercise('equipment', 33, "time", "t", "skill", 2);
          }, child: Text('Uplaod exercise test',), )
        ],
      ),
        )
        ],
      ),
    );
  }
}
