class User {
  static const String iinKey = "user_iin";
  static const String nameKey = "user_name";
  static const String arrayKey = "user_array";

  String? iin;
  String? name;
  List? array;

  User({this.iin, this.name, this.array});

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        iin: json[iinKey],
        name: json[nameKey],
        array: json[arrayKey],
      );

  Map<String, dynamic> toJson() => {
        iinKey: iin,
        nameKey: name,
        arrayKey: array,
      };
}
