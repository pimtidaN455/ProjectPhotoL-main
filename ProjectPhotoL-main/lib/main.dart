import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';
import 'package:project_photo_learn/page/Start/StartPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //////////////////////////// รับสถานะเช็ค ///////////////////////////
    bool i = true;
    var page_material;

    if (i) {
      page_material = FirstState();
    } else {
      page_material = Start_page();
    }

    return MaterialApp(
      home: page_material,
    );
  }
}
