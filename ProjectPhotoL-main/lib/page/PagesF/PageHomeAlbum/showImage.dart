import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/HomePage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';

class ShowImage extends StatelessWidget {
  @override
  var name;
  ShowImage({this.name});

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Homepage()));
            },
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text(
            this.name,
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        //body: AlbumScreenWidget(),
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
