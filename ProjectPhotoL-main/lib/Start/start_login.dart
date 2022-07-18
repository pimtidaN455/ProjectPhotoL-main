import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/Start/start_register.dart';
import 'package:project_photo_learn/main.dart';

class Startlogin extends StatefulWidget {
  const Startlogin({Key? key}) : super(key: key);
  @override
  _StartloginState createState() => _StartloginState();
}

class _StartloginState extends State<Startlogin> {
  late double screen;

  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();
  //สร้างตัวแปร fromKey
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
            },
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
        ),
        body: Center(
            child: Form(
          key: _fromKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.normal,
                  fontFamily: 'Rajdhani',
                ),
              ),
              Emaill(),
              Passwordd(),
              NextToHome(),
              Regis1(),
            ],
          ),
        )));
  }

  Container Emaill() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: Email,
        decoration: InputDecoration(
            labelText: 'E-mail',
            prefixIcon: Icon(Icons.email_outlined),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final emailRegex = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (value!.isEmpty) {
            return "Please enter Email";
          }
          if (emailRegex.hasMatch(value)) {
            return null;
          } else
            return "Please enter a valid email.";
        },
      ),
    );
  }

  Container Passwordd() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: Password,
        //maxLength: 25,
        decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.password),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final passwordRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>+-/]');
          if (value!.isEmpty) {
            return "Please enter Password.";
          }
          if (passwordRegex.hasMatch(value)) {
            return "Please enter a valid password.";
          }
          if (value.length < 6) {
            return "Password should be more than 6 characters.";
          }
          if (value.length > 25) {
            return "Password should not be greater than 25 charecters.";
          } else
            return null;
        },
      ),
    );
  }

  Container NextToHome() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () {
          print('--------------- Email and Password ---------------');
          bool validate = _fromKey.currentState!.validate();
          if (validate) {
            print(Email.text);
            print(Password.text);
          }
        },
        child: Text('Next'),
        style: ElevatedButton.styleFrom(
            primary: MyStyle().darkColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  InkWell Regis() {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Start_Register(),
          ),
        );
      },
      child: Text(
        ' Create Account',
        style: TextStyle(
          color: Color(0xFF4B39EF),
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }

  Container Regis1() {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 24),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
              color: Color.fromARGB(255, 56, 56, 56),
              fontSize: 15,
              fontFamily: 'Poppins',
            ),
          ),
          Regis()
        ],
      ),
    );
  }
}
