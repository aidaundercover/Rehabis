import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart' show DateFormat;

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

  static void scanText(String rawText) {
    final text = rawText.toLowerCase();

    if (text.contains(Command.hello)) {
      final body = _getTextAfterCommand(text: text, command: Command.hello);

      sayHello();
    }
  }
}

printIfDebug(data) {
  if (kDebugMode) {
    print(data);
  }
}

class Command {
  static final all = [call, hello, about];

  static const call = "call";
  static const hello = "Hello";
  static const about = "What is Rehabis";
}

sayHello() {
  AudioCache player = AudioCache();
  const alarmAudioPath = "sound_alarm.mp3";
  player.load(alarmAudioPath);
}
