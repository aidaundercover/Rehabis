import 'package:hive_flutter/hive_flutter.dart';
import 'package:rehabis/models/user.dart';

class HiveBoxes {
  static const userDetails = "user_details";

  static Box userDetailsBox() => Hive.box(userDetails);

  static initialize() async {
    await Hive.openBox(userDetails);
  }

  static clearAllBox() async {
    await HiveBoxes.userDetailsBox().clear();
  }
}

class LocalDB {
  static UserRehabis getUser() => UserRehabis.fromJson(HiveBoxes.userDetailsBox().toMap());

  static String getUserIin() => HiveBoxes.userDetailsBox().toMap()[UserRehabis.iinKey];

  static String getUserName() =>
      HiveBoxes.userDetailsBox().toMap()[UserRehabis.nameKey];

  static String getUserArray() =>
      HiveBoxes.userDetailsBox().toMap()[UserRehabis.arrayKey];

  static setUserDetails(UserRehabis user) =>
      HiveBoxes.userDetailsBox().putAll(user.toJson());
}
