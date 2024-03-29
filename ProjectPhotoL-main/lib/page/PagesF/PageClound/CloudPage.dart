//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageClound/ImageSliderPageClound.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';

// ignore: must_be_immutable
class Cloundpage extends StatelessWidget {
  var name;
  Cloundpage({this.name});
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
              onPressed: () {},
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
        body: Allimages(nameAlbum: this.name),
      );
}

// ignore: must_be_immutable
class Allimages extends StatelessWidget {
  var nameAlbum;
  Allimages({this.nameAlbum});

  @override
  Widget build(BuildContext context) {
    //print(nameAlbum.toString());
    return GridView.extent(
      maxCrossAxisExtent: 150,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: EdgeInsets.all(8),
      childAspectRatio: 1 / 1.2,
      //children: gridItemsC(nameAlbum),
      children: gridItemsC(),
    );
  }
}

List<Widget> gridItemsC() {
  AllImages alllll = new AllImages();
  print("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  print(alllll.getAllImagesClound().runtimeType);
  return AllImages()
      .getAllImagesClound()
      //.map<Widget>((allimage) => _GridItemC(allimage, nameAlbum))
      .map<Widget>((allimage) => _GridItemC(allimage))
      .toList();
}

class _GridItemC extends StatelessWidget {
  //var nameAlbum;
  final AllImage allimages;

  //_GridItemC(this.allimages, this.nameAlbum);
  _GridItemC(this.allimages);
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: InkWell(
          child: GridTile(
            child: Image.asset(
              allimages.image,
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SlideImageC(namealbumC: "Cloud", startImg: 2)));
            //print("ส่งชื่ออัลบั้มไปที่ SlideImage" + nameAlbum.toString());
          },
        ));
  }
}
