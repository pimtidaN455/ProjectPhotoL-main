import 'package:flutter/material.dart';

class Searchpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(children: <Widget>[
      AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(""),
        automaticallyImplyLeading: false,
      ),
      Container(
          height: size.height * 0.2,
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
                child: Row(children: <Widget>[
                  Text(
                    'Searchhh',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Rajdhani',
                    ),
                  )
                ]),
              ),
              Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 54, //ความสูงของกรอบเสิร์ช

                    //padding: EdgeInsetsDirectional.fromSTEB(50, 50, 50, 50),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 50,
                            color:
                                Color.fromARGB(255, 0, 0, 0).withOpacity(0.23),
                          )
                        ]),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search",
                                  hintStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.search),
                                    onPressed: () {},
                                  ))),
                        ),
                      ],
                    ),
                  ))
            ],
          )),
    ]);
  }
}
