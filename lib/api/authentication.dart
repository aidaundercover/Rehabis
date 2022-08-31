import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/auth/sign_in.dart';

class Auth {

  static void signUp(TextEditingController name, TextEditingController iin) async {
    nameGlobal = name.text;
    iinGlobal = iin.text;

    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Users/$iinGlobal/");

    await ref.set({
      "Name": nameGlobal,
      "Iin": iinGlobal,
      "Photo": LocalDB.getUserArray(),
      // "Password": password.text,
      "MedicalData": {
        "Born": DateTime.now().toString(),
        "Gender": "Unknown",
        "Height": 0,
        "Weight": 0,
        "StrokeType": "Unknown",
      },
      "Trainings": {
        "registration_time": {
          "BodyPart": "Cube",
          "Count": 0,
          "Date": DateTime.now().toString(),
          "Type": "Type1"
        }
      }
    });

    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: "$iinGlobal@rehabis.com", password: LocalDB.getUserArray());

    Fluttertoast.showToast(msg: "User registered successfully");
  }

  static void signIn() {
    
    UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: "$iinGlobal@example.com",
    password:  LocalDB.getUserArray()
  );
  }


  static void signOut(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignIn()));
  }
}
