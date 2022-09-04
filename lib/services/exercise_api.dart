import 'package:firebase_database/firebase_database.dart';
import 'package:rehabis/globalVars.dart';

class ExerciseApi {
  static void uploadExercise(String equipment, int count, String time,
      String type, String skill, int level) async {
    DatabaseReference ref = FirebaseDatabase.instance
        .ref("Users/$iinGlobal/Trainigs/${DateTime.now().toString()}");

    var training = {
      "Equipment": equipment,
      "Count": count,
      "Time": time,
      "Type": type,
      'Skill': skill,
      'level': level,
    };

    await ref.update(training);
    print('Uploaded');
  }
}
