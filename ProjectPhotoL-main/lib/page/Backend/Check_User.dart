import 'package:project_photo_learn/page/Backend/Use_Api.dart';
import 'package:project_photo_learn/page/Backend/User_data.dart';

class check_user {
  var id_device = "";
  user_file userdata_file = new user_file();
  use_API use_api = new use_API();

  login(email, password, id_device) {
    /*var login = use_api.Login(email, password, id_device);
    var login_json = (login.json());
    var meesage = login_json['message'];
    var datauser = login_json['dataAL'];
    if (meesage == 'Login success') {
      userdata_file.write_user_file(datauser);
    }*/
    var data_json = {
      'Email': "",
      'Firstname': "",
      'Lastname': "",
      'IDuser': "",
      'Album_Create': "",
      'Login': true
    };
    userdata_file.write_user_file(data_json);
    //userdata_file.getdata_user_file();
    user_file userfile = new user_file();
    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    print(userfile.Login);
    return userfile.Login;
  }

  logout() {
    //use_api.Logout(userdata_file.IDuser);
    /*var data_json = {
      'Email': "",
      'Firstname': "",
      'Lastname': "",
      'IDuser': "",
      'Album_Create': "",
      'Login': false
    };*/
    //userdata_file.file.delete();
    var data_json = {
      'Email': "",
      'Firstname': "",
      'Lastname': "",
      'IDuser': "",
      'Album_Create': "",
      'Login': false
    };
    userdata_file.write_user_file(data_json);

    return "Logout success";
  }
}
