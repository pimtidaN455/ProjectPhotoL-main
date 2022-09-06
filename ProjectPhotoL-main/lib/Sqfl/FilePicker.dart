import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_photo_learn/Sqfl/DBHelper.dart';
import 'package:project_photo_learn/Sqfl/OpenFilepick.dart';
import 'package:project_photo_learn/Sqfl/Photo.dart';
import 'package:project_photo_learn/my_style.dart';

class FilePic extends StatefulWidget {
  @override
  _MyAppState5 createState() => new _MyAppState5();
}

class _MyAppState5 extends State<FilePic> {
  List<Asset> images = <Asset>[];
  late File newFileNoCash;
  @override
  void initState() {
    super.initState();
  }

  void selectImages() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    //allowedExtensions: ['jpg', 'jpeg']);

    if (result == null) return;

    openFiles(result.files);

    //final file = result.files.first;
    //final file2 = result;
    //openFile(file);
    /*print('Name : ');
    print(file.name);
    print('Bytes : ');
    print(file.bytes);
    print('Size : ');
    print(file.size);
    print('Extension : ');
    print(file.extension);
    print('Path : ');
    print(file.path);*/
    print(result.files.length);
    print(result.files.first);

    // File newFile = await saveFilePermanently(file);

    for (int i = 0; i < result.files.length; i++) {
      newFileNoCash = await saveFilePermanently(result.files[i]);
      print('To path : ');
      print(newFileNoCash.path);
      print(result.files[i].name);

      Photo pt = new Photo(i.toString(), result.files[i].name,
          newFileNoCash.path, "keyword", "class");

      DBHelper db = new DBHelper();
      db.savePhoto(pt);
    }

    //openFile(newFile.path);
    /*print('From path : ');
    print(file.path);
    print('To path: ');
    print(newFile);
    print(newFile.path);
    print(newFile.uri);*/
  }

  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilesPage(files: files, onOpenedFile: openFile)));

  void openFile(PlatformFile newFile) {
    OpenFile.open(newFile.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    print('saveFilePermanently :');
    print(appStorage.path);
    print('saveFilePermanently Name :');
    print(file.name);
    return File(file.path!).copy(newFile.path);
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: selectImages),
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
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.all(8),
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  //Asset asset = images[index];
                  //print("ชื่อรูปภาพที่ : ");
                  //print(index);
                  print(images[index].name);
                  //print("///////////////////////////");
                  return Ink.image(
                      fit: BoxFit.cover,
                      image: AssetImage(images[index].toString()),
                      child: InkWell(onTap: () {}));
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//// /sdcard/Download/member-rm.jpg  /////


/*import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_photo_learn/Sqfl/OpenFilepick.dart';
import 'package:project_photo_learn/my_style.dart';

class FilePic extends StatefulWidget {
  @override
  _MyAppState5 createState() => new _MyAppState5();
}

class _MyAppState5 extends State<FilePic> {
  List<Asset> images = <Asset>[];
  @override
  void initState() {
    super.initState();
  }

  void selectImages() async {
    final result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    //allowedExtensions: ['jpg', 'jpeg']);

    if (result == null) return;

    openFiles(result.files);

    final file = result.files.first;
    //openFile(file);
    print('Name : ');
    print(file.name);
    print('Bytes : ');
    print(file.bytes);
    print('Size : ');
    print(file.size);
    print('Extension : ');
    print(file.extension);
    print('Path : ');
    print(file.path);

    final newFile = await saveFilePermanently(file);
    print('From path : ');
    print(file.path);
    print('To path: ');
    print(newFile.path);
    print(newFile.uri);
  }

  void openFiles(List<PlatformFile> files) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              FilesPage(files: files, onOpenedFile: openFile)));

  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');

    return File(file.path!).copy(newFile.path);
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: selectImages),
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
            Expanded(
              child: GridView.count(
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                padding: EdgeInsets.all(8),
                childAspectRatio: 1 / 1.2,
                crossAxisCount: 3,
                children: List.generate(images.length, (index) {
                  Asset asset = images[index];
                  //print("ชื่อรูปภาพที่ : ");
                  //print(index);
                  print(images[index].name);

                  //print("///////////////////////////");
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
}*/
