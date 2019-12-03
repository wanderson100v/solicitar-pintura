import 'dart:convert';

import 'package:app/src/model/Address.dart';
import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Entity.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Painter.dart';
import 'package:app/src/model/PainterObject.dart';
import 'package:http/http.dart';

class Request extends Entity{
  String situation;
  DateTime startDate;
  DateTime endDate;
  double amount;
  Address address;
  Customer customer;
  Painter painter;
  List<PainterObject> painterObjects;

  Request();

  Request.fromJSON(Map<String, dynamic> requestJson){   
    this.id = int.parse(requestJson["id"]);
    this.startDate = (requestJson["start_date"] != null)? DateTime.parse(requestJson["start_date"]) : null;
    this.endDate = (requestJson["end_date"] != null) ? DateTime.parse(requestJson["end_date"]) : null;
    this.situation = requestJson["situation"];
    this.amount = (requestJson["amount"] != null) ? double.parse(requestJson["amount"]) : null;
    this.address =  Address.fromJSONRequest(requestJson);
    this.customer = Customer.fromJSONRequest(requestJson);
    this.painter =  Painter.fromJSONRequest(requestJson);
  }

  Future<Msg> create() async {
    Response res = await post(Entity.server+"solicitar-pintura/server/index.php/solicitation/create"
      ,body: {
        "start_date": this.startDate.toString(),
        "address" : jsonEncode(
              {
                "zip_code": this.address.zipCode,
                "street": this.address.street,
                "neighborhood": this.address.neighborhood,
                "city": this.address.city,
                "state": this.address.state,
                "country": this.address.country
              }
            ),
        "painters_objects" : jsonEncode(this.painterObjects.map((p)=>{
          "title": p.title,
          "description": p.description,
          "square_meter" : p.squareMeter.toString()
        }).toList()),
        "fk_client_id" :this.customer.id.toString(),
        "fk_painter_id": this.painter.id.toString()
      }
    );
    if (res.statusCode == 200) {
      print(res.body);
      Msg msg = Msg.fromJSON(jsonDecode(res.body));
      return msg;
    } else {
      print(res.body);
      return Msg.error(res.body);
    }
  }

  Future<Msg> update() async {
    Response res = await post(Entity.server+"solicitar-pintura/server/index.php/solicitation/update"
      ,body: {
        "id": this.id.toString(),
        "start_date": this.startDate.toString(),
        "end_date": this.endDate.toString(),
        "amount": this.amount.toString(),
        "situation": this.situation
      }
    );
    if (res.statusCode == 200) {
      print(res.body);
      Msg msg = Msg.fromJSON(jsonDecode(res.body));
      return msg;
    } else {
      print(res.body);
      return Msg.error(res.body);
    }
  }

  static Future<List<Request>> readPainterId(int id) async {
    Response res = await get(
      Entity.server+"solicitar-pintura/server/index.php/solicitation/read/painter?id="+id.toString()
    );
    if (res.statusCode == 200) {
      Map<String,dynamic> resJson = jsonDecode(res.body);
      List<dynamic> requests = resJson["requests"];
      print(requests);
      if(requests!= null && requests.isNotEmpty)
        return requests.map<Request>((dynamic requestJson) => Request.fromJSON(requestJson)).toList();
      return null;
    }else
      return null;
  }

  static Future<List<Request>> readClientId(int id) async {
    Response res = await get(
      Entity.server+"solicitar-pintura/server/index.php/solicitation/read/client?id="+id.toString()
    );
    if (res.statusCode == 200) {
      Map<String,dynamic> resJson = jsonDecode(res.body);
      print(resJson["requests"]);
      if(resJson["requests"] != null)
        return resJson["requests"].map<Request>((dynamic requestJson) => Request.fromJSON(requestJson)).toList();
      return null;
    }else
      return null;
  }
}
