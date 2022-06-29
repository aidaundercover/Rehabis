import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rehabis/views/first_view/fisrt_view.dart';
import 'package:rehabis/views/main/calendar.dart';
import 'package:rehabis/views/main/home.dart';
import 'package:rehabis/views/main/profile.dart';
import 'package:rehabis/views/main/progress.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  runApp(const MaterialApp(home:FirstView()));
}


class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    const Schedule(),
    const ProgressMain(),
    const ProfileMain()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          iconSize: 32,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Главная",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp),
              label: "Календарь",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism),
              label: "Прогресс",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Профиль",
            ),
          ]
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}