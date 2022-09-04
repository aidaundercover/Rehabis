import 'package:flutter/material.dart';
import 'package:rehabis/main.dart';
import 'package:rehabis/views/auth/sign_in.dart';
import 'package:rehabis/views/auth/sign_up.dart';

class CameraHeader extends StatelessWidget {
  const CameraHeader(this.title, {Key? key, required this.onBackPressed, required this.text}) : super(key: key);
  final String title;
  final void Function()? onBackPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[Colors.black, Colors.transparent],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onBackPressed,
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 50,
              width: 50,
              child: const Center(child: Icon(Icons.arrow_back)),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => text == 'Sign In' ?
                        SignIn(cameraDescription: cameraDescription) : SignUp(cameraDescription: cameraDescription)));
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(text, style: TextStyle(color: Colors.white.withOpacity(0.7), fontFamily: "Inter", fontSize: 16, decoration: TextDecoration.underline)),
              ))
        ],
      ),
    );
  }
}
