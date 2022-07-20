import 'dart:html';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstState extends StatefulWidget {
  const FirstState({Key? key}) : super(key: key);
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<FirstState> {
  int index = 0;
  final Screen = [
    Center(
        child: Text(
      'Home',
      style: TextStyle(fontSize: 72),
    )),
    Center(
        child: Text(
      'search',
      style: TextStyle(fontSize: 72),
    )),
    Center(
        child: Text(
      'cloud',
      style: TextStyle(fontSize: 72),
    )),
    Center(
        child: Text(
      'person',
      style: TextStyle(fontSize: 72),
    ))
  ];

  Widget build(BuildContext context) => Scaffold(
      body: Screen[index],
      bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
              //indicatorColor: Colors.black,
              labelTextStyle:
                  MaterialStateProperty.all(TextStyle(fontSize: 14))),
          child: NavigationBar(
            height: 60,
            //backgroundColor: Colors.blue,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),

            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "home"),
              NavigationDestination(icon: Icon(Icons.search), label: "search"),
              NavigationDestination(icon: Icon(Icons.cloud), label: "cloud"),
              NavigationDestination(icon: Icon(Icons.person), label: "person"),
            ],
          )));
}
