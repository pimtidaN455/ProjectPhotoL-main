import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:project_photo_learn/my_style.dart';

class Import_Image_Cloud extends StatefulWidget {
  @override
  _MyAppState5 createState() => new _MyAppState5();
}

class _MyAppState5 extends State<Import_Image_Cloud> {
  List<Asset> images = <Asset>[];
  @override
  void initState() {
    super.initState();
  }

  Future<void> pickImages() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        materialOptions: MaterialOptions(
          actionBarTitle: "Gallery",
        ),
      );
    } on Exception catch (e) {
      print("/////////////////////////////");
      print(e);
      print("/////////////////////////////");
    }

    setState(() {
      images = resultList;
      print("******************************");
      print(images);
      print("******************************");
    });
  }

  @override
  Widget build(BuildContext context) {
    String namepic;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text(
            "Clound",
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.add,
                color: MyStyle().blackColor,
              ),
              onPressed: pickImages,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Edit ",
                  style: TextStyle(
                    fontSize: 20,
                    color: MyStyle().blackColor,
                    fontWeight: FontWeight.bold,
                    //fontStyle: FontStyle.normal,
                    fontFamily: 'Rajdhani',
                  ),
                ))
          ],
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: <Widget>[
            /*RaisedButton(
              child: Text("Pick images"),
              onPressed: pickImages,
            ),*/
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.all(8),
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  print("ชื่อรูปภาพที่ : ");
                  print(index);
                  print(images[index].name);
                  //print(rootBundle.loadString);
                  print("0000000000000000000000000");
                  return AssetThumb(
                    asset: asset,
                    width: 300,
                    height: 300,
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
