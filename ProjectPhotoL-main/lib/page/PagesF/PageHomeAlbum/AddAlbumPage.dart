import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

import '../../Backend/User_data.dart';

class Add_Album_Page extends StatefulWidget {
  const Add_Album_Page({Key? key}) : super(key: key);
  @override
  Add_Album_PageState createState() => Add_Album_PageState();
}

class Add_Album_PageState extends State<Add_Album_Page> {
  late double screen;

  TextEditingController Add_Name_SubJ = TextEditingController();
  TextEditingController Add_Keyword_SubJ = TextEditingController();
  //bool _isObscure = true;
  //สร้างตัวแปร fromKey
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onPressed: () async {
              user_file user0 = new user_file();
              var user = await user0;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstState(
                            page: 0,
                            user: user,
                          )));
            },
          ),
          backgroundColor: MyStyle().whiteColor,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 30, 0, 0),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Name of subject',
                        style: TextStyle(
                          fontSize: 30,
                          color: MyStyle().blackColor,
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.normal,
                          fontFamily: 'Rajdhani',
                        ),
                      ),
                      AddNameSubJ(),
                      Text(
                        'Add keyword',
                        style: TextStyle(
                          fontSize: 30,
                          color: MyStyle().blackColor,
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.normal,
                          fontFamily: 'Rajdhani',
                        ),
                      ),
                      AddKeywordSubJ(),
                      buttonaddbum()
                    ],
                  ),
                ))));
  }

  Container AddNameSubJ() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: Add_Name_SubJ,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                Add_Name_SubJ.clear();
              },
              icon: const Icon(Icons.clear),
            ),
            labelText: 'Name of suject',
            //prefixIcon: Icon(Icons.email_outlined),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final Add_Name_SubJ = RegExp(r"^[a-zA-Zก-๏\s]");
          if (value!.isEmpty) {
            return "Please enter name of subject";
          }
          if (Add_Name_SubJ.hasMatch(value)) {
            return null;
          } else
            return "Please enter a-z A-Z 0-9 ก-ฮ ";
        },
      ),
    );
  }

  Container AddKeywordSubJ() {
    return Container(
      margin: EdgeInsets.only(top: 16, bottom: 16),
      width: screen * 0.8,
      child: TextFormField(
        controller: Add_Keyword_SubJ,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
            labelText: 'Add keyword',
            //prefixIcon: Icon(Icons.email_outlined),
            enabledBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(30))),
        validator: (value) {
          final Add_Keyword_SubJ = RegExp(r"^[a-zA-Zก-๏\s]");
          if (value!.isEmpty) {
            return "Please enter keyword";
          }
          if (Add_Keyword_SubJ.hasMatch(value)) {
            return null;
          } else
            return "Please enter a-z A-Z 0-9 ก-ฮ";
        },
      ),
    );
  }

  Container buttonaddbum() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      width: screen * 0.75,
      child: ElevatedButton(
        child: Text('Add Album'),
        onPressed: () async {
          print('--------------- Add Album ---------------');
          bool validate = _fromKey.currentState!.validate();
          if (validate) {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
                builder: (BuildContext context) => Add_Album_Page());
            Navigator.of(this.context).push(materialPageRoute);
          }
          print(Add_Name_SubJ.text);
          print(Add_Keyword_SubJ.text);
        },
        style: ElevatedButton.styleFrom(
            primary: MyStyle().blackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
