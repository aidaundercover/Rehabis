import 'dart:convert';

class User {
  String name;
  String iin;
  List modelData;

  User({
    required this.name,
    required this.iin,
    required this.modelData,
  });

  static User fromMap(Map<String, dynamic> user) {
    return new User(
      name: user['name'],
      iin: user['iin'],
      modelData: jsonDecode(user['model_data']),
    );
  }

  toMap() {
    return {
      'name': name,
      'iin': iin,
      'model_data': jsonEncode(modelData),
    };
  }
}