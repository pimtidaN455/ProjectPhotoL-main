import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/Howto/HowtoList/howto1.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';
import 'package:project_photo_learn/page/Start/StartPage.dart';

import '../Backend/User_data.dart';

// ignore: must_be_immutable
class HowToUse2 extends StatefulWidget {
  //const HowToUse2({Key? key}) : super(key: key);
  String pagehow;
  HowToUse2({required this.pagehow});
  @override
  _HowtoWidgetState createState() => _HowtoWidgetState(pagehowto: pagehow);
}

class _HowtoWidgetState extends State<HowToUse2> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String pagehowto;
  _HowtoWidgetState({required this.pagehowto});
  dynamic Request_page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () async {
            user_file user0 = new user_file();
            var user = await user0;
            if (pagehowto == "startpage") {
              Request_page = Start_page();
            } else {
              Request_page = FirstState(
                page: 3,
                user: user,
              );
            }
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Request_page));
          },
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        automaticallyImplyLeading: false,
        title: Text(
          'How to use',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.normal,
            fontFamily: 'Rajdhani',
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Howto1().Widget(context),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      '1. Add Album',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        //fontStyle: FontStyle.normal,
                        fontFamily: 'Rajdhani',
                      ),
                    ),
                    subtitle: Text(
                      'Add a course album for use in separating images into various courses.',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        //fontStyle: FontStyle.normal,
                        fontFamily: 'Rajdhani',
                      ),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF303030),
                      size: 20,
                    ),
                    tileColor: Color(0xFFF5F5F5),
                    dense: false,
                  ),
                ),
                ListTile(
                  title: Text(
                    '2. Edit album',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  subtitle: Text(
                    'How to edit album title, keyword and course description.',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
                ListTile(
                  title: Text(
                    '3. Delete photo',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  subtitle: Text(
                    'Delete the desired photo from the album.',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
                ListTile(
                  title: Text(
                    '4. Move photos to another album.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  subtitle: Text(
                    'how to move photos to the desired album.',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
                ListTile(
                  title: Text(
                    '5. Edit personal information',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  subtitle: Text(
                    'how to change name change avatar.',
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                      //fontStyle: FontStyle.normal,
                      fontFamily: 'Rajdhani',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 20,
                  ),
                  tileColor: Color(0xFFF5F5F5),
                  dense: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
