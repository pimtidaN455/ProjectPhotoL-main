import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageSearch/SearchPage.dart';
import 'package:project_photo_learn/page/PagesF/PageSearch/tag_state.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

import '../../Backend/User_data.dart';

var suggestTag2 = ["Pizza", "Pasta", "Spagetti"];

class Add_Album_Page extends StatefulWidget {
  const Add_Album_Page({Key? key}) : super(key: key);
  @override
  Add_Album_PageState createState() => Add_Album_PageState();
}

class Add_Album_PageState extends State<Add_Album_Page> {
  late double screen;
  final controller = Get.put(TagStateController());
  TextEditingController Add_Name_SubJ = TextEditingController();
  TextEditingController Add_Keyword_SubJ = TextEditingController();
  //bool _isObscure = true;
  //สร้างตัวแปร fromKey
  final _fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Add Album",
              style: TextStyle(
                fontSize: 30,
                color: MyStyle().blackColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rajdhani',
              ),
            ),
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
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "\n   Name of subject",
              style: TextStyle(
                fontSize: 25,
                color: MyStyle().blackColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rajdhani',
              ),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                child: Form(
                  key: _fromKey,
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      AddNameSubJ(),
                    ],
                  ),
                )),
            Text(
              '   Add keyword',
              style: TextStyle(
                fontSize: 25,
                color: MyStyle().blackColor,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.normal,
                fontFamily: 'Rajdhani',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  controller: Add_Keyword_SubJ,
                  onEditingComplete: () {
                    controller.listTags.add(Add_Keyword_SubJ.text);
                    Add_Keyword_SubJ.clear();
                  },
                  autofocus: false,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Tag',
                    //contentPadding: EdgeInsets.symmetric(vertical: 2),
                    prefixIcon: Icon(Icons.tag),
                    suffixIcon: IconButton(
                      onPressed: () {
                        if (Add_Keyword_SubJ.text != "") {
                          controller.listTags.add(Add_Keyword_SubJ.text);
                        }
                        Add_Keyword_SubJ.clear();
                      },
                      icon: const Icon(Icons.add),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25)),
                  ),
                ),
                suggestionsCallback: (String pattern) {
                  return suggestTag2.where(
                      (e) => e.toLowerCase().contains(pattern.toLowerCase()));
                },
                onSuggestionSelected: (String suggestion) =>
                    controller.listTags.add(suggestion),
                itemBuilder: (BuildContext context, Object? itemData) {
                  return ListTile(
                    leading: Icon(Icons.tag),
                    title: Text(itemData.toString()),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "   # ที่คุณต้องการเพิ่ม ",
              style: TextStyle(
                fontSize: 20,
                color: MyStyle().blackColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Rajdhani',
              ),
            ),
            Obx(() => controller.listTags.length == 0
                ? Center(
                    child: Text('\n No tag'),
                  )
                : Wrap(
                    children: controller.listTags
                        .map((element) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Chip(
                                label: Text(element),
                                deleteIcon: Icon(Icons.clear),
                                onDeleted: () =>
                                    controller.listTags.remove(element),
                              ),
                            ))
                        .toList(),
                  )),
            buttonaddbum(),
          ])),
    );
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

  Container buttonaddbum() {
    return Container(
      margin: EdgeInsets.all(50.0),
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
