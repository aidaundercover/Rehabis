import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/notification_api.dart';
import 'package:rehabis/provider/event_provider.dart';
import 'package:rehabis/views/calendar/tasks_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:timezone/data/latest_all.dart';
import 'package:timezone/timezone.dart';
import '../../main.dart';
import 'package:rxdart/rxdart.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // NotificationApi.init();
    listenNotificatons();
  }

  void listenNotificatons() {
    // NotificationApi.onNotification.stream.listen(onClickedNotification);
  }

  void onClickedNotification(String? payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: ((context) => const Main())));
  }

  TextEditingController days = TextEditingController(text: "1");
  TimeOfDay time = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: time,
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
          return Theme(
              data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                      // change the border color
              primary: primaryColor,
                      // change the text color
              onSurface: deepPurple,
                    ),
                  ),
                  child: Container(),
                );
              },
    );
    if (timeOfDay != null && timeOfDay != time) {
      setState(() {
        time = timeOfDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: height * 0.7,
            child: SfCalendar(
              backgroundColor: Color.fromARGB(255, 240, 240, 240),
              initialSelectedDate: DateTime.now(),
              view: CalendarView.week,
              headerHeight: 50,
              todayHighlightColor: primaryColor,
              cellBorderColor: deepPurple,
              headerStyle: CalendarHeaderStyle(
                  backgroundColor: primaryColor,
                  textStyle: const TextStyle(
                      color: Colors.white, fontFamily: 'Ruberoid', fontSize: 20)),
              selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: primaryColor, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  shape: BoxShape.rectangle),
              onTap: (details) {
                // final provider =
                //     Provider.of<EventProvider>(context, listen: true);
                // provider.setDate(details.date!);
                // showModalBottomSheet(
                //     context: context, builder: (context) => const TasksWidget());
              },
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 23.0),
            child: Text(
              "Установи напоминание, чтобы не пропускать упражнения.",
              style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return Dialog(
                          child: Container(
                            width: width * 0.8,
                            height: 250,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            child: SizedBox(
                              width: width * 0.76,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Я хочу получать уведомление на выполнения упражнений",
                                    style: TextStyle(
                                        color: deepPurple,
                                        fontSize: 16,
                                        fontFamily: 'Ruberoid'),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Каждые ",
                                        style: TextStyle(
                                            color: deepPurple,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        width: width * 0.1,
                                        height: width * 0.1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            try {
                                              int.parse(days.text);
                                            } catch (e) {
                                              days =
                                                  TextEditingController(text: "");
                                              Fluttertoast.showToast(
                                                  msg: "Указываете дни численно");
                                            }
                                            return null;
                                          },
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                                255, 226, 225, 225),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(0)),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "В ",
                                        style: TextStyle(
                                            color: deepPurple,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _selectTime(context);
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: deepPurple),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${time.hour}',
                                                style: TextStyle(
                                                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            Container(
                                              width: width * 0.1,
                                              height: width * 0.1,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: deepPurple),
                                              alignment: Alignment.center,
                                              child: Text(
                                                '${time.minute}',
                                                style: TextStyle(
                                                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        // NotificationApi.showScheduledNotification(
                                        //     title: "Пора размяться!",
                                        //     body:
                                        //         "Хэй, реабилитация пройдет быстрее чем интенсивнее и чаще вы будете совершать упражнения и следовать рекомендациям",
                                        //     time: time,
                                        //     days: int.parse(days.text));
                                        Navigator.of(context).pop();
                                      },
                                      child: Container(
                                        width: width * 0.3,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Установить",
                                          style: TextStyle(
                                              color: Colors.white, fontSize: 16),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Container(
                  width: width * 0.45,
                  height: 40,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(3, 3),
                            blurRadius: 6)
                      ]),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.alarm,
                        color: Colors.white,
                      ),
                      const Text(
                        "Настроить",
                        style: TextStyle(
                            color: Color.fromARGB(255, 254, 254, 254),
                            fontSize: 19),
                      ),
                      SizedBox(
                        width: 6,
                      )
                    ],
                  ),
                )),
          )
              ],
            ),
        ));
  }
}
