//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

class Cloundpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text(
            "Clound",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      );
}
