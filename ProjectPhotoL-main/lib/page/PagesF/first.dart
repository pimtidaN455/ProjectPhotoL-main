import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageClound/Importpic2.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/HomePage.dart';
import 'package:project_photo_learn/page/PagesF/PagePerson/PersonPage2.dart';
import 'package:project_photo_learn/page/PagesF/PageSearch/SearchPage.dart';
import 'package:project_photo_learn/page/PagesF/PageClound/CloudPage.dart';

// ignore: must_be_immutable
class FirstState extends StatefulWidget {
  //const FirstState({Key? key, required int count}) : super(key: key);
  int page;
  var user;
  FirstState({required this.page, required this.user});

  @override
  _FirstState createState() => _FirstState(index: page, user: user);
}

class _FirstState extends State<FirstState> {
  int index;
  var user;

  _FirstState({required this.index, required this.user});

  Widget build(BuildContext context) {
    final Screen = [
      Homepage(user: user),
      Searchpage(),
      Import_Image_Cloud(),
      Person_page1(user: user)
    ];

    return Scaffold(
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
                NavigationDestination(
                    icon: Icon(Icons.search), label: "search"),
                NavigationDestination(icon: Icon(Icons.cloud), label: "cloud"),
                NavigationDestination(
                    icon: Icon(Icons.person), label: "person"),
              ],
            )));
  }
}
