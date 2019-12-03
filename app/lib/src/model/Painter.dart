import 'dart:convert';
import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Entity.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Service.dart';
import 'package:http/http.dart';

class Painter extends Customer  {
  static Painter painterOn;
  
  double dayliValue;
  double squareMeterValue;
  String description;
  int fkClientId;
  
  List<Service> services = [
    Service(
        headerValue: "Serviço tal",
        expandedValue: "Serviço realizado com tais procedimentos"),
    Service(
        headerValue: "Serviço tal2",
        expandedValue: "Serviço realizado com tais procedimentos2"),
  ];

  Painter();

  Painter.fromJSON(Map<String, dynamic>painterJson): super.fromJSON(painterJson["client"]){   
    this.id = int.parse(painterJson["id"]);
    this.fkClientId = int.parse(painterJson["client"]["id"]);
    this.squareMeterValue = double.parse(painterJson["square_meter_value"]);
    this.dayliValue = double.parse(painterJson["dayli_value"]);
    this.description = painterJson["description"];
  }

  Painter.fromJSONRequest(Map<String, dynamic>painterJson){   
    this.name = painterJson["name"];
  }

   Painter.fromReadJSON(Map<String, dynamic>painterJson){   
    this.id = int.parse(painterJson["id"]);
    this.name = painterJson["name"];
    this.squareMeterValue = double.parse(painterJson["square_meter_value"]);
    this.dayliValue = double.parse(painterJson["dayli_value"]);
    this.description = painterJson["description"];
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
      return Msg.error(res.body);
    }
  }

  static Future<List<Painter>> read(String query) async {
    Response res = await get(
      Entity.server+"solicitar-pintura/server/index.php/painter/read?query="+query
    );
    if (res.statusCode == 200) {
      Map<String,dynamic> resJson = jsonDecode(res.body);
      if(resJson["painters"] != null)
        return resJson["painters"].map<Painter>((dynamic painterJson) => Painter.fromReadJSON(painterJson)).toList();
      return null;
    }else
      return null;
  }

}