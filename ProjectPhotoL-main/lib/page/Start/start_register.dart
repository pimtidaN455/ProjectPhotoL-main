import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/main.dart';
import 'package:project_photo_learn/page/Start/start_login.dart';

class Start_Register extends StatefulWidget {
  const Start_Register({Key? key}) : super(key: key);
  @override
  _StartRegisterState createState() => _StartRegisterState();
}

class _StartRegisterState extends State<Start_Register> {
  late double screen;

  TextEditingController EmailRe = TextEditingController();
  TextEditingController PasswordRe = TextEditingController();
  TextEditingController ConPasswordRe = TextEditingController();
  TextEditingController FirstNameRe = TextEditingController();
  TextEditingController LastNameRe = TextEditingController();
  //สร้างตัวแปร fromKey
  final _fromKey = GlobalKey<FormState>();

  @override
  bool _isObscure = true;

  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Startlogin()));
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
                'Create Account',
                style: TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.normal,
                  fontFamily: 'Rajdhani',
                ),
              ),
              FirstName(),
              LastName(),
              Emailre(),
              PassWordre(),
              conFP(),
              NextToHome(),
            ],
          ),
        )));
  }

  Container NextToHome() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        child: Text('Next'),
        onPressed: () {
          print('--------------- Email and Password ---------------');
          bool validate = _fromKey.currentState!.validate();
          if (validate) {
            print(FirstNameRe.text);
            print(LastNameRe.text);
            print(EmailRe.text);
            print(PasswordRe.text);
            print(ConPasswordRe.text);
          }
        },
        style: ElevatedButton.styleFrom(
            primary: MyStyle().darkColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }

  Container FirstName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: FirstNameRe,
        //maxLength: 30, //รับไม่เกิน 30 ตัว
        decoration: InputDecoration(
            labelText: 'FirstName',
            prefixIcon: Icon(Icons.perm_identity),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter FirstName.";
          } else if (value.length < 3) {
            return "FirstName should be more than 3 characters.";
          } else if (value.length > 30) {
            return "FirstName should not be greater than 30 charecters.";
          } else
            return null;
        },
      ),
    );
  }

  Container LastName() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: LastNameRe,
        //maxLength: 30,
        decoration: InputDecoration(
            labelText: 'LastName',
            prefixIcon: Icon(Icons.perm_identity),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          if (value!.isEmpty) {
            return "Please enter LastName.";
          } else if (value.length < 3) {
            return "LastName should be more than 3 characters.";
          } else if (value.length > 30) {
            return "LastName should not be greater than 30 charecters.";
          } else
            return null;
        },
      ),
    );
  }

  Container Emailre() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: EmailRe,
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

  Container PassWordre() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: PasswordRe,
        //maxLength: 25,
        obscureText: _isObscure,
        decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: Icon(Icons.password),
            suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
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

  Container conFP() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: ConPasswordRe,
        //maxLength: 25,
        obscureText: _isObscure,
        decoration: InputDecoration(
            labelText: 'Confirm password',
            prefixIcon: Icon(Icons.password),
            suffixIcon: IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                }),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final confirmPass = RegExp(PasswordRe.text);
          if (value!.isEmpty) {
            return "Please enter Password.";
          }
          if (value.length < 6) {
            return "Password should be more than 6 characters.";
          }
          if (value.length > 25) {
            return "Password should not be greater than 25 charecters.";
          }
          if (confirmPass.hasMatch(value)) {
            return null;
          } else
            return "Password does not match";
        },
      ),
    );
  }
}