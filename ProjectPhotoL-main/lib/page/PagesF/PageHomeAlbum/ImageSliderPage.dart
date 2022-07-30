import 'dart:html';
import 'dart:math';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';

class SlideImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "",
      home: Scaffold(
        appBar: AppBar(title: Text('odifhvoighv')),
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
  List<String> imagelist = [
    "https://lzd-img-global.slatic.net/g/p/98843e93d9da2a6162f9a226fab34f36.jpg_2200x2200q80.jpg_.webp",
    "https://cf.shopee.co.th/file/2ab0ec78bcf07e6c7972cbe5667100f7",
    "https://images.hdqwalls.com/download/spiderman-peter-parker-standing-on-a-rooftop-ix-1280x720.jpg",
    "https://images.wallpapersden.com/image/download/peter-parker-spider-man-homecoming_bGhsa22UmZqaraWkpJRmZ21lrWxnZQ.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvUgui-suS8DgaljlONNuhy4vPUsC_UKvxJQ&usqp=CAU",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: CarouselSlider(
            options: CarouselOptions(
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlay: true,
            ),
            items: imagelist
                .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(
                            e,
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
