import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}



class _SettingsState extends State<Settings> {


  Widget createTile(String title, IconData icon){
    return ListTile(
      leading: Icon(icon),
      title: Text(title,style: TextStyle(fontFamily: "Inter"),),
    )
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => 
          [SliverAppBar(
          title: Text("Settings", style: TextStyle(fontFamily: "Inter"),)
        )],
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
