import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/HomePage.dart';
import 'package:project_photo_learn/page/PagesF/PagePerson/PersonPage2.dart';
import 'package:project_photo_learn/page/PagesF/SearchPage.dart';
import 'package:project_photo_learn/page/PagesF/PageClound/CloudPage.dart';

class FirstState extends StatefulWidget {
  //const FirstState({Key? key, required int count}) : super(key: key);
  int page;
  FirstState({required this.page});

  @override
  _FirstState createState() => _FirstState(index: page);
}

class _FirstState extends State<FirstState> {
  int index;
   _FirstState({required this.index});

  final Screen = [Homepage(), Searchpage(), Cloundpage(), Person_page1()];

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
