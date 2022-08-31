import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rehabis/provider/event_provider.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/face_recognition/camera_sign_in.dart';
import 'package:rehabis/views/first_view/fisrt_view.dart';
import 'package:rehabis/views/first_view/select_your_weak.dart';
import 'package:rehabis/views/main/calendar.dart';
import 'package:rehabis/views/main/home.dart';
import 'package:rehabis/views/main/profile.dart';
import 'package:rehabis/views/main/progress.dart';

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

  late StreamSubscription<User?> user;

  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  void dispose() {
    user.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        home: FirebaseAuth.instance.currentUser == null ? FirstView() : Main()));
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
    const Schedule(),
    const ProfileMain()
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: width * 0.88,
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            onTap: onTabTapped,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            iconSize: 32,
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontFamily: 'Inter'),
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.map_sharp),
                label: "Calendar",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ]),
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
