import 'package:flutter/material.dart';
import 'package:rehabis/globalVars.dart';
import 'package:rehabis/views/auth/sign_up.dart';

class FirstView extends StatelessWidget {
  const FirstView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', width: 800,),
            const Text(
              "Востанавливайся где угодно,\nкогда угодно!",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 24),
            ),
            const SizedBox(height: 200),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: Container(
                  width: 200,
                  height: 45,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                        primaryColor,
                        primaryColor.withOpacity(0.6),
                        Colors.purpleAccent.shade200
                    ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: const Text("Начать сейчас!",
                      style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                ))
          ]),
    );
  }
}
