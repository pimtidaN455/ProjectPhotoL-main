import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileState extends StatefulWidget {
  const ProfileState({Key? key}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfileState> {
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      //Icon(Icons.favorite, size: 30),
      //Icon(Icons.settings, size: 30),
      Icon(Icons.cloud, size: 30),
      Icon(Icons.person, size: 30),
    ];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: CurvedNavigationBar(
        items: items,
      ),
      
    );
  }
}
