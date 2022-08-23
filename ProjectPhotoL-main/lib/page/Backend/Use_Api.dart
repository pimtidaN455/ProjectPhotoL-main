import 'dart:convert';
import 'package:http/http.dart' as http;

class use_API {
  var path = "https://127.0.0.1:8000/";

  use_API() {}

  Sign_up(email, password, firstname, lastname) async {
    final http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/signupuser/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'firstname': firstname,
        'lastname': lastname
      }),
    );
    print("KKKKKKKKKK");
    print(response.statusCode);
    print("DDDDDDDDDDD");

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("DDDDDDDDDDDDDDDDDDDDDDDDDWSSSSSSSSSSSSs");
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Login(email, password, id_device) async {
    print("UUUUUUUUUUUUUUUUUUUUU");
    final http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/loginN/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'id_device': id_device,
      }),
    );
    print("KKKKKKKKKK");
    print(response.statusCode);
    print("DDDDDDDDDDD");

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("DDDDDDDDDDDDDDDDDDDDDDDDDWSSSSSSSSSSSSs");
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }

    //audrapunzel@gmail.com
  }

  Logout(tokenID) async {
    final http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/logout/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'tokenID': await tokenID,
      }),
    );
    print("KKKKKKKKKK");
    print(response.statusCode);
    print("DDDDDDDDDDD");

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("DDDDDDDDDDDDDDDDDDDDDDDDDWSSSSSSSSSSSSs");
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Reset_password(email) async {
    final http.Response response = await http.post(
      Uri.parse("http://127.0.0.1:8000/logout/"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': await email,
      }),
    );
    print("KKKKKKKKKK");
    print(response.statusCode);
    print("DDDDDDDDDDD");

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print("DDDDDDDDDDDDDDDDDDDDDDDDDWSSSSSSSSSSSSs");
      print(jsonDecode(response.body));
      return (jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
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
