
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
      if(json["type"] == "cliente"){
        Customer customer = Customer.fromJSON(json["client"]);
        Customer.customerOn = customer;
        return customer;
      }
      else if(json["type"] == "pintor"){
        Painter painter = Painter.fromJSON(json["painter"]);
        Painter.painterOn = painter;
        Customer.customerOn = painter;
        return painter;
      }
      else
        return Msg.fromJSON(json);
    }
  }
    
}
