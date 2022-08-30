import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/exercises/exerciseWidgets.dart';

class Breathing extends StatefulWidget {
  const Breathing({Key? key}) : super(key: key);

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing> {
  bool isInhale = true;
  bool isStarted = false;

  late AudioPlayer player;

  @override
  void initState() {
    // TODO: implement initState

    player = AudioPlayer();

    void nothing() {}

    isStarted
        ? Timer.periodic(const Duration(milliseconds: 3600), (timer) {
            setState(() async {
              isInhale = !isInhale;

              if(isInhale){
                await player.setAsset('assets/inhale.mp3');
                player.play();
              } else {
                await player.setAsset('assets/exhale.mp3');
                player.play();
              }
            });
          })
        : nothing;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: exerciseAppbar("Breathing exercise", context),
      body: Column(
        children: [
          textHeader(width,
              'Breathing exercises can help you control and coordinate your breathing while talking. Ideally, a stroke patient can practice breathing exercises at least twice a day.'),
          SizedBox(height: 50),
          Stack(
            alignment: Alignment.center,
            children: [
              isStarted ? Lottie.asset("assets/breathe.json"): Image.asset('asset/female.png'),
              isStarted ? Text(
                isInhale ? "Inhale" : "Exhale",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 17,
                    color: Colors.black.withOpacity(0.8)),
              ) : Container()
            ],
          ),
          SizedBox(height: 20,),
           !isStarted ? TextButton(
              onPressed: () {
                setState(() {
                  isStarted = !isStarted;
                });
              },
              child: Container(
                width: width * 0.4,
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondPrimaryColor.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(4, 4),
                          color: secondPrimaryColor.withOpacity(0.01)),
                      BoxShadow(
                          offset: Offset(-4, -4),
                          color: secondPrimaryColor.withOpacity(0.01))
                    ]),
                alignment: Alignment.center,
                child: Text(
                 "Start",
                  style: TextStyle(
                      color: secondPrimaryColor.withOpacity(0.8),
                      fontFamily: 'Inter',
                      fontSize: 16),
                ),
              )) : Container(
                width: width*0.9,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color : secondPrimaryColor.withOpacity(0.14),
                  boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 4),
                            color: secondPrimaryColor.withOpacity(0.01)),
                        BoxShadow(
                            offset: Offset(-4, -4),
                            color: secondPrimaryColor.withOpacity(0.01))
                      ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Icon(Icons.tips_and_updates, color: secondPrimaryColor.withOpacity(0.4),),
                  SizedBox(
                    // width: width*0.5,
                    child: Text("Practice this exercise at least 10 -times in the morning and evening. Breathing exercises will strengthen your diaphragm. It will help you remain calm. Working on your breathing will allow you to automatically regulate breathing and speaking."))
                ]),
              )
        ],
      ),
    );
  }
}
