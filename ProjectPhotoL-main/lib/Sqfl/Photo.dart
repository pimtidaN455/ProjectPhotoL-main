class Photo {
  late int id;
  late String photoName;

  Photo(this.id, this.photoName);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'photoName': photoName,
    };
    return map;
  }

  Photo.fromMap(dynamic map, bool bool) {
    id = map['id'];
    photoName = map['photoName'];
  }
}
