import 'dart:async';
import 'dart:io' as io;
import 'dart:io';
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
    /*io.Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final db = openDatabase(
      join(documentsDirectory.path, DB_NAME),
    );
    if (null != db) {
      _db = await db;
      print('db ไม่ว่างงงงงงงง');
      return _db;
    } 
  

    _db = await initDB();
    print('db ว่างงงงงงงง');
    return _db;
    */
  }

  checkDatabase() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    File filedatabase = new File(join(documentsDirectory.path, DB_NAME));
    bool checkfile = filedatabase.existsSync();

    if (checkfile) {
      _db = await db;
      print('db ไม่ว่างงงงงงงง');
      return _db;
    }

    _db = await initDB();
    print('db ว่างงงงงงงง');
    return _db;

    /*final db = openDatabase(
      join(documentsDirectory.path, DB_NAME),
    );*/

    /*if (null != db) {
      _db = await db;
      print('db ไม่ว่างงงงงงงง');
      return _db;
    }

    _db = await initDB();
    print('db ว่างงงงงงงง');
    return _db;
    */
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String id = 'id';
    String photoName = 'photoName';
    String photopath = 'photopath';
    String photokeyword = 'photokeyword';
    String photoclass = 'photoclass';
    print("Onnnnnnnnnn Ceateqadkpsodkfpkdvpokvfpd;rf");
    await db.execute('CREATE TABLE $TABLE_CLASS ($ID TEXT, $NAME TEXT)');
    print("dddddddddddmakkkkkkkkkkkkk");
    await db.execute(
        'CREATE TABLE $TABLE_PHOTO ($id TEXT, $photoName TEXT ,$photopath TEXT , $photokeyword TEXT ,$photoclass TEXT)');
  }

  Future<Photo?> savePhoto(Photo photo) async {
    print('^^^^^^^^^^^^^^^^^^');
    print(photo.toString());
    print('^^^^^^^^^^^^^^^^^^');
    var dbClient = await _db;
    var p = photo.toMap();
    print('^^^^^^^^^======^^^^^^^^^');
    print(dbClient?.path);
    print(p['photopath']);
    print('^^^^^^^^^======^^^^^^^^^');
    await dbClient?.insert(
      TABLE_PHOTO,
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )!;
    //List<Map> maps =
    // await dbClient!.query(TABLE_PHOTO, columns: ['id', 'photoName']);
    //for (int i = 0; i < maps.length; i++) {
    //print(maps[i]);
    //}
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
/*import 'dart:async';
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
      io.Directory documentsDirectory =
          await getApplicationDocumentsDirectory();

      final _db = openDatabase(
        join(documentsDirectory.path, DB_NAME),
      );
      print('db ไม่ว่างงงงงงงง');
      return _db;
    }
    _db = await initDB();
    print('db ว่างงงงงงงง');
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String id = 'id';
    String photoName = 'photoName';
    String photopath = 'photopath';
    String photokeyword = 'photokeyword';
    String photoclass = 'photoclass';

    await db.execute('CREATE TABLE $TABLE_CLASS ($ID TEXT, $NAME TEXT)');
    await db.execute(
        'CREATE TABLE $TABLE_PHOTO ($id TEXT, $photoName TEXT ,$photopath TEXT , $photokeyword TEXT ,$photoclass TEXT)');
  }

  Future<Photo?> savePhoto(Photo photo) async {
    var dbClient = await _db;
    await dbClient?.insert(TABLE_PHOTO, photo.toMap())!;
    //List<Map> maps = await dbClient!.query(TABLE_PHOTO, columns: [ID, NAME]);
    //for (int i = 0; i < maps.length; i++) {
    //print(maps[i]);
    //}
    return photo;
  }

  DeletePhoto(String id) async {
    return 'delete sucess';
  }

  YaiPhoto(String id) async {
    return 'yai sucess';
  }

  Future<ClassAlbum?> saveAlbum(ClassAlbum album) async {
    var dbClient = await _db;
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

  Future<List<Photo>> getPhotos() async {
    var dbClient = await db;
    List<Map> maps = await dbClient!.query(TABLE_PHOTO, columns: [ID, NAME]);
    List<Photo> photos = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        print(maps[i].runtimeType);
        photos.add(Photo.fromMap(maps[i], true));
      }
    }
    return photos;
  }

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}*/
