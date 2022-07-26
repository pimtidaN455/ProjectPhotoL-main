import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/Start/StartPage.dart';

class Personpage extends StatelessWidget {
  Start_page get context => Start_page();
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
                color: MyStyle().blackColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36)),
              ),
            ),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "pimtida promaut",
                    style: TextStyle(
                      color: MyStyle().whiteColor,
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
                      color: MyStyle().whiteColor,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ///////////// How to ///////////////
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: MyStyle().grayColor,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.book),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            "How to use",
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
                  ///////////// Setting ///////////////
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: MyStyle().grayColor,
                      onPressed: () {},
                      child: Row(
                        children: [
                          Icon(Icons.settings),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            "Setting",
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: FlatButton(
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: MyStyle().grayColor,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Start_page()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.key),
                          SizedBox(width: 20),
                          Expanded(
                              child: Text(
                            "Logout",
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
                  //Text("อ้ากกกกกกกกกกกกกกกกกกกกกกก")
                ])),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: MyStyle().blackColor,
      title: Text(
        "Profile",
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
}
