//import 'dart:html';
// ignore_for_file: deprecated_member_use

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//import 'package:project_photo_learn/page/PagesF/first.dart';

class Personpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        height: size.height * 1,
        //alignment: Alignment.topCenter,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 56),
              height: size.height * 0.2 - 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
              ),
            ),
            Container(
              //height: 60,
              //bottom: 0,
              //left: 0,
              //right: 0,
              child: Container(
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                //height: 54, //ความสูงของกรอบเสิร์ช
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    /*Container(
                      margin: EdgeInsets.only(bottom: 10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/Profile.jpg'))),
                    ),*/

                    /*Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: FlatButton(
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: Color.fromARGB(255, 223, 224, 226),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(Icons.settings),
                            SizedBox(width: 20),
                            Expanded(
                                child: Text(
                              "Setting",
                              style: TextStyle(
                                color: Color.fromARGB(255, 41, 41, 41),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                              ),
                            )),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    )*/
                    //howtoPersonP(),
                    //settingPersonP()
                  ],
                ),
              ),
            ),
            Container(
                //padding: EdgeInsets.only(left: 20, right: 20, bottom: 56),
                //height: size.height * 0.2 - 60,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "pimtida promaut",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "noey.caramel@gmail.com",
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  howtoPersonP(),
                  settingPersonP(),
                  Text("pdfkiogdrf,gvpoli,derfgved")
                ])),
          ],
        ),
      ),
    );
  }

  Padding settingPersonP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Color.fromARGB(255, 223, 224, 226),
        onPressed: () {},
        child: Row(
          children: [
            Icon(Icons.settings),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              "Setting",
              style: TextStyle(
                color: Color.fromARGB(255, 41, 41, 41),
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            )),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }

  Padding howtoPersonP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        color: Color.fromARGB(255, 223, 224, 226),
        onPressed: () {},
        child: Row(
          children: [
            Icon(Icons.book),
            SizedBox(width: 20),
            Expanded(
                child: Text(
              "How to use",
              style: TextStyle(
                color: Color.fromARGB(255, 41, 41, 41),
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            )),
            Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,

      title: Text(
        "Profile",
        style: TextStyle(
          fontSize: 30,
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.bold,
          //fontStyle: FontStyle.normal,
          fontFamily: 'Rajdhani',
        ),
      ),
      //centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
