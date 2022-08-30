import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/models/Event.dart';
import 'package:rehabis/provider/event_provider.dart';
import 'package:rehabis/views/calendar/event_datasource.dart';
import 'package:rehabis/views/calendar/event_editing_view.dart';
import 'package:rehabis/views/calendar/tasks_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class SCalendar extends StatefulWidget {
  const SCalendar({Key? key}) : super(key: key);

  @override
  State<SCalendar> createState() => _SCalendarState();
}

class _SCalendarState extends State<SCalendar> {
  @override
  Widget build(BuildContext context) {

    final List<Event> events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      //backgroundColor: Colors.white,
      initialSelectedDate: DateTime.now(),
      view: CalendarView.month,
      dataSource: EventDataSource(events),
      headerStyle:
          const CalendarHeaderStyle(textStyle: TextStyle(fontFamily: "Inter")),
      todayHighlightColor: primaryColor,
      cellBorderColor: deepPurple,
      
      selectionDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: primaryColor, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          shape: BoxShape.rectangle),
      
      showCurrentTimeIndicator: true,

      onLongPress: (details) {
        final provider =
            Provider.of<EventProvider>(context, listen: false);
        provider.setDate(details.date!);
        showModalBottomSheet(
            context: context, builder: (context) => const TasksWidget());
      },
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
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
                      .showBottomSheet((context) => const EventCreate());
                },
                icon: Icon(
                  Icons.add,
                  color: primaryColor,
                ))
          ],
        ),
        body: const SCalendar());
  }
}

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return MyWidget();
  }
}
