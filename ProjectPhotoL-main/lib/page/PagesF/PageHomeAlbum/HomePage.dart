import 'package:flutter/material.dart';
import 'package:project_photo_learn/my_style.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/AddAlbumPage.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/places_data.dart';
import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/ImagePage.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
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
        body: AlbumScreenWidget(),
      );
}

class AlbumScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 200,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: EdgeInsets.all(8),
      childAspectRatio: 1 / 1.2,
      children: gridItems(),
    );
  }
}

List<Widget> gridItems() {
  return Places().getPlaces().map<Widget>((place) => _GridItem(place)).toList();
}

class _GridItem extends StatelessWidget {
  _GridItem(this.place);

  final Place place;
  @override
  Widget build(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: InkWell(
          child: GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black45,
              title: Text(place.title),
              subtitle: Text(place.subtitle),
            ),
            child: Ink.image(
              image: AssetImage(place.image),
              fit: BoxFit.cover,
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShowImage(name: place.title)));
            print("ส่งชื่ออัลบั้มไปที่ showimage" + place.title);
          },
        ));
  }
}
