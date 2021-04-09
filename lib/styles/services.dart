import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demo1/styles/Texts.dart';




class Users {
  Users({
    this.username,
    this.email,
    this.password,
    this.id,
  });

  String username;
  String email;
  String password;
  int id;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    username: json["username"],
    email: json["email"],
    password: json["password"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "id": id,
  };

  List<Users> usersFromJson(String str) => List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

  String usersToJson(List<Users> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

  Future <Users> getInfo() async
  {
    Users user = Users(username: '', email: '', password: '', id: 0);
    bool result = false;
    var url = 'http://localhost:3000/users';
    var response = await http.get(url);
    //var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      List<Users> users = usersFromJson(response.body);
      users.forEach((element) {
        print('my email = $email ,my password = $password');
        print('email = ${element.email} , password = ${element.password}');
        if (email == element.email && password == element.password) {
          print('found it $email');
          sam = element.username.capitalize();
          identity= element.id;
          user = Users(username: element.username, email: element.email, password: element.password, id: element.id);
        }
      });
    } else {
      user = Users(username: '', email: '', password: '', id: 0);
    }
    return user;

  }

}