import 'package:firebase_database/firebase_database.dart';
import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/auth/sign_in.dart';
import 'package:rehabis/views/profile/med_card.dart';

class ProfileMain extends StatefulWidget {
  const ProfileMain({Key? key}) : super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List profileCards = [
      {
        "icon": Icons.perm_device_info,
        "title": "Медицинская карта",
        "page": MedicalCard()
      },
      {"icon": Icons.ads_click_sharp, "title": "Цели", "page": MedicalCard()},
      {
        "icon": Icons.access_time_outlined,
        "title": "История упражнений",
        "page": MedicalCard()
      },
      {
        "icon": Icons.build_circle_outlined,
        "title": "Настройки",
        "page": MedicalCard()
      },
      {
        "icon": Icons.animation_sharp,
        "title": "Про Rehabis",
        "page": MedicalCard()
      },
      {
        "icon": Icons.agriculture_rounded,
        "title": "Поддержка",
        "page": MedicalCard()
      },
    ];

    final ref = FirebaseDatabase.instance.ref();

    Widget appBar() {


              return Container(
                width: width,
                height: height * 0.35,
                decoration: BoxDecoration(color: deepPurple, boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(0, 3),
                      blurRadius: 5)
                ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder(
                      stream: ref.child('Users/$iinGlobal/MedicalData/').onValue,

                      builder: (context,AsyncSnapshot<DatabaseEvent>  snapshot) {

                        if(snapshot.hasData) {
                        final myData = Map<String, dynamic>.from(
                  snapshot.data!.snapshot.value as Map<dynamic, dynamic>);

                      
                        return CircleAvatar(
                          child: Image.asset(
                            myData["Gender"] == "Ж" ? 'assets/profile.png' : 
                            'assets/profile_men.png',
                            width: 140,
                          ),
                          radius: 70,
                        );
                        } else {
                          return CircleAvatar(
                          child: Image.asset(
                           'assets/profile.png',
                            width: 140,)
                          );
                        }
                      }
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "$nameGlobal",
                      style: TextStyle(
                          fontFamily: 'Ruberoid',
                          color: Colors.white,
                          fontSize: 19),
                    )
                  ],
                ),
              );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          appBar(),
          ListView.builder(
              shrinkWrap: true,
              itemCount: profileCards.length,
              itemBuilder: (BuildContext context, int i) {
                return Card(
                  child: ListTile(
                    leading: Icon(
                      profileCards[i]["icon"],
                      color: Color.fromARGB(255, 93, 33, 243),
                    ),
                    title: Text(
                      profileCards[i]["title"],
                      style: const TextStyle(color: Colors.black, fontSize: 17),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => profileCards[i]["page"]));
                    },
                  ),
                );
              }),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              nameGlobal = "";
              iinGlobal = "";
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => SignIn()));
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    "Выйти",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
