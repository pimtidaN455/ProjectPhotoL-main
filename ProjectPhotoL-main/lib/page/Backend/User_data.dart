import 'dart:io';
import 'dart:convert';

class user_file {
  var Albums_Create;
  var Email;
  var Login;
  var Firstname;
  var Lastname;
  var IDuser;
  var filepath_W = File('./lib/page/Backend/datafile/client_data.json');

  user_file() {
    getdata_user_file();
  }

  getdata_user_file() {
    var data_json = jsonDecode(filepath_W.readAsStringSync());

    Email = data_json['Email'];
    Firstname = data_json['Firstname'];
    Lastname = data_json['Lastname'];
    IDuser = data_json['IDuser'];
    Albums_Create = data_json['Albums_Create'];
    Login = data_json['Login'];
    print(Email);
    print(Login);
    print(data_json);

    return data_json;
    /*
    print("GGGGasdasdasddsadasd");
    var file =
        File('./ProjectPhotoL-main/lib/Backend/datafile/client_data.json');
    // var G = (await file.readAsString());

    var data_json = jsonDecode(file.readAsStringSync());
    print(data_json.runtimeType);
    print(data_json);
    print("HHH");

    Email = data_json['Email'];
    Firstname = data_json['Firstname'];
    Lastname = data_json['Lastname'];
    IDuser = data_json['IDuser'];
    Albums_Create = data_json['Albums_Create'];
    Login = data_json['Login'];

    // print(user.runtimeType);
    //Map<String, dynamic> userMap = jsonDecode(G);

    // print(userMap['name']);
    return data_json;*/
  }

  write_user_file(map_data) async {
    var user = jsonEncode(map_data);
    filepath_W.writeAsString(user);
    /* await File('./ProjectPhotoL-main/lib/Backend/datafile/client_data.json')
        .writeAsString(user);*/
    return "Write_Success";
  }
}
