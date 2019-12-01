
import 'dart:convert';

import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Entity.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Painter.dart';
import 'package:http/http.dart';

class User extends Entity{
  String type;
  String login;
  String password;

  static Future<dynamic> singin(String login, String password) async {
    Response res = await post(
    Entity.server+"solicitar-pintura/server/index.php/log/in",
      body: {
      "login" :login,
      "password":password,
      }
    ); 
    if (res.statusCode == 200) {
      print(res.body);
      Map<String, dynamic> json = jsonDecode(res.body);
      if(json["type"] == "cliente")
        return Customer.fromJSON(json["client"]);
      else if(json["type"] == "pintor")
        return Painter.fromJSON(json["painter"]);
      else
        return Msg.fromJSON(json);
    }
  }
    
}
