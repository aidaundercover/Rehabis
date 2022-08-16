import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/auth/sign_in.dart';
import 'package:rehabis/views/auth/sign_up.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children:[
              //   Container(
              //     height: height*0.76,
              //     width: width*0.8,
              //     decoration: BoxDecoration(
              //       image: DecorationImage(
              //         image: AssetImage("assets/first_bc.png"),
              //         fit: BoxFit.fill
              //       )
              //     ),
              //   ),
              //   SizedBox(
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Image.asset('assets/logo.png', width: 800,),
              //         const Text(
              //           "Start your recovery\nwith Rehabis!",
              //           textAlign: TextAlign.center,
              //           style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              //         ),
              //       ]),
              // ),
              ]
            ),
            GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Container(
                  width: width*0.15,
                  height: 40,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                ))
          ],
        ),
      ),
    );
  }
}
