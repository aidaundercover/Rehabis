import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/auth/sign_in.dart';
import 'package:rehabis/views/first_view/select_your_weak.dart';

class Auth {
  static void signUp(BuildContext context, TextEditingController name,
      TextEditingController iin) async {
    nameGlobal = name.text;
    iinGlobal = iin.text;

    DatabaseReference ref =
        FirebaseDatabase.instance.ref().child("Users/$iinGlobal/");

    getBornDate(iinGlobal);

    await ref.set({
      "Name": nameGlobal,
      "Iin": iinGlobal,
      //"Photo": LocalDB.getUserArray(),
      // "Password": password.text,
      "MedicalData": {
        "Born": bornDateGlobal,
        "Gender": "Unknown",
        "Height": 0,
        "Weight": 0,
        "StrokeType": "Unknown",
      },
      "Trainings": {
        "registration_time": {
          "Equipment": "Cube",
          "Count": 0,
          "Time": '00: 00',
          "Type": "Type1",
          'Skill': "None",
          'level': 0,
        }
      }
    });

    // UserCredential userCredential = await FirebaseAuth.instance
    //     .createUserWithEmailAndPassword(
    //         email: "$iinGlobal@rehabis.com", password: LocalDB.getUserArray());

    Fluttertoast.showToast(msg: "User registered successfully");

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SelectWeakness()));
  }

  static void signIn(BuildContext context) async {
    FirebaseDatabase.instance
        .ref()
        .child("Users/${LocalDB.getUser().iin}/")
        .onValue
        .listen((value) {
      var user = value.snapshot.value as Map<dynamic, dynamic>;

      nameGlobal = user['Name'];
      iinGlobal = user['Iin'];
      weightGlobal = user['MedicalData']['Weight'];
      heightGlobal = user['MedicalData']['Height'];
      genderGlobal = user['MedicalData']['Gender'] == 'F' ? 'female' : 'male';
      bornDateGlobal = user['MedicalData']['Born'];
      strokeTypeGlobal = user['MedicalData']['StrokeType'];
    });

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: "$iinGlobal@example.com", password: LocalDB.getUserArray());

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SelectWeakness()));
  }

  static void signOut(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });

    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SignIn()));
  }
}

getBornDate(String iin) {
  if (iin.length == 12) {
    String yearPerson = '';
    String month = iin[2] + iin[3];
    String day = iin[4] + iin[5];
    int yearNow = DateTime.now().year - 2000;

    for (int i = 0; i < 2; i++) {
      yearPerson += iin[i];
    }

    int yearInt = int.parse(yearPerson);

    if (yearInt < 100 && yearInt > yearNow) {
      bornDateGlobal = '19$yearInt-$month-$day';
    } else {
      bornDateGlobal = '20$yearInt-$month-$day';
    }
  }
}
