import "package:flutter/material.dart";
import 'package:rehabis/globalVars.dart';





Widget buildTimeCard(String time, String header) {
      return Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                color: deepPurple, borderRadius: BorderRadius.circular(10)),
            alignment: Alignment.center,
            child: Text(
              time,
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            header,
            style: TextStyle(
              fontSize: 11,
            ),
          ),
        ],
      );
    }