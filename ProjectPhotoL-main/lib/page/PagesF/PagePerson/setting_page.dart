// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';
import 'package:project_photo_learn/re_name.dart';

import 'package:project_photo_learn/re_password.dart';

class setting_page extends StatefulWidget {
  var user;
  setting_page({required this.user});
  @override
  _setting_page createState() => _setting_page(user: user);
}

class _setting_page extends State<setting_page> {
  var user;
  _setting_page({required this.user});
  String title = 'AlertDialog';
  bool tappedYes = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: menu(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: MyStyle().whiteColor,
        ),
        onPressed: () {
          dynamic Request_page = FirstState(page: 3, user: user);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => (Request_page)));
        },
      ),
      backgroundColor: MyStyle().blackColor,
      title: Text(
        "Setting",
        style: TextStyle(
          fontSize: 30,
          color: MyStyle().whiteColor,
          fontWeight: FontWeight.bold,
          fontFamily: 'Rajdhani',
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  Container menu() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 1,
      child: Stack(
        children: <Widget>[
          Container(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                ///////////// name ///////////////
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: FlatButton(
                    padding: EdgeInsets.all(25),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color.fromARGB(255, 243, 243, 243),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResetName(nameuser: "pimtida")));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                            child: Text(
                          //"Name : \n" + user.Firstname + ' ' + user.Lastname,
                          "pimtida promaut",
                          style: TextStyle(
                            color: MyStyle().darkColor,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          ),
                        )),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: FlatButton(
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    color: Color.fromARGB(255, 243, 243, 243),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Resetpassword(pagere: "home", user: user)));
                    },
                    child: Row(
                      children: [
                        SizedBox(width: 20),
                        Expanded(
                            child: Text(
                          "Reset password",
                          style: TextStyle(
                            color: MyStyle().darkColor,
                            fontSize: 15,
                            fontFamily: 'Poppins',
                          ),
                        )),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
                ///////////// Logout ///////////////
              ])),
        ],
      ),
    );
  }
}
