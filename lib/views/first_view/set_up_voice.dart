import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/utils/speech_api.dart';
import 'package:rehabis/utils/utils.dart';
import 'package:rehabis/widgets/slider_fv.dart';

class SetVoiceAssistant extends StatefulWidget {
  const SetVoiceAssistant({Key? key}) : super(key: key);

  @override
  State<SetVoiceAssistant> createState() => _SetVoiceAssistantState();
}

String text = "Press mic and say hi";
bool isListening = false;

class _SetVoiceAssistantState extends State<SetVoiceAssistant> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Main()));
        },
        child: SingleChildScrollView(
          reverse: true,
          child: SizedBox(
            width: width*0.5+30,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AvatarGlow(
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
                      onPressed: () {
                        toggleRecording;
                      },
                      icon: isListening ? Icon(Icons.mic) : Icon(Icons.mic_none)),
                ),
              ),
                Container(
                  width: width * 0.31,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(width: 2, color:secondPrimaryColor)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Complete",
                        style: TextStyle(color: secondPrimaryColor, fontSize: 15),
                      ),
                      Icon(
                        Icons.done_rounded,
                        color: secondPrimaryColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            slider(3, width),
            SizedBox(
              width: width * 0.8,
              child: Text(
                "Use in-build voice assistant.",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontFamily: "Ruberoid",
                    color: Color.fromARGB(255, 50, 50, 50)),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
                width: width * 0.35, child: Lottie.asset('assets/voice.json')),
            SizedBox(height: 15,),
            Text(text, style: TextStyle(fontFamily: "Inter",fontSize: 22),),
            
          ],
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
      onResult: (text) => setState(() => text = text),
      onListening: (isListening) {
        setState(() => isListening = isListening);

        if (!isListening) {
          Future.delayed(Duration(seconds: 1), () {
            Utils.scanText(text);
          });
        }
      });
}
