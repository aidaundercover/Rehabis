import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/models/Relative.dart';

class PickingClosedOnes extends StatefulWidget {
  const PickingClosedOnes({Key? key}) : super(key: key);

  @override
  State<PickingClosedOnes> createState() => _PickingClosedOnesState();
}

TextEditingController relation = TextEditingController(text: "");

class _PickingClosedOnesState extends State<PickingClosedOnes> {
  List<Contact>? contacts;

  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print(contacts);
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContact();
  }

  Widget contactCard(double width, int n, String number, String person) {
    return Container(
      width: width * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          boxShadow: [BoxShadow()]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Person $n",
              style: TextStyle(),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
              },
              child: Container(child: Text('$person', style: TextStyle(),))),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (conext) => ContactsList(contacts: contacts!)));
              },
              child: Container(child: Text('$number', style: TextStyle(),)))
          ],
        )
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Text("Add an emergency contacts",
              style: TextStyle(color: secondPrimaryColor, fontFamily: 'Inter')),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        floatingActionButton: IconButton(
          onPressed: () {
            
          },
          icon: Icon(Icons.add, color: Colors.white),
        ),
        body: relatives.isNotEmpty
            ? Column(
                children: List.generate(
                    relatives.length, (index) => contactCard(width, index+1, relatives[index].number, relatives[index].relation)))
            : Center(
                child: SizedBox(
                  child: Text("There is no emergency contacts so far.",
                      style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Inter',
                          fontSize: 17)),
                ),
              ));
  }
}

class ContactsList extends StatefulWidget {
  ContactsList({Key? key, required this.contacts}) : super(key: key);

  List<Contact> contacts;

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.contacts.length,
      itemBuilder: (BuildContext context, int index) {
        String num = (widget.contacts![index].phones.isNotEmpty)
            ? (widget.contacts[index].phones.first.number)
            : "--";
        return ListTile(
            leading: Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: primaryColor),
                child: Text(
                  widget.contacts[index].name.first[0],
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )),
            title: Text(
                "${widget.contacts[index].name.first} ${widget.contacts[index].name.last}"),
            subtitle: Text(num),
            onTap: () {
              relatives.add(Relative(number: num, relation: relation.text));
            });
      },
    );
  }
}
