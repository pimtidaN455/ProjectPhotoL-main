import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/Start/start_register.dart';
import 'package:project_photo_learn/main.dart';

class Resetpassword extends StatefulWidget {
  const Resetpassword({Key? key}) : super(key: key);
  @override
  _ResetpasswordState createState() => _ResetpasswordState();
}

class _ResetpasswordState extends State<Resetpassword> {
  late double screen;

  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  //สร้างตัวแปร fromKey
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
