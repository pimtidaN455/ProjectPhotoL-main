import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImageSliderPage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';
import 'package:project_photo_learn/page/PagesF/first.dart';

class ShowImage extends StatelessWidget {
  @override
  var name;
  ShowImage({this.name});

  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: MyStyle().blackColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstState()));
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
        body: Allimages(nameAlbum: this.name),
      );
}

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
      children: gridItems(nameAlbum),
    );
  }
}

List<Widget> gridItems(nameAlbum) {
  return AllImages()
      .getAllImages()
      .map<Widget>((allimage) => _GridItem(allimage, nameAlbum))
      .toList();
}

class _GridItem extends StatelessWidget {
  _GridItem(this.allimage, this.nameAlbum);
  var nameAlbum;
  final AllImage allimage;
  @override
  Widget build(BuildContext context) {
    print(nameAlbum);
    print("oooooooooooooooooooooooooooooooooooooooooooooooooooo");
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: InkWell(
          child: GridTile(
            /*footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(allimage.title),
              subtitle: Text(allimage.subtitle),
            ),*/
            child: Ink.image(
              image: AssetImage(allimage.image),
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        SlideImage(namealbum: nameAlbum.toString())));
            print("ส่งชื่ออัลบั้มไปที่ SlideImage" + nameAlbum.toString());
          },
        ));
  }
}
