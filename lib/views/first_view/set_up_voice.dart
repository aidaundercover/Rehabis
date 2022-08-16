import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/utils/speech_api.dart';
import 'package:rehabis/utils/utils.dart';
import 'package:rehabis/views/main/home.dart';
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
          child: Container(
            width: width * 0.3,
            height: 40,
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Complete",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Icon(
                  Icons.done_rounded,
                  color: Colors.white,
                )
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
                width: width * 0.4, child: Lottie.asset('assets/voice.json')),
            AvatarGlow(
              animate: isListening,
              glowColor: secondPrimaryColor,
              endRadius: 70,
              child: IconButton(
                  color: secondPrimaryColor,
                  splashRadius: 30,
                  onPressed: () {
                    toggleRecording;
                  },
                  icon: isListening ? Icon(Icons.mic) : Icon(Icons.mic_none)),
            )
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
