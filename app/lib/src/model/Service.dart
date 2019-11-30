
import 'dart:io';

class Service {
  String expandedValue;
  String headerValue;
  List<File> images = [];

  Service({
    this.expandedValue,
    this.headerValue,
  });

  static List<Service> getAll(){
    return [
      Service(
          headerValue: "Serviço 1",
          expandedValue:
              "Descrição de teste para serviço 1, pintura de residencia grande, utilizado padrão de pintura tal"),
      Service(
          headerValue: "Serviço 2",
          expandedValue:
              "Descrição de teste para serviço 2, uma boa reforma para casas de campo"),
      Service(
          headerValue: "Serviço 3",
          expandedValue:
              "Descrição de teste para serviço 3, pintura rustica, estilo especializado")
    ];
  }
}