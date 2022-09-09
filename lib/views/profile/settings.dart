import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rehabis/database/database.dart';
import 'package:rehabis/services/exercise_api.dart';
import 'package:rehabis/services/notification_api.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/views/some_page.dart';
import 'package:intl/intl.dart';

import 'settings/picking_closed_ones.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController days = TextEditingController(text: "");
  TimeOfDay selectedTime = TimeOfDay.now();
  bool showTime = false;
  List<bool> isSelected = [false, false, false];

  Widget createTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontFamily: "Inter"),
      ),
    );
  }

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

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                    title: Text(
                  "Settings",
                  style: TextStyle(fontFamily: "Inter", color: Colors.black54),
                ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.grey), onPressed: () => Navigator.of(context).pop(),)
                )
              ],
          body: SingleChildScrollView(
            child: Column(children: [setNotifications(), addRelatives()]),
          )),
    );
    
  }

  Widget setNotifications() {
    return Container(
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
    );
  }

  Widget relativeCard() {
    return SizedBox(
      // width: width*0.94,

      child: Row(children: [
        
      ],)
    );
  }

  Widget addRelatives() {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const PickingClosedOnes())),
      child: Container(
        decoration: BoxDecoration(),
        child: Column(children: [
          Row(
            children: [
              Text("Add relatives cell phone numbers, in case of emergency"),
              Tooltip(
                message: "You can use voice assistant for calling them",
                child: Icon(Icons.whatshot_outlined, color: secondaryColor),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
