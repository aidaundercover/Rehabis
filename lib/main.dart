import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/provider/event_provider.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/face_recognition/camera_sign_in.dart';
import 'package:rehabis/views/first_view/fisrt_view.dart';
import 'package:rehabis/views/first_view/select_your_weak.dart';
import 'package:rehabis/views/main/calendar.dart';
import 'package:rehabis/views/main/home.dart';
import 'package:rehabis/views/main/profile.dart';
import 'package:rehabis/views/main/progress.dart';
import 'package:rehabis/views/main/voice.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

List<CameraDescription>? cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };

  cameras = await availableCameras();
  await Hive.initFlutter();
  await HiveBoxes.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void initState() {
    super.initState();
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EventProvider(),
        child: MaterialApp(
            home:isLoggedIn
                ? FirstView()
                : Main()));
  }
}

class Main extends StatefulWidget {
  const Main({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainState();
  }
}

class _MainState extends State<Main> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    Calendar(),
    const Voice(),
    const ProfileMain()
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.calendar_month, size: 30),
          Icon(Icons.support, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: secondPrimaryColor,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
  }
}
