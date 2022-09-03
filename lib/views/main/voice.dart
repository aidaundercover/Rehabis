import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/services/speech_api.dart';
import 'package:rehabis/utils/utils.dart';
import 'package:rehabis/widgets/slider_fv.dart';
import 'package:rehabis/widgets/substring_highlight.dart';

class Voice extends StatefulWidget {
  const Voice({Key? key}) : super(key: key);

  @override
  State<Voice> createState() => _Voice();
}

class _Voice extends State<Voice> {
  String text = "Hello!";
  bool isListening = false;

  late AudioPlayer player;

  @override
  void initState() {
    

    super.initState();
  }

  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: TextButton(
        onPressed: () {
          setState(() {
            isListening = !isListening;
          });
        },
        child: AvatarGlow(
          animate: isListening,
          glowColor: secondPrimaryColor,
          endRadius: 50,
          child: Container(
            decoration: BoxDecoration(
              color: secondPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
                color: Colors.white,
                splashRadius: 30,
                onPressed: toggleRecording,
                icon: isListening ? Icon(Icons.mic) : Icon(Icons.mic_none)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Center(
          child: Column(
            children: [
              
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  width: width * 0.8,
                  child: Lottie.asset('assets/voice.json', animate: isListening)),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: width * 0.8,
                child: SubstringHighlight(
                  text: text,
                  terms: Command.all,
                  textStyle: TextStyle(
                      fontSize: 27.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"),
                  textStyleHighlight: TextStyle(
                      fontSize: 27.0,
                      color: secondPrimaryColor,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Inter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (t) => setState(() => text = t),
      onListening: (isListening) {
        setState(() => isListening = isListening);

        if (!isListening) {
          Future.delayed(Duration(seconds: 1), () {
            Utils.scanText(text);
          });
        }
      });
}
