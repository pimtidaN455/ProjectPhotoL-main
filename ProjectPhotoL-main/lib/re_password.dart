import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';
import 'package:project_photo_learn/page/Start/start_login.dart';

class Resetpassword extends StatefulWidget {
  //const Resetpassword({Key? key}) : super(key: key);
  String pagere;
  Resetpassword({required this.pagere});
  @override
  _ResetpasswordState createState() => _ResetpasswordState(pagereset: pagere);
}

class _ResetpasswordState extends State<Resetpassword> {
  String pagereset;
  _ResetpasswordState({required this.pagereset});

  dynamic Request_page = FirstState(page: 3);

  late double screen;
  TextEditingController Emailrepass = TextEditingController();
  bool _isObscure = true;
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              if (pagereset == "login") {
                Request_page = Startlogin();
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Request_page));
            },
          ),
          backgroundColor: MyStyle().blackColor,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Reset password',
                        style: TextStyle(
                          fontSize: 50,
                          color: MyStyle().blackColor,
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.normal,
                          fontFamily: 'Rajdhani',
                        ),
                      ),
                      Emailre(),
                      NextToLogin(),
                    ],
                  ),
                ))));
  }

  Container Emailre() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: Emailrepass,
        decoration: InputDecoration(
            labelText: 'E-mail',
            prefixIcon: Icon(Icons.email_outlined),
            suffixIcon: IconButton(
              onPressed: () {
                Emailrepass.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final emailRegex = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (value!.isEmpty) {
            return "Please enter Email for repassword";
          }
          if (emailRegex.hasMatch(value)) {
            return null;
          } else
            return "Please enter a valid email.";
        },
      ),
    );
  }

  Container NextToLogin() {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () {
          print('--------------- Email ---------------');
          bool validate = _fromKey.currentState!.validate();
          if (validate) {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => Startlogin());
            Navigator.of(this.context).push(materialPageRoute);
            print(Emailrepass.text);
          }
        },
        child: Text(
          'Next',
          style: TextStyle(
            fontSize: 20,
            color: MyStyle().whiteColor,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.normal,
            fontFamily: 'Rajdhani',
          ),
        ),
        style: ElevatedButton.styleFrom(
            primary: MyStyle().blackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
