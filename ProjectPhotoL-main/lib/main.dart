import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/Backend/User_data.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';
import 'package:project_photo_learn/page/Start/StartPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  user_file user = await new user_file();
  print("DDDDDDDDDDDDDDDDDDDDDDDDDD");
  print(await user.Firstname);
  print("DDDDDDDDDDDDDDDDDD");
  runApp(MyApp(
    user: await user,
  ));
}

class MyApp extends StatefulWidget {
  var user;
  MyApp({required this.user});
  @override
  State<MyApp> createState() => _MyAppState(user: user);
}

class _MyAppState extends State<MyApp> {
  var user;
  _MyAppState({required this.user});
  @override
  Widget build(BuildContext context) {
    //////////////////////////// รับสถานะเช็ค ///////////////////////////
    bool i = true;
    var page_material;
    //if (user.Login) {
    if (i) {
      page_material = FirstState(page: 0, user: user);
    } else {
      page_material = Start_page();
    }

    /* 
*/
    return MaterialApp(
      home: page_material,
    );
  }
}
