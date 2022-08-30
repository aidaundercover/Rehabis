import 'package:flutter/material.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class GloveOne extends StatefulWidget {
  const GloveOne({Key? key}) : super(key: key);

  @override
  State<GloveOne> createState() => _GloveOneState();
}

class _GloveOneState extends State<GloveOne> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: exerciseAppbar("Fingers exercise", context),
        body: Column(
          children: [textHeader(width, "This exercise is created to enhance finger flexibility and reduce bone tremor")],
        ));
  }
}
