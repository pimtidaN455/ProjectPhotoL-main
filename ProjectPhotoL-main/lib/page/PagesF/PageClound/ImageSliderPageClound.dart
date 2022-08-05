import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageClound/CloudPage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImagePage.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

class SlideImageC extends StatelessWidget {
  @override
  int startImg;
  String namealbumC;

  SlideImageC({required this.namealbumC, required this.startImg});

  Widget build(BuildContext context) {
    print(this.namealbumC);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this.namealbumC,
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
                      builder: (context) => FirstState(
                            page: 2,
                          )));
              print("ส่งชื่ออัลบั้มไปที่ ShowImage" + this.namealbumC);
            },
          ),
        ),
        body: Body(startImg: startImg),
      ),
    );
  }
}

class Body extends StatefulWidget {
  int startImg;
  Body({required this.startImg});

  @override
  State<Body> createState() => _Body(startImg: startImg);
}

class _Body extends State<Body> {
  int startImg;
  _Body({required this.startImg});
  int currentIndex = 0;
  final PageController controller = PageController();
  List<String> imagelistC = [
    './images/picinalbum0-_1__1.jpg',
    './images/picinalbum0-_2__1.jpg',
    './images/picinalbum0-_3__1.jpg',
    './images/picinalbum0-_4__1.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index % imagelistC.length;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: Image.asset(
                      //////////////////////////////รับค่า int เปลี่ยนหน้า ////////////////////////////////
                      //imagelistC[this.startImg % imagelistC.length],
                      imagelistC[index % imagelistC.length],
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
            children: [
              for (var i = 0; i < imagelistC.length; i++)
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