import 'package:flutter/material.dart';
import 'package:rehabis/views/face_recognition/camera_sign_up.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return FaceScanScreenSignUp();
  }
}

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController name = TextEditingController(text: "");
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
//     name = TextEditingController(text: "");
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
//                     "Добро пожаловать!",
//                     style: TextStyle(
//                         fontFamily: "Roboto",
//                         fontSize: 36,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     "Зарегистрируйся в Rehabis.",
//                     style: TextStyle(
//                         fontFamily: "Roboto",
//                         fontSize: 23,
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
//                     Text("Имя", style: titleStyle),
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
//                         controller: name,
//                         validator: (value) {},
//                       ),
//                     ),
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

//                           if (password.text.contains(1.toString()) || password.text.contains(2.toString()) || password.text.contains(3.toString()) || password.text.contains(4.toString()) || password.text.contains(5.toString()) || password.text.contains(6.toString()) || password.text.contains(7.toString()) || password.text.contains(8.toString()) || password.text.contains(9.toString())) {
                            
//                           } else return "Пароль должен содержать минимум 1 цифру";

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
//                     Text(
//                       "Пароль должен содержать как минимум 1 заглавную букву, одну цифру и не менее 6 символов",
//                       style: TextStyle(
//                           fontSize: 13,
//                           color: Colors.grey.shade600,
//                           fontFamily: "Roboto"),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Center(
//                       child: TextButton(
//                           onPressed: () async {
                            // if (name.text.isEmpty ||
                            //     iin.text.isEmpty ||
                            //     password.text.isEmpty) {
                            //   Fluttertoast.showToast(
                            //       msg: "Не все поля были заполнены!");
                            // } else {
                            //   nameGlobal = name.text;
                            //   iinGlobal = iin.text;

                              // DatabaseReference ref = FirebaseDatabase.instance
                              //     .ref().child("Users/$iinGlobal/");

                              // await ref.set({
                              //   "Name": nameGlobal,
                              //   "Iin": iinGlobal,
                              //   "Password": password.text,
                              //   "MedicalData": {
                              //     "Born" : DateTime.now().toString(),
                              //     "Gender" : "Unknown",
                              //     "Height" : 0,
                              //     "Weight" : 0,
                              //     "StrokeType" : "Unknown",
                              //   },
                              //   "Trainings" : {
                              //     "registration_time" : {
                              //       "BodyPart" : "Cube",
                              //       "Count" : 0,
                              //       "Date" : DateTime.now().toString(),
                              //       "Type" : "Type1"
                              //     }
                              //   }
                              // });

//                               // ignore: use_build_context_synchronously
//                               Navigator.of(context).push(
//                                   MaterialPageRoute(builder: (_) => Main()));
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
//                                 "Зарегистрироваться",
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
//                               MaterialPageRoute(builder: (_) => SignIn()));
//                         },
//                         child: Column(
//                           children: [
//                             Text("Уже есть аккаунт?",
//                                 style: TextStyle(
//                                   color: primaryColor,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 )),
//                             Text(
//                               "Войдите.",
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
