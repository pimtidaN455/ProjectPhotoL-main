import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:project_photo_learn/Sqfl/ClassAlbum.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'Photo.dart';

class DBHelper {
  //
  static Database? _db;
  static const String ID = 'id';
  static const String NAME = 'photoName';
  static const String TABLE_PHOTO = 'PhotosTable';
  static const String TABLE_CLASS = 'ClassTable';
  static const String DB_NAME = 'database.db';

  Future<Database?> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $TABLE_CLASS ($ID INTEGER, $NAME TEXT)');
    await db.execute('CREATE TABLE $TABLE_PHOTO ($ID INTEGER, $NAME TEXT)');
  }

  Future<Photo?> savePhoto(Photo photo) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_PHOTO, photo.toMap())!;
    return photo;
  }

  DeletePhoto(String id) async {
    return 'delete sucess';
  }

  YaiPhoto(String id) async {
    return 'yai sucess';
  }

  Future<ClassAlbum?> saveAlbum(ClassAlbum album) async {
    var dbClient = await db;
    await dbClient?.insert(TABLE_CLASS, album.toMap())!;
    return album;
  }

  DeleteAlbum(Photo photo) async {
    return 'delete sucess';
  }

  Future<List<ClassAlbum>> getAlbum() async {
    var dbClient = await db;
    List<Map> maps = await dbClient!
        .query(TABLE_CLASS, columns: ['idAlbum', 'nameAlbum', 'keywordAlbum']);
    List<ClassAlbum> albumg = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        print(maps[i].runtimeType);
        albumg.add(ClassAlbum.fromMap(maps[i], true));
      }
    }
    return albumg;
  }

  /*Future<List<Photo>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(TABLE, columns: [ID, NAME]);
    List<Photo> photos = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        print(maps[i].runtimeType);
        photos.add(Photo.fromMap(maps[i], true));
      }
    }
    return photos;
  }*/

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}
