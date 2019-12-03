import 'dart:convert';

import 'package:app/src/model/Address.dart';
import 'package:app/src/model/Entity.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/User.dart';
import 'package:http/http.dart';

class Customer extends User{
  static Customer customerOn;
  bool active;
  String name;
  String email;
  String telNumber;
  Address address;

  Customer();

  Customer.fromJSON(Map<String, dynamic> clientJson){
    this.id = int.parse(clientJson["id"]);
    this.active = (int.parse(clientJson["active"]) == 1);
    this.type = clientJson["type"];
    this.name = clientJson["name"];
    this.email = clientJson["email"];
    this.telNumber = clientJson["tel_number"];
    this.login = clientJson["login"];
    this.address = Address.fromJSON(clientJson['address']);
  }

   Customer.fromJSONRequest(Map<String, dynamic>clientJson){   
    this.name = clientJson["name"];
  }


  Future<Msg> create(String password, String confirmPassowd) async {
    Response res = await post(
      Entity.server+"solicitar-pintura/server/index.php/register/client",
      body: {
        "name" : this.name,
        "login" :this.login,
        "password": password,
        "confirm_password": confirmPassowd,
        "email": this.email,
        "tel_number": this.telNumber
      }
    );
    if (res.statusCode == 200) {
      Msg msg = Msg.fromJSON(jsonDecode(res.body));
      return msg;
    }else
      return Msg.error(res.body);
  }
}