import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImagePage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';

class SlideImage extends StatelessWidget {
  @override
  String title;
  int selectPic;
  SlideImage({required this.title, required this.selectPic});

  Widget build(BuildContext context) {
    print("selecpic ที่รับมาจาก Imageplace");
    print(this.selectPic);
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(this.title,
            style: TextStyle(
              color: MyStyle().blackColor,
            )),
        centerTitle: true,
        backgroundColor: MyStyle().whiteColor,
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: MyStyle().blackColor,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowImage(name: this.title)));
            print("ส่งชื่ออัลบั้มไปที่ ShowImage" + this.title);
          },
        ),
      ),
      body: Body(selectPic: selectPic),
    ));
  }
}

class Body extends StatefulWidget {
  int selectPic;
  Body({required this.selectPic});
  @override
  State<Body> createState() => _Body(currentIndex: selectPic);
}

class _Body extends State<Body> {
  int currentIndex;
  _Body({required this.currentIndex});
  //int selectPic1 = 0;
  PageController controller = PageController();
  List<String> imagelist = [
    './images/Jujutsu-Kaisen-1.jpg',
    './images/Jujutsu-Kaisen-2.jpg',
    './images/Jujutsu-Kaisen-3.jpg',
    './images/Jujutsu-Kaisen-4.jpg',
    './images/plant-growing-ground.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    print("+++++++++++++++++++++++++++++++++++++++++++++++++");
    print(currentIndex);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              //////////////////////////////////////////////
              onPageChanged: (index) {
                print("index : ");
                print(index);
                setState(() {
                  ////////////////////////////////////////////
                  currentIndex = index % imagelist.length;
                });
              },
              //////////////////////////////////////
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: Image.asset(
                      ///////////////////////////////////////////////////////////////
                      imagelist[currentIndex % imagelist.length],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (var i = 0; i < imagelist.length; i++)
                buildIndicator(currentIndex == i)
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    print("ค่าเปลี่ยนนหน้า ก่อน ถอยหลัง = ");
                    print(currentIndex);
                    controller.jumpToPage(currentIndex - 1);
                    print("ค่าเปลี่ยนนหน้า หลัง ถอยหลัง = ");
                    print(currentIndex);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    print("ค่าเปลี่ยนนหน้า ก่อน เดินหน้า = ");
                    print(currentIndex);
                    controller.jumpToPage(currentIndex + 1);
                    print("ค่าเปลี่ยนนหน้า หลัง เดินหน้า = ");
                    print(currentIndex);
                  },
                  icon: Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
