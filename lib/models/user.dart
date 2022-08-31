class UserRehabis {
  static const String iinKey = "user_iin";
  static const String nameKey = "user_name";
  static const String arrayKey = "user_array";

  String? iin;
  String? name;
  List? array;

  UserRehabis({this.iin, this.name, this.array});

  factory UserRehabis.fromJson(Map<dynamic, dynamic> json) => UserRehabis(
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
