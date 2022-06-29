// import 'package:flutter/material.dart';
// import 'package:rehabis/models/Event.dart';
// import 'package:rehabis/provider/event_provider.dart';
// import 'package:rehabis/utils.dart';
// import 'package:provider/provider.dart';
// import 'package:firebase_database/firebase_database.dart';

// class EventCreate extends StatefulWidget {
//   const EventCreate({Key? key, this.event}) : super(key: key);
//   final Event? event;

//   @override
//   State<EventCreate> createState() => _EventCreateState();
// }

// class _EventCreateState extends State<EventCreate> {
//   late DateTime from;
//   late DateTime to;
//   final GlobalKey<FormState> _key = GlobalKey();
//   final titleController = TextEditingController();
//   final ref = FirebaseDatabase.instance.ref();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     if (widget.event != null) {
//       from = DateTime.now();
//       to = DateTime.now().add(const Duration(hours: 1));
//     } else {
//       final event = widget.event!;

//       titleController.text = event.title;
//       from = event.from;
//       to = event.to;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(leading: const CloseButton(), actions: saveButton()),
//         body: SingleChildScrollView(
//             child: Form(
//                 key: _key,
//                 child: Column(
//                   children: [buildTile(), buildDateTimePickers()],
//                 ))));
//   }

//   List<Widget> saveButton() => [
//         ElevatedButton.icon(
//             style: ElevatedButton.styleFrom(primary: Colors.transparent),
//             onPressed: () {
//               saveForm();
//             },
//             icon: const Icon(Icons.save),
//             label: const Text("SAVE"))
//       ];

//   Widget buildTile() => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextFormField(
//             onFieldSubmitted: (_) => saveForm(),
//             validator: (title) => title != null && titleController.text.isEmpty
//                 ? "Title can not be empty"
//                 : null,
//             controller: titleController,
//             decoration: const InputDecoration(hintText: "Add title")),
//       );
//   Widget buildDateTimePickers() =>
//       Column(children: [buildDateFrom(), buildDateTo()]);

//   Widget buildDateFrom() => Column(children: [
//         const Text("FROM"),
//         Row(
//           children: [
//             Expanded(
//                 flex: 2,
//                 child: buildDropdownFiled(
//                     text: Utils.toDate(from),
//                     onClicked: () {
//                       pickFromDateTime(pickDate: true);
//                     })),
//             Expanded(
//                 flex: 1,
//                 child: buildDropdownFiled(
//                     text: Utils.toTime(from),
//                     onClicked: () {
//                       pickFromDateTime(pickDate: false);
//                     }))
//           ],
//         ),
//       ]);

//   Widget buildDateTo() => Column(children: [
//         const Text("TO"),
//         Row(
//           children: [
//             Expanded(
//                 flex: 2,
//                 child: buildDropdownFiled(
//                     text: Utils.toDate(to),
//                     onClicked: () {
//                       pickToDateTime(pickDate: true);
//                     })),
//             Expanded(
//                 flex: 1,
//                 child: buildDropdownFiled(
//                     text: Utils.toTime(to),
//                     onClicked: () {
//                       pickToDateTime(pickDate: true);
//                     }))
//           ],
//         ),
//       ]);

//   Widget buildDropdownFiled(
//           {required String text, required VoidCallback onClicked}) =>
//       ListTile(
//         title: Text(text),
//         trailing: const Icon(Icons.arrow_drop_down),
//         onTap: onClicked,
//       );
//   Future pickFromDateTime({required bool pickDate}) async {
//     final date = await pickDateTime(from, pickDate: pickDate);
//     if (date == null) return null;

//     if (date.isAfter(to)) {
//       to = DateTime(date.year, date.month, date.day, date.hour + 1);
//     }
//     setState(() {
//       from = date;
//     });
//   }

//   Future pickToDateTime({required bool pickDate}) async {
//     final date = await pickDateTime(to,
//         pickDate: pickDate, firstDate: pickDate ? from : null);
//     if (date == null) return null;

//     setState(() {
//       to = date;
//     });
//   }

//   Future<DateTime?> pickDateTime(DateTime initialDate,
//       {required bool pickDate, DateTime? firstDate}) async {
//     if (pickDate) {
//       final date = await showDatePicker(
//           context: context,
//           initialDate: initialDate,
//           firstDate: firstDate ?? DateTime(2022, 0),
//           lastDate: DateTime(2100));
//       if (date == null) return null;

//       final time =
//           Duration(hours: initialDate.hour, minutes: initialDate.minute);
//       return date.add(time);
//     } else {
//       final timeOfDay = await showTimePicker(
//           context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
//       if (timeOfDay == null) return null;

//       final date =
//           DateTime(initialDate.year, initialDate.month, initialDate.day);
//       final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
//       return date.add(time);
//     }
//   }

//   Future saveForm() async {
//     final isValid = _key.currentState!.validate();
//     if (isValid) {
//       final event =
//           Event(title: titleController.text, from: from, to: to, desc: "ff");

//       final isEditing = widget.event != null;
//       final provider = Provider.of<EventProvider>(context);

//       if (isEditing) {
//         provider.editEvent(event, widget.event!);
//       } else {
//         provider.addEvent(event);
//       }

//       Navigator.of(context).pop();
//       // ref.child('$userEmail/events').update();
//     }
//   }
// }
