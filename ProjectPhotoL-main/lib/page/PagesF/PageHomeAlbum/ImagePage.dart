import 'package:flutter/material.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/HomePage.dart';
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
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FirstState()));
            },
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Text(
            this.name,
            style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold,
              //fontStyle: FontStyle.normal,
              fontFamily: 'Rajdhani',
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Allimages(),
      );
}

class Allimages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: EdgeInsets.all(8),
      childAspectRatio: 1 / 1.2,
      children: gridItems(),
    );
  }
}

List<Widget> gridItems() {
  return AllImages()
      .getAllImages()
      .map<Widget>((allimage) => _GridItem(allimage))
      .toList();
}

class _GridItem extends StatelessWidget {
  _GridItem(this.allimage);

  final AllImage allimage;
  @override
  Widget build(BuildContext context) {
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
                    builder: (context) => SlideImage(allimage.image)));
          },
        ));
  }
}
