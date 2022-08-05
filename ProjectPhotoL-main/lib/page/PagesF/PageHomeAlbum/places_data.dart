import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';
import 'dart:io';
import 'dart:convert';

class Places {
  List<Place> getPlaces() {
    return [
      Place(
          image: './images/picinalbum0-_1__1.jpg',
          title: 'ภาษาอังกฤษ',
          subtitle: ''),
      Place(
          image: './images/picinalbum0-_2__1.jpg',
          title: 'calculus1',
          subtitle: ''),
      Place(
          image: './images/picinalbum0-_3__1.jpg', title: 'Algo', subtitle: ''),
      Place(
          image: './images/picinalbum0-_4__1.jpg',
          title: 'compro1',
          subtitle: ''),
    ];
  }
}

////////////////////////////////////////////////////////////
class AllImages {
  ///รับชื่อโฟลเดอร์
  List<AllImage> getAllImages() {
    return [
      AllImage(image: './images/Jujutsu-Kaisen-1.jpg'),
      AllImage(image: './images/Jujutsu-Kaisen-2.jpg'),
      AllImage(image: './images/Jujutsu-Kaisen-3.jpg'),
      AllImage(image: './images/Jujutsu-Kaisen-4.jpg'),
      AllImage(image: './images/plant-growing-ground.jpg'),
    ];
  }

  List<AllImage> getAllImagesClound() {
    return [
      /*AllImage(image: "https://picsum.photos/id/240/200/300"),
      AllImage(image: "https://picsum.photos/id/241/200/300"),
      AllImage(image: "https://picsum.photos/id/242/200/300"),
      AllImage(image: "https://picsum.photos/id/243/200/300"),
      AllImage(image: "https://picsum.photos/id/244/200/300"),
      AllImage(image: "https://picsum.photos/id/250/200/300"),
      AllImage(image: "https://picsum.photos/id/251/200/300"),
      AllImage(image: "https://picsum.photos/id/252/200/300"),
      AllImage(image: "https://picsum.photos/id/253/200/300"),
      AllImage(image: "https://picsum.photos/id/254/200/300"),*/
      AllImage(image: './images/picinalbum0-_1__1.jpg'),
      AllImage(image: './images/picinalbum0-_2__1.jpg'),
      AllImage(image: './images/picinalbum0-_3__1.jpg'),
      AllImage(image: './images/picinalbum0-_4__1.jpg'),
    ];
  }
}
