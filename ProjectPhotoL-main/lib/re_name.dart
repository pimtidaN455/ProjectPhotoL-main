// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PagePerson/setting_page.dart';

class ResetName extends StatefulWidget {
  String nameuser;
  ResetName({required this.nameuser});
  @override
  _ResetNameState createState() => _ResetNameState(nameuser: nameuser);
}

class _ResetNameState extends State<ResetName> {
  String nameuser;
  _ResetNameState({required this.nameuser});
  late double screen;
  TextEditingController Namereset = TextEditingController();
  TextEditingController LastNamereset = TextEditingController();
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => setting_page(
                            user: nameuser,
                          )));
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
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        //if (!isKeyboard)
                        Text(
                          'Reset Name',
                          style: TextStyle(
                            fontSize: 40,
                            color: MyStyle().blackColor,
                            fontWeight: FontWeight.bold,
                            //fontStyle: FontStyle.normal,
                            fontFamily: 'Rajdhani',
                          ),
                        ),
                        FirstNameRe(),
                        LastNameRe(),
                        NextToReName(),
                      ],
                    ),
                    //mainAxisSize: MainAxisSize.min,
                  ),
                ))));
  }

  Container FirstNameRe() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: Namereset,
        decoration: InputDecoration(
            labelText: 'Firstname',
            prefixIcon: Icon(Icons.person),
            suffixIcon: IconButton(
              onPressed: () {
                Namereset.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final Namereset = RegExp(r"[A-Za-z]");
          if (value!.isEmpty) {
            return "Please enter Name";
          }
          if (Namereset.hasMatch(value)) {
            return null;
          } else
            return "ควย";
        },
      ),
    );
  }

  Container LastNameRe() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: LastNamereset,
        decoration: InputDecoration(
            labelText: 'Lastname',
            prefixIcon: Icon(Icons.person),
            suffixIcon: IconButton(
              onPressed: () {
                LastNamereset.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final LastNamereset = RegExp("[A-Za-z]");
          if (value!.isEmpty) {
            return "Please enter Lastname";
          }
          if (LastNamereset.hasMatch(value)) {
            return null;
          } else
            return "ควย.";
        },
      ),
    );
  }

  Container NextToReName() {
    return Container(
      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        onPressed: () async {
          bool validate = _fromKey.currentState!.validate();
          if (validate) {
            print('--------------- New Name ---------------');
            print(Namereset);
            print(LastNamereset);
            await showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('เปลี่ยนชื่อผู้ใช้เรียบร้อย'),
              ),
            );
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => setting_page(
                      user: "",
                    ));
            Navigator.of(this.context).push(materialPageRoute);
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
