//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text(
            "Album",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit ",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.normal,
                    fontFamily: 'Rajdhani',
                  ),
                ))
          ],
          automaticallyImplyLeading: false,
        ),
        /*leading: TextButton(        
            child: Text(
              "Album",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.normal,
                fontFamily: 'Rajdhani',
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstState()));
            },
          ),*/

        /*
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 48),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Homepage',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 35,
                  fontFamily: 'Poppins',
                ))
          ]),
        ),*/
      );
}
