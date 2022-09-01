// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImagePage.dart';
import 'dart:io';
import 'Utility.dart';
import 'DBHelper.dart';
import 'Photo.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';

//เลือกได้ทีละภาพ เอาใส่ sqlite database ได้แล้ว
class SaveImageDemoSQLite2 extends StatefulWidget {
  SaveImageDemoSQLite2() : super();

  final String title = "Clound";

  @override
  _SaveImageDemoSQLiteState2 createState() => _SaveImageDemoSQLiteState2();
}

class _SaveImageDemoSQLiteState2 extends State<SaveImageDemoSQLite2> {
  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  //สร้าง file
  late Future<File> imageFile;
  //สร้าง ตัวแปรรับรูป
  late Image image;
  //คลังเก็บข้อมูล
  late DBHelper dbHelper;
  // ลิสเก็บรูปภาพ
  late List<Photo> images;

  late int Idphoto = 0;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
    print(images);
  }

  refreshImages() {
    dbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
    });
  }

  pickImageFromGallery(int idphoto) async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);

      for (var item in imageFileList!) {
        print("////////////////////////////");
        print(item.name);
        print(item.path);
        print("////////////////////////////");
        String imgString = Utility.base64String(await item.readAsBytes());
        Photo photo = Photo(1, imgString);
        print(imgString);
        print("////////////////////////////");
        dbHelper.save(photo);
        refreshImages();
      }
    }
    /*ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      String imgString = Utility.base64String(imgFile!.readAsBytesSync());
      Photo photo = Photo(Idphoto, imgString);
      dbHelper.save(photo);
      //print("Name Photo base 64");
      //print(photo.photoName);
      print("เลือกใหม่");
      print("ID photo");
      print(Idphoto);
      print("Path photo");
      print(imgFile);
      refreshImages();
    });*/
  }

  gridView() {
    return Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          padding: EdgeInsets.all(0),
          childAspectRatio: 1 / 1.2,
          children: images.map(
            (photo) {
              print("/////////////////");
              return Utility.imageFromBase64String(photo.photoName);
            },
          ).toList(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(widget.title,
            style: TextStyle(
              fontSize: 30,
              color: MyStyle().blackColor,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            )),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: MyStyle().blackColor,
            ),
            onPressed: () {
              Idphoto = Idphoto + 1;
              pickImageFromGallery(Idphoto);
            },
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Edit",
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}
