import 'dart:convert';
import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Entity.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Service.dart';
import 'package:http/http.dart';

class Painter extends Customer  {
  double dayliValue;
  double squareMeterValue;
  String description;
  
  List<Service> services = [
    Service(
        headerValue: "Serviço tal",
        expandedValue: "Serviço realizado com tais procedimentos"),
    Service(
        headerValue: "Serviço tal2",
        expandedValue: "Serviço realizado com tais procedimentos2"),
  ];

  static List<Painter> getAll(){
    return [];
  }

  Future<Msg> create(String password, String confirmPassowd) async {
    Response res = await post(Entity.server+"solicitar-pintura/server/index.php/register/painter"
      ,body: {
        "description": this.description,
        "name" :this.name,
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
    } else {
      print(res.body);
      return Msg.error(res.body);
    }
  }

  Painter();

  Painter.fromJSON(Map<String, dynamic>painterJson){   
    this.id = int.parse(painterJson["id"]);
    this.active = (int.parse(painterJson["client"]["active"]) == 1);
    this.type = painterJson["client"]["type"];
    this.name = painterJson["client"]["name"];
    this.email = painterJson["client"]["email"];
    this.telNumber = painterJson["client"]["tel_number"];
    this.login = painterJson["client"]["login"];
    if(painterJson["square_meter_value"]!= null)
      this.squareMeterValue = double.parse(painterJson["square_meter_value"]);
    if(painterJson["dayli_value"]!= null)
      this.dayliValue =double.parse(painterJson["dayli_value"]);
    this.description = painterJson["description"];
  }
}