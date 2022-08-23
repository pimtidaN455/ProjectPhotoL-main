// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/AddAlbumPage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImagePage.dart';

class Homepage extends StatefulWidget {
  var user;
  Homepage({required this.user});
  @override
  AlbumScreenWidget createState() => AlbumScreenWidget(user: user);
}

class AlbumScreenWidget extends State<Homepage> {
  var user;
  AlbumScreenWidget({required this.user});
  int optionSelected = 0;
  late int selectbum;
  void checkOption(int index) {
    setState(() {
      optionSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyStyle().whiteColor,
          title: Text(
            "Album",
            style: TextStyle(
              fontSize: 30,
              color: MyStyle().blackColor,
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Add_Album_Page()));
              },
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
        body: GridView.extent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          padding: EdgeInsets.all(8),
          childAspectRatio: 1 / 1.2,
          children: <Widget>[
            for (int i = 0; i < getBum.length; i++)
              _GridItem(
                getBum[i]['Namebum'] as String,
                img: getBum[i]['img'] as String,
                onTap: () => checkOption(i + 1),
                selected: i + 1 == optionSelected,
                selectbum: i + 1,
              )
          ],
        ));
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem(
    this.title, {
    Key? key,
    required this.img,
    required this.selectbum,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  final String title;
  final String img;
  final int selectbum;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Ink.image(
      fit: BoxFit.cover,
      image: AssetImage(img),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      //ShowImage(name: title, selectbum: selectbum)
                      ShowImage(
                        name: title,
                        selectbum: selectbum,
                      )));
          print("เลือกอัลบั้มที่ : ");
          print(selectbum);
          print("///////////////////////////////////////////////////////");
        },
        child: Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            /*decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: selected ?? false ? Colors.red : Colors.transparent,
                  width: selected ?? false ? 5 : 0,
                ),
              ),
            ),*/
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
