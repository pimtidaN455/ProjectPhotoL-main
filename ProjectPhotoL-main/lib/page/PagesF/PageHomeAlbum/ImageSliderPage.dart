import 'dart:html';

import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';

class SlideImage extends StatelessWidget {
  var allimageslide;
  SlideImage(allimageslide);

  @override
  List<Widget> gridItems() {
    return AllImages()
        .getAllImages()
        .map<Widget>((allimage) => SlideImage(allimageslide))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: InkWell(
          child: GridTile(
            child: Ink.image(
              image: AssetImage(allimageslide.image),
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
