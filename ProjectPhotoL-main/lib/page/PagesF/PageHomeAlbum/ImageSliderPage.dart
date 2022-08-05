import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImagePage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';

class SlideImage extends StatelessWidget {
  @override
  String namealbum;
  SlideImage({required this.namealbum});

  Widget build(BuildContext context) {
    print(this.namealbum);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.namealbum,
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
                      builder: (context) => ShowImage(name: this.namealbum)));
              print("ส่งชื่ออัลบั้มไปที่ ShowImage" + this.namealbum);
            },
          ),
        ),
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _Body();
}

class _Body extends State<Body> {
  //List<AllImage> imageListS = AllImages().getAllImages();
  AllImages imgslide = new AllImages();
  var img;
  var lenght;

  _Body() {
    img = imgslide.getAllImages();
    lenght = img.length;
  }

  int currentIndex = 0;
  final PageController controller = PageController();

  List<String> imagelist = [
    "images/picinalbum0-_1__1.jpg",
    "images/picinalbum0-_2__1.jpg",
    "images/picinalbum0-_3__1.jpg",
    "images/picinalbum0-_4__1.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index % imagelist.length;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.asset(
                      imagelist[index % imagelist.length],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < img.length; i++)
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
                    controller.jumpToPage(currentIndex - 1);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                IconButton(
                  onPressed: () {
                    controller.jumpToPage(currentIndex + 1);
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
