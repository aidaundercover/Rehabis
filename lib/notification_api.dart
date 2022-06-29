// import 'package:flutter/material.dart';
// import "package:flutter_local_notifications/flutter_local_notifications.dart";
// import 'package:rxdart/rxdart.dart';
// import 'package:timezone/data/latest_all.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class NotificationApi {
//   static final _notifications = FlutterLocalNotificationsPlugin();
//   static final onNotification = BehaviorSubject<String?>();

//   static Future _notificationDetails() async {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channel id', 'channel name',channelDescription: "channel description",
//             importance: Importance.max),
//         iOS: IOSNotificationDetails());
//   }

//   static Future init({bool initSchedule = false}) async {
//     final iOS = IOSInitializationSettings();
//     final android = AndroidInitializationSettings("@mipmap/ic_launcher");

//     final settings = InitializationSettings(android: android, iOS: iOS);
//     await _notifications.initialize(
//       settings,
//       onSelectNotification: (payload) async {
//         onNotification.add(payload);
//       },
//     );
//   }

//   static Future showScheduledNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//     TimeOfDay? time,
//     required int days,
//   }) async => 
//           _notifications.zonedSchedule(
//             id, 
//             title, 
//             body, 
//             _schedule(time,days),
//           await _notificationDetails(),
//           payload: payload,
//           androidAllowWhileIdle: true,
//           uiLocalNotificationDateInterpretation:
//               UILocalNotificationDateInterpretation.absoluteTime,
//           matchDateTimeComponents: DateTimeComponents.time);

//     static tz.TZDateTime _schedule(TimeOfDay? time, int? days) {
//     final now = tz.TZDateTime.now(tz.local);

//     final scheduleDate = tz.TZDateTime(tz.local, now.year, now.month, now.day,
//         time!.hour, time.minute);

//     return scheduleDate.isBefore(now) ? scheduleDate.add(Duration(days: days!)) : scheduleDate;
//   }

// }
