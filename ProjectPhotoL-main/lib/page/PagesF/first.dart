import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/HomePage.dart';
import 'package:project_photo_learn/page/PagesF/PagePerson/PersonPage2.dart';
import 'package:project_photo_learn/page/PagesF/SearchPage.dart';
import 'package:project_photo_learn/page/PagesF/Cloudpage.dart';

class FirstState extends StatefulWidget {
  const FirstState({Key? key}) : super(key: key);
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<FirstState> {
  int index = 0;
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
