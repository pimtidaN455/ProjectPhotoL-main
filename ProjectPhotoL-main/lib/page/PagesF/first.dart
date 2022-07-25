//import 'dart:html';

//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:project_photo_learn/main.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/HomePage.dart';
import 'package:project_photo_learn/page/PagesF/PersonPage.dart';
import 'package:project_photo_learn/page/PagesF/SearchPage.dart';
import 'package:project_photo_learn/page/PagesF/Cloudpage.dart';

class FirstState extends StatefulWidget {
  const FirstState({Key? key}) : super(key: key);
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<FirstState> {
  int index = 0;
  final Screen = [
    /*Center(
        child: Text(
      'Home',
      style: TextStyle(fontSize: 72),
    )),*/
    Homepage(),
    Searchpage(),
    Cloundpage(),
    Personpage()
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
              //NavigationDestination(icon: Icon(Icons.search), label: "search"),
              NavigationDestination(icon: Icon(Icons.home), label: "home"),
              NavigationDestination(icon: Icon(Icons.search), label: "search"),
              NavigationDestination(icon: Icon(Icons.cloud), label: "cloud"),
              NavigationDestination(icon: Icon(Icons.person), label: "person"),
            ],
          )));
}
