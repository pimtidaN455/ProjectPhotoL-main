import 'package:project_photo_learn/page/PagesF/PageHomeAlbum/place.dart';

const List<Map<String, dynamic>> getBum = <Map<String, dynamic>>[
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom10.png',
  },
  <String, dynamic>{
    'Namebum': 'สุขศึกษา',
    'img': './images/suk4.jpg',
  },
  <String, dynamic>{
    'Namebum': 'ภาษาไทย',
    'img': './images/thai7.jpg',
  },
  <String, dynamic>{
    'Namebum': 'Sicence',
    'img': './images/wit8.jpg',
  },
];
const List<Map<String, dynamic>> getPic = <Map<String, dynamic>>[
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom1.png',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom2.png',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom3.jpg',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom4.jpg',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom5.jpg',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom6.png',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom7.png',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom8.png',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom9.png',
  },
  <String, dynamic>{
    'Namebum': 'สังคม',
    'img': './images/sangcom10.png',
  },
];
const List<Map<String, dynamic>> getPic2 = <Map<String, dynamic>>[
  <String, dynamic>{
    'img': './images/Jujutsu-Kaisen-1.jpg',
  },
  <String, dynamic>{
    'img': './images/Jujutsu-Kaisen-2.jpg',
  },
  <String, dynamic>{
    'img': './images/Jujutsu-Kaisen-3.jpg',
  },
  <String, dynamic>{
    'img': './images/Jujutsu-Kaisen-4.jpg',
  },
  <String, dynamic>{
    'img': './images/plant-growing-ground.jpg',
  },
];

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
      AllImage(image: './images/sangcom1.png'),
      AllImage(image: './images/sangcom2.png'),
      AllImage(image: './images/sangcom3.jpg'),
      AllImage(image: './images/sangcom4.jpg'),
      AllImage(image: './images/sangcom5.jpg'),
      AllImage(image: './images/sangcom6.png'),
      AllImage(image: './images/sangcom7.png'),
      AllImage(image: './images/sangcom8.png'),
      AllImage(image: './images/sangcom9.png'),
      AllImage(image: './images/sangcom10.png'),
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
      AllImage(image: './images/sangcom1.png'),
      AllImage(image: './images/sangcom2.png'),
      AllImage(image: './images/sangcom3.jpg'),
      AllImage(image: './images/sangcom4.jpg'),
      AllImage(image: './images/sangcom5.jpg'),
      AllImage(image: './images/sangcom6.png'),
      AllImage(image: './images/sangcom7.png'),
      AllImage(image: './images/sangcom8.png'),
      AllImage(image: './images/sangcom9.png'),
      AllImage(image: './images/sangcom10.png'),
    ];
  }
}
