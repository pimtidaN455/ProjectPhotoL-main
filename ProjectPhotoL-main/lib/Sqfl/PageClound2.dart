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

class SaveImageDemoSQLite2 extends StatefulWidget {
  SaveImageDemoSQLite2() : super();

  final String title = "Clound";

  @override
  _SaveImageDemoSQLiteState2 createState() => _SaveImageDemoSQLiteState2();
}

class _SaveImageDemoSQLiteState2 extends State<SaveImageDemoSQLite2> {
  //
  late Future<File> imageFile;
  late Image image;
  late DBHelper dbHelper;
  late List<Photo> images;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
    print(images.length);
  }

  refreshImages() {
    dbHelper.getPhotos().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
    });
  }

  pickImageFromGallery() {
    ImagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      String imgString = Utility.base64String(imgFile.readAsBytesSync());
      Photo photo = Photo(0, imgString);
      dbHelper.save(photo);
      print("Name Photo base 64");
      print(photo.photoName);
      print("Path photo");
      print(imgFile);
      refreshImages();
      //deleteImage(imgFile);
    });

    deleteImage(File imgFile) {
      File file = new File('yourFilePathHere');
      var deleted = file.delete();
      setState(() {
        images.clear();
        images.remove(deleted);
      });
    }

    deleteImageFromGallery() {}

    /*List<Asset> imgFile = <Asset>[];

    MultiImagePicker.pickImages(
      maxImages: 300,
      enableCamera: true,
      selectedAssets: imgFile,
    ).then((imgFile) {
      final file = File(imgFile.);
      String imgString = Utility.base64String(file.readAsBytesSync());
      Photo photo = Photo(0, imgString);
      dbHelper.save(photo);
      refreshImages();
    });

    maxImages: 300,
      enableCamera: true,
      selectedAssets: images,
      materialOptions: MaterialOptions(
        actionBarTitle: "Gallery",
      ),*/
  }

  gridView() {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(8),
          childAspectRatio: 1 / 1.2,
          crossAxisCount: 2,
          children: images.map(
            (photo) {
              // ignore: unused_label
              return Utility.imageFromBase64String(photo.photoName);
            },
          ).toList()),
    );
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
              pickImageFromGallery();
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
