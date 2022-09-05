import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:rehabis/globalVars.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static String toDateTime(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    final time = DateFormat.Hm().format(dateTime);

    return '$date $time';
  }

  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);

    return date;
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.Hm().format(dateTime);

    return time;
  }

  static String _getTextAfterCommand(
      {required String text, required String command}) {
    final indexCommand = text.indexOf(command);
    final indexAfter = indexCommand + command.length;

    if (indexCommand == -1) {
      return "";
    } else {
      return text.substring(indexAfter).trim();
    }
  }

  static Future<void> scanText(String rawText) async {
    final text = rawText.toLowerCase();

    if (text.contains(Command.hello)) {
      var player = AudioPlayer();

      await player.setAsset("assets/hello.mp3");

      player.play();

    } else if (text.contains(Command.call)) {
      const number = '+77054475982'; //set the number here
      await FlutterPhoneDirectCaller.callNumber(number);
    } else if (text.contains(Command.email)) {
      final body = _getTextAfterCommand(text: text, command: Command.email);

      openEmail(body: body);
    } else if (text.contains(Command.pills)) {
      try {
        DatabaseReference ref = FirebaseDatabase.instance.ref("LR");

        ref.set(5);

      } catch (e) {}
    } else if (text.contains(Command.browser1)) {
      final url = _getTextAfterCommand(text: text, 
      command: Command.browser1);

      openLink(url: url);
    } else if (text.contains(Command.browser2)) {
      final url = _getTextAfterCommand(text: text, command: Command.browser2);

      openLink(url: url);
    } else if (text.contains(Command.about)) {
    } else if (text.contains(Command.call)) {}
  }

  static Future openLink({
    required String url,
  }) async {
    if (url.trim().isEmpty) {
      await _launchUrl('https://google.com');
    } else {
      await _launchUrl('https://$url');
    }
  }

  static Future openEmail({
    required String body,
  }) async {
    final url = 'mailto: ?body=${Uri.encodeFull(body)}';
    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }
}

printIfDebug(data) {
  if (kDebugMode) {
    print(data);


    //    for (int i = 0; i < relatives.lenght; i++) {}

  }
}

    

class Command {

    

  static final all = [call, email, browser1, browser2, hello, about];



  static const call = "call";

  static const pills = "pills";
  static const email = 'write email';
  static const browser1 = 'open';
  static const browser2 = 'go to';
  static const hello = "Hi";
  static const about = "What is Rehabis";
}
