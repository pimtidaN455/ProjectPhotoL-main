import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImageSliderPage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

import '../../Backend/User_data.dart';

// ignore: must_be_immutable
class ShowImage extends StatefulWidget {
  var name;
  var selectbum;
  ShowImage({this.name, this.selectbum});
  @override
  Allimages createState() => Allimages(name: name, selectbum: selectbum);
}

class Allimages extends State<ShowImage> {
  int optionSelected = 0;
  var name;
  var selectbum; //อัลบั้มที่ผู้ใช้เลือก
  Allimages({this.name, this.selectbum});
  void checkOption(int index) {
    setState(() {
      optionSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: MyStyle().blackColor,
            ),
            onPressed: () async {
              user_file user0 = new user_file();
              var user = await user0;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstState(page: 0, user: user)));
            },
          ),
          backgroundColor: MyStyle().whiteColor,
          title: Text(
            this.name,
            style: TextStyle(
              fontSize: 30,
              color: MyStyle().blackColor,
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          padding: EdgeInsets.all(8),
          childAspectRatio: 1 / 1.2,
          children: <Widget>[
            for (int i = 0; i < getPic.length; i++)
              _GridItem(
                getPic[i]['Namebum'] as String,
                img: getPic[i]['img'] as String,
                onTap: () => checkOption(i),
                selected: i == optionSelected,
                selectPic: i,
                name: name,
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
    required this.selectPic,
    required this.onTap,
    required this.selected,
    required this.name,
  }) : super(key: key);

  final String title;
  final String img;
  final int selectPic;
  final VoidCallback onTap;
  final bool selected;
  final String name;

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
                      SlideImage(title: name, selectPic: selectPic)));
          print("เลือกรูปที่ : ");
          print(selectPic);
          print("///////////////////////////////////////////////////////");
        },
      ),
    );
  }
}
