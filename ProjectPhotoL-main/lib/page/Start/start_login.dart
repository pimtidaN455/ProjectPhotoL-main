//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/Start/start_register.dart';
import 'package:project_photo_learn/main.dart';
import 'package:project_photo_learn/page/first.dart';
import 'package:project_photo_learn/page/profile.dart';
import 'package:project_photo_learn/re_password.dart';

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
              forgetPass(),
              Text(
                '\n----------------------------------------------------------------------\n\n',
                style: TextStyle(
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
              ),
              Regis(),
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
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () {
          print('--------------- Email and Password ---------------');
          bool validate = _fromKey.currentState!.validate();
          if (validate) {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => FirstState());
            Navigator.of(this.context).push(materialPageRoute);
            print(Email.text);
            print(Password.text);
          }
        },
        child: Text(
          'Next',
          style: TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.normal,
            fontFamily: 'Rajdhani',
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: MyStyle().darkColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  /*InkWell Regis() {
    return InkWell(
        onTap: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Start_Register(),
            ),
          );
        },
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
              Text(
                ' Create Account',
                style: TextStyle(
                  color: Color.fromARGB(255, 227, 32, 87),
                  fontSize: 20,
                  fontFamily: 'Poppins',
                ),
              ),
            ]));
  }*/

  Container Regis() {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
          TextButton(
            child: Text(
              'Create Account',
              style: TextStyle(
                color: Color.fromARGB(255, 80, 13, 204),
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => Start_Register());
              Navigator.of(this.context).push(materialPageRoute);
            },
          )
        ],
      ),
    );
  }

  /*InkWell forgetP() {
    return InkWell(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Resetpassword(),
          ),
        );
      },
      child: Text(
        ' Reset password',
        style: TextStyle(
          color: Color(0xFF4B39EF),
          fontSize: 20,
          fontFamily: 'Poppins',
        ),
      ),
    );
  }*/

  Container forgetPass() {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'forgot password?',
            style: TextStyle(
              color: Color.fromARGB(255, 56, 56, 56),
              fontSize: 15,
              fontFamily: 'Poppins',
            ),
          ),
          TextButton(
            child: Text(
              'Reset password',
              style: TextStyle(
                color: Color.fromARGB(255, 80, 13, 204),
                fontSize: 15,
                fontFamily: 'Poppins',
              ),
            ),
            onPressed: () {
              MaterialPageRoute materialPageRoute = MaterialPageRoute(
                  builder: (BuildContext context) => Start_Register());
              Navigator.of(this.context).push(materialPageRoute);
            },
          )
        ],
      ),
    );
  }
}
