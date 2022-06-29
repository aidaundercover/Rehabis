// import 'package:flutter/material.dart';
// import 'package:rehabis/models/Event.dart';
// import 'package:rehabis/provider/event_provider.dart';
// import 'package:rehabis/views/calendar/event_editing_view.dart';
// import 'package:provider/provider.dart';

// class EventViewingPage extends StatelessWidget {
//   final Event event;
//   const EventViewingPage({Key? key, required this.event}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             leading: const CloseButton(),
//             actions: buildViewingActions(context, event)),
//         body: ListView(
//           padding: const EdgeInsets.all(32),
//           children: [
//             buildDateTime(event),
//             const SizedBox(
//               height: 30,
//             ),
//             Text(
//               event.title,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             Text(
//               event.desc,
//               style: const TextStyle(fontSize: 15),
//             ),
//           ],
//         ));
//   }

//   Widget buildDateTime(Event event) {
//     return Column(
//       children: [
//         buildDate(event.isAllday ? "All-day" : "From", event.from),
//         if (!event.isAllday) buildDate("To", event.to)
//       ],
//     );
//   }

//   Widget buildDate(String title, DateTime date) {
//     return Row(
//       children: [
//         Expanded(child: Text(title)),
//         Expanded(child: Text(date.toString()))
//       ],
//     );
//   }

//   List<Widget> buildViewingActions(BuildContext context, Event event) => [
//         IconButton(
//             onPressed: () {
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => EventCreate(event: event)));
//             },
//             icon: const Icon(Icons.edit)),
//         IconButton(
//             onPressed: () {
//               final provider =
//                   Provider.of<EventProvider>(context, listen: true);
//               provider.deleteEvent(event);
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => EventCreate(event: event)));
//             },
//             icon: const Icon(Icons.delete))
//       ];
// }


