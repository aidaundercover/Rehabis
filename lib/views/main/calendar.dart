import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/models/event_datasource.dart';
import 'package:rehabis/notification_api.dart';
import 'package:rehabis/provider/event_provider.dart';
import 'package:rehabis/views/calendar/event_editing_view.dart';
import 'package:rehabis/views/calendar/tasks_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../main.dart';


class SCalendar extends StatelessWidget {
  const SCalendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final events = Provider.of<EventProvider>(context).events;
    
    return SfCalendar(
      //backgroundColor: Colors.white,
      initialSelectedDate: DateTime.now(),
      view: CalendarView.month,
      headerStyle: CalendarHeaderStyle(
        textStyle: TextStyle(fontFamily: "Inter")
      ),
      todayHighlightColor: primaryColor,
      cellBorderColor: deepPurple,
      selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle),
      dataSource: EventDataSource(events),
      onTap: (details) {
        final provider =
            Provider.of<EventProvider>(context, listen: true);
        provider.setDate(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => const TasksWidget());
      },
    );
  }
}

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

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Calendar",
            style: TextStyle(
                color: Colors.black.withOpacity(0.9),
                fontSize: 20,
                fontFamily: "Inter"),
          ),
          leading: Container(),
          actions: [
            IconButton(
                onPressed: () {
                  Scaffold.of(context)
                      .showBottomSheet((context) => EventCreate());
                },
                icon: Icon(
                  Icons.add,
                  color: primaryColor,
                ))
          ],
        ),
        body: SCalendar());
  }
}
