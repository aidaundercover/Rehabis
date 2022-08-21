import 'package:flutter/material.dart';

class LadyBag extends StatefulWidget {
  const LadyBag({Key? key}) : super(key: key);

  @override
  State<LadyBag> createState() => _LadyBagState();
}

class _LadyBagState extends State<LadyBag> {
  @override
  Widget build(BuildContext context) {
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
      body: Column(
        children: [

        ],
      ),
    );
  }
}
