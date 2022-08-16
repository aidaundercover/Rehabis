import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/utils/local_db.dart';
import 'package:rehabis/views/auth/sign_in.dart';
import 'package:rehabis/views/auth/sign_up.dart';
import 'package:rehabis/views/face_recognition/camera_sign_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return FaceScanScreenSignIn(user: LocalDB.getUser(),);
  }
}

// class SignIn extends StatefulWidget {
//   const SignIn({Key? key}) : super(key: key);

//   @override
//   State<SignIn> createState() => _SignInState();
// }

// class _SignInState extends State<SignIn> {
//   TextEditingController iin = TextEditingController(text: "");
//   TextEditingController password = TextEditingController(text: "");

//   bool _obscureText = true;

//   void _toggle() {
//     setState(() {
//       _obscureText = !_obscureText;
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     iin = TextEditingController(text: "");
//     password = TextEditingController(text: "");
//   }

//   @override
//   Widget build(BuildContext context) {
//     var width = MediaQuery.of(context).size.width;
//     var height = MediaQuery.of(context).size.height;

//     TextStyle titleStyle = TextStyle(
//         fontSize: 15, color: Colors.grey.shade600, fontFamily: "Roboto");

//     TextStyle fieldStyle = TextStyle(
//         fontSize: 17, color: Colors.grey.shade900, fontFamily: "Roboto");

//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Center(
//         child: SizedBox(
//           width: width * 0.82,
//           height: height,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Вход",
//                     style: TextStyle(
//                         fontFamily: "Roboto",
//                         fontSize: 39,
//                         color: primaryColor,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Рады вам снова!",
//                     style: TextStyle(
//                         fontFamily: "Roboto",
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.grey.shade600),
//                   ),
//                 ],
//               ),
//               Theme(
//                 data: ThemeData.light().copyWith(
//                   colorScheme: ColorScheme.light(
//                     // change the border color
//                     primary: primaryColor,
//                     // change the text color
//                   ),
//                 ),
//                 child: Form(
//                     child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text("ИИН", style: titleStyle),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                               width: 1.0, color: Colors.grey.shade200),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: iin,
//                         keyboardType: TextInputType.number,
//                         validator: (value) {},
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Text("Пароль", style: titleStyle),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border(
//                           bottom: BorderSide(
//                               width: 1.0, color: Colors.grey.shade200),
//                         ),
//                       ),
//                       child: TextFormField(
//                         controller: password,
//                         obscureText: _obscureText,
//                         validator: (value) {
//                           if (password.text.length < 6) {
//                             return "Пароль должен содержать минимум 6 символов";
//                           }

//                           if (password.text.contains(1.toString()) ||
//                               password.text.contains(2.toString()) ||
//                               password.text.contains(3.toString()) ||
//                               password.text.contains(4.toString()) ||
//                               password.text.contains(5.toString()) ||
//                               password.text.contains(6.toString()) ||
//                               password.text.contains(7.toString()) ||
//                               password.text.contains(8.toString()) ||
//                               password.text.contains(9.toString())) {
//                           } else
//                             return "Пароль должен содержать минимум 1 цифру";

//                           // if (password.text.length < 6) {
//                           //   return "Пароль должен содержать минимум 6 символов";
//                           // }
//                         },
//                         style: fieldStyle,
//                         decoration: InputDecoration(
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                                 _obscureText
//                                     ? Icons.visibility_off
//                                     : Icons.visibility,
//                                 size: 19),
//                             color: Color.fromRGBO(168, 168, 168, 1.0),
//                             onPressed: _toggle,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Center(
//                       child: TextButton(
//                           onPressed: () async {
//                             if (iin.text.isEmpty || password.text.isEmpty) {
//                               Fluttertoast.showToast(
//                                   msg: "Не все поля были заполнены!");
//                             } else {
//                               try {

//                                 Navigator.of(context).push(
//                                           MaterialPageRoute(
//                                               builder: (context) => Main()));
                                      // FirebaseDatabase.instance
                                      //     .ref()
                                      //     .child("Users/${iin.text}/Name")
                                      //     .onValue
                                      //     .listen((value) => {
                                      //           nameGlobal = value
                                      //               .snapshot.value
                                      //               .toString()
                                      //         });
                                      //   iinGlobal = iin.text;
//                                 // FirebaseDatabase.instance
//                                 //     .ref()
//                                 //     .child("Users/${iin.text}/Password")
//                                 //     .onValue
//                                 //     .listen((event) {
//                                 //   final String pass =
//                                 //       event.snapshot.value.toString();
//                                 //   setState(() {
//                                 //     if (pass == password.text) {
                                

//                                 //       print("everything great");

//                                 //       Navigator.of(context).push(
//                                 //           MaterialPageRoute(
//                                 //               builder: (context) => Main()));
//                                 //       FirebaseDatabase.instance
//                                 //           .ref()
//                                 //           .child("Users/${iin.text}/Name")
//                                 //           .onValue
//                                 //           .listen((value) => {
//                                 //                 nameGlobal = value
//                                 //                     .snapshot.value
//                                 //                     .toString()
//                                 //               });
//                                 //     } else {
//                                 //       password.text = "";
//                                 //       iin.text = "";
//                                 //       Fluttertoast.showToast(
//                                 //           msg: "Пароль неверный");
//                                 //     }
//                                 //   });
//                                 // });

//                                 // nameGlobal = ref["Name"];
//                               } catch (e) {
//                                 password.text = "";
//                                 iin.text = "";
//                                 Fluttertoast.showToast(msg: "ИИН неверный");
//                                 print(e.toString());
//                               }

//                               // ignore: use_build_context_synchronously
//                             }
//                           },
//                           child: Container(
//                               width: width * 0.5,
//                               height: 42,
//                               decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: primaryColor,
//                                   boxShadow: [
//                                     BoxShadow(
//                                         offset: Offset(3, 3),
//                                         color: Colors.black.withOpacity(0.1),
//                                         blurRadius: 5),
//                                     BoxShadow(
//                                         offset: Offset(-3, -3),
//                                         color: Colors.black.withOpacity(0.1),
//                                         blurRadius: 5)
//                                   ]),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 "Войти",
//                                 style: TextStyle(
//                                     color: Colors.white, fontSize: 15.5),
//                               ))),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Center(
//                       child: GestureDetector(
//                         onTap: () {
//                           Navigator.of(context).push(
//                               MaterialPageRoute(builder: (_) => SignUp()));
//                         },
//                         child: Column(
//                           children: [
//                             Text("Еще нет аккаунта?",
//                                 style: TextStyle(
//                                   color: primaryColor,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                             Text(
//                               "Зарегистрируйтесь.",
//                               style: TextStyle(
//                                 color: primaryColor,
//                                 fontSize: 14,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 )),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }

