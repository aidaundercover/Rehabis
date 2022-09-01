// ignore: file_names
import 'package:flutter/material.dart' show Color;
import 'package:rehabis/models/Relative.dart';

String prediction = "None";
double value = 0.01;

bool isLoggedIn = false;

/// Personal data ///
String nameGlobal = "Имя Фамилия";
String iinGlobal = "060114651689";
String roleGlobal = '';
List<String> selectedWeakneases = [];
List<Relative> relatives = [];

/// Medical data ///
String bornDateGlobal = "";
String genderGlobal = "male";
String strokeTypeGlobal = "";
int heightGlobal = 0;
int weightGlobal = 0;
double bmiGlobal = 0;

// COLOR SCHEME //
Color primaryColor = const Color.fromRGBO(204, 101, 255, 1.0);
Color backgroundColor = const Color.fromRGBO(248, 235, 255, 1.0);
Color secondPrimaryColor = const Color.fromRGBO(188, 73, 255, 1.0);
Color secondaryColor = const Color.fromARGB(255, 172, 111, 202);
Color yellowSecondary = const Color.fromARGB(255, 255, 247, 172);
Color orange = Color.fromARGB(255, 255, 178, 0);
Color deepPurple = const Color.fromARGB(255, 113, 84, 187);
Color deepPink = Color.fromARGB(255, 226, 71, 123);
