import 'package:flutter/material.dart';
import 'package:rehabis/models/Event.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventDataSource extends CalendarDataSource {

  EventDataSource(List<Event> appointemnts) {
    appointments = appointments;
  }

  Event getEvent(int index) => appointments![index] as Event;

  @override
  DateTime getStartTime(int index) => getEvent(index).from;

  @override
  DateTime getEndTime(int index) => getEvent(index).to;

  @override
  String getSubject(int index) => getEvent(index).title;

  @override
  String getDescription(int index) => getEvent(index).desc;

  @override
  Color getColor(int index) => getEvent(index).bc;

  @override
  bool getAllDay(int index) => getEvent(index).isAllday;


}
