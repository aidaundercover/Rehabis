// //  import 'package:flutter/material.dart';

 
 
// _selectTime(BuildContext context) async {
//   final TimeOfDay? timeOfDay = await showTimePicker(
//     context: context,
//     initialTime: time,
//     initialEntryMode: TimePickerEntryMode.dial,
//     builder: (context, child) {
//       return Theme(
        // data: ThemeData.light().copyWith(
        //   colorScheme: ColorScheme.light(
        //     // change the border color
        //     primary: primaryColor,
        //     // change the text color
        //     onSurface: deepPurple,
        //   ),
        // ),
//         child: Container(),
//       );
//     },
//   );
//   if (timeOfDay != null && timeOfDay != time) {
//     setState(() {
//       time = timeOfDay;
//     });
//   }
// }
 
// //  Center(
// //                 child: TextButton(
// //                     onPressed: () {
// //                       showDialog(
// //                           context: context,
// //                           builder: (_) {
// //                             return Dialog(
// //                               child: Container(
// //                                 width: width * 0.8,
// //                                 height: 250,
// //                                 decoration: BoxDecoration(
// //                                     color: Colors.white,
// //                                     borderRadius: BorderRadius.circular(20)),
// //                                 alignment: Alignment.center,
// //                                 child: SizedBox(
// //                                   width: width * 0.76,
// //                                   child: Column(
// //                                     mainAxisAlignment:
// //                                         MainAxisAlignment.spaceEvenly,
// //                                     children: [
// //                                       Text(
// //                                         "Я хочу получать уведомление на выполнения упражнений",
// //                                         style: TextStyle(
// //                                             color: deepPurple,
// //                                             fontSize: 16,
// //                                             fontFamily: 'Ruberoid'),
// //                                       ),
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.center,
// //                                         children: [
// //                                           Text(
// //                                             "Каждые ",
// //                                             style: TextStyle(
// //                                                 color: deepPurple,
// //                                                 fontSize: 22,
// //                                                 fontWeight: FontWeight.bold),
// //                                           ),
// //                                           Container(
// //                                             width: width * 0.1,
// //                                             height: width * 0.1,
// //                                             decoration: BoxDecoration(
// //                                                 borderRadius:
// //                                                     BorderRadius.circular(10)),
// //                                             child: TextFormField(
// //                                               keyboardType:
// //                                                   TextInputType.number,
// //                                               validator: (value) {
// //                                                 try {
// //                                                   int.parse(days.text);
// //                                                 } catch (e) {
// //                                                   days = TextEditingController(
// //                                                       text: "");
// //                                                   Fluttertoast.showToast(
// //                                                       msg:
// //                                                           "Указываете дни численно");
// //                                                 }
// //                                                 return null;
// //                                               },
// //                                               style: TextStyle(
// //                                                   fontSize: 18,
// //                                                   fontWeight: FontWeight.bold),
// //                                               decoration: const InputDecoration(
// //                                                 filled: true,
// //                                                 fillColor: Color.fromARGB(
// //                                                     255, 226, 225, 225),
// //                                                 border: OutlineInputBorder(
// //                                                   borderSide: BorderSide.none,
// //                                                   borderRadius:
// //                                                       BorderRadius.all(
// //                                                           Radius.circular(0)),
// //                                                 ),
// //                                               ),
// //                                             ),
// //                                           )
// //                                         ],
// //                                       ),
// //                                       Row(
// //                                         mainAxisAlignment:
// //                                             MainAxisAlignment.center,
// //                                         children: [
// //                                           Text(
// //                                             "В ",
// //                                             style: TextStyle(
// //                                                 color: deepPurple,
// //                                                 fontSize: 22,
// //                                                 fontWeight: FontWeight.bold),
// //                                           ),
// //                                           GestureDetector(
// //                                             onTap: () {
// //                                               _selectTime(context);
// //                                             },
// //                                             child: Row(
// //                                               children: [
// //                                                 Container(
// //                                                   width: width * 0.1,
// //                                                   height: width * 0.1,
// //                                                   decoration: BoxDecoration(
// //                                                       borderRadius:
// //                                                           BorderRadius.circular(
// //                                                               10),
// //                                                       color: deepPurple),
// //                                                   alignment: Alignment.center,
// //                                                   child: Text(
// //                                                     '${time.hour}',
// //                                                     style: TextStyle(
// //                                                         color: Colors.white,
// //                                                         fontWeight:
// //                                                             FontWeight.bold,
// //                                                         fontSize: 20),
// //                                                   ),
// //                                                 ),
// //                                                 SizedBox(width: 5),
// //                                                 Container(
// //                                                   width: width * 0.1,
// //                                                   height: width * 0.1,
// //                                                   decoration: BoxDecoration(
// //                                                       borderRadius:
// //                                                           BorderRadius.circular(
// //                                                               10),
// //                                                       color: deepPurple),
// //                                                   alignment: Alignment.center,
// //                                                   child: Text(
// //                                                     '${time.minute}',
// //                                                     style: TextStyle(
// //                                                         color: Colors.white,
// //                                                         fontWeight:
// //                                                             FontWeight.bold,
// //                                                         fontSize: 20),
// //                                                   ),
// //                                                 ),
// //                                               ],
// //                                             ),
// //                                           ),
// //                                         ],
// //                                       ),
// //                                       TextButton(
// //                                           onPressed: () {
// //                                             // NotificationApi.showScheduledNotification(
// //                                             //     title: "Пора размяться!",
// //                                             //     body:
// //                                             //         "Хэй, реабилитация пройдет быстрее чем интенсивнее и чаще вы будете совершать упражнения и следовать рекомендациям",
// //                                             //     time: time,
// //                                             //     days: int.parse(days.text));
// //                                             Navigator.of(context).pop();
// //                                           },
// //                                           child: Container(
// //                                             width: width * 0.3,
// //                                             height: 30,
// //                                             decoration: BoxDecoration(
// //                                                 color: primaryColor,
// //                                                 borderRadius:
// //                                                     BorderRadius.circular(10)),
// //                                             alignment: Alignment.center,
// //                                             child: Text(
// //                                               "Установить",
// //                                               style: TextStyle(
// //                                                   color: Colors.white,
// //                                                   fontSize: 16),
// //                                             ),
// //                                           ))
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ),
// //                             );
// //                           });
// //                     },
// //                     child: Container(
// //                       width: width * 0.45,
// //                       height: 40,
// //                       decoration: BoxDecoration(
// //                           color: primaryColor,
// //                           borderRadius: BorderRadius.circular(15),
// //                           boxShadow: [
// //                             BoxShadow(
// //                                 color: Colors.black.withOpacity(0.2),
// //                                 offset: Offset(3, 3),
// //                                 blurRadius: 6)
// //                           ]),
// //                       alignment: Alignment.center,
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                         children: [
// //                           Icon(
// //                             Icons.alarm,
// //                             color: Colors.white,
// //                           ),
// //                           const Text(
// //                             "Настроить",
// //                             style: TextStyle(
// //                                 color: Color.fromARGB(255, 254, 254, 254),
// //                                 fontSize: 19),
// //                           ),
// //                           SizedBox(
// //                             width: 6,
// //                           )
// //                         ],
// //                       ),
// //                     )),
// //               );