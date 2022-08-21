// ignore: file_names
import 'package:flutter/material.dart';

class Event {
  final String title;
  final String desc;
  final DateTime from;
  final DateTime to;
  final Color bc;
  final bool isAllday;

  const Event({
    required this.from,
    required this.to,
    this.bc = Colors.purple,
    this.isAllday = false,
    required this.title,
    required this.desc,
  });

  // factory Event.fromMap(map) {
  //   return Event(
  //     title: map['title'],
  //     desc: map['desc'],
  //     from: map['from'],
  //     to: map['to']
  //   );
  // }
}
