import 'dart:html';
import 'package:flutter/material.dart';

class Personpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Personpage',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 35,
                  fontFamily: 'Poppins',
                ))
          ]),
        ),
      );
}
