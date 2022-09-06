class Photo {
  late String id;
  late String photoName;
  late String photopath;
  //late String photodate;
  late String photokeyword;
  late String photoclass;
  Photo(this.id, this.photoName, this.photopath, this.photokeyword,
      this.photoclass);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photoName': photoName,
      'photopath': photopath,
      'photoclass': photoclass,
      //'photodate': photodate,
      'photokeyword': photokeyword,
    };
    return map;
  }

  Photo.fromMap(dynamic map, bool bool) {
    id = map['id'];
    photoName = map['photoName'];
    photopath = map['photopath'];
    photoclass = map['photoclass'];
    //photodate = map['photodate'];
    photokeyword = map['photokeyword'];
  }
}
