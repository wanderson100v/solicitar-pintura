
import 'package:app/src/model/Entity.dart';

class Address extends Entity{
  String zipCode;
  String street;
  String neighborhood;
  String city;
  String state;
  String country;
  
  Address();

  Address.fromJSON(Map<String, dynamic> addressJSON){
    this.id = int.parse(addressJSON["id"]);
    this.zipCode = addressJSON["ZIP_code"];
    this.street = addressJSON["street"];
    this.neighborhood = addressJSON["neighborhood"];
    this.city = addressJSON["city"];
    this.state = addressJSON["state"];
    this.country = addressJSON["country"];
  }
  
  Address.fromJSONRequest(Map<String, dynamic> addressJSON){
    this.zipCode = addressJSON["ZIP_code"];
    this.street = addressJSON["street"];
    this.neighborhood = addressJSON["neighborhood"];
    this.city = addressJSON["city"];
    this.state = addressJSON["state"];
    this.country = addressJSON["country"];
  }
}