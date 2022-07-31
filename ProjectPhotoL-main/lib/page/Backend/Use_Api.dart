import 'package:flutter/animation.dart';
import 'package:http/http.dart' as http;
import 'package:project_photo_learn/page/Backend/manageFIle_image.dart';

class use_API {
  var path = "/";

  use_API() {}

  Sign_up(email, password, firstname, lastname) {
    var path_API = path + "signupuser/";
    var data = {
      'email': email,
      'password': password,
      'firstname': firstname,
      'lastname': lastname
    };
    return http.post(Uri.parse(path_API), body: data);
  }

  Login(email, password, id_device) {
    var path_API = path + "loginN/";
    var data = {'email': email, 'password': password, 'id_device': id_device};
    return http.post(Uri.parse(path_API), body: data);
  }

  Logout(tokenID) {
    var path_API = path + "logout/";
    var data = {'tokenID': tokenID};
    return http.post(Uri.parse(path_API), body: data);
  }

  Reset_password(email) {
    var path_API = path + "resetpassword/";
    var data = {'email': email};
    return http.post(Uri.parse(path_API), body: data);
  }

  getdata_from_Server(tokenID) {
    var path_API = path + "DatabeasesendtoUser/";
    var data = {'tokenID': tokenID};
    return http.post(Uri.parse(path_API), body: data);
  }

  update_name(tokenID, Firstname, Lastname) {
    var path_API = path + "userdataupdate/";
    var data = {
      'tokenID': tokenID,
      'firstname': Firstname,
      'lastname': Lastname
    };
    return http.post(Uri.parse(path_API), body: data);
  }

  AddPhoto(tokenID, filepath) {
    var path_API = path + "uploadImage/";
    var data = {
      'tokenID': tokenID
    }; //,'nameimage': name ,'image':data ,'AddressImage':'C:/Users/suwan/ddd.png','datephoto':d}
    return http.post(Uri.parse(path_API), body: data);
  }

  Manage_Album(
    tokenID,
    status,
    Name_oldAlbum,
    Name_newAlbum,
    Keyword,
    Description,
  ) {
    var data = {
      'tokenID': tokenID,
      'namealbum': Name_newAlbum,
      'nameoldalbum': Name_oldAlbum,
      'keyword': Keyword,
      'Description': Description,
      'status': status
    };
    var path_API = path + "Album/";

    return http.post(Uri.parse(path_API), body: data);
  }

  clound_storage_Add(tokenID, filepath) {
    var path_API = path + "Addcloud_storage/";

    var data = {
      'tokenID': tokenID,
      //'nameimage': name,
      //'image': data,
      'AddressImage': 'C:/Users/suwan/777.png',
      //'datephoto': d
    };
    return http.post(Uri.parse(path_API), body: data);
  }

  clound_storage_Delete(tokenID, IDimage) {
    var path_API = path + "Deletephoto_cloud/";
    var data = {'tokenID': tokenID, 'idimage': IDimage};
    return http.post(Uri.parse(path_API), body: data);
  }
}
