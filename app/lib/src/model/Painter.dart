
import 'dart:ui';
import 'package:app/src/model/Service.dart';

class Painter {
  String name;
  Image image;
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

  Painter(
      {this.name,
      this.image,
      this.description,
      this.dayliValue,
      this.squareMeterValue});

  static List<Painter> getAll(){
    return [
          Painter(
              name: "Jubileu",
              description: "O melhor pintor da cidade",
              dayliValue: 80,
              squareMeterValue: 20),
          Painter(
              name: "Severino",
              description: "Barato e rápido",
              dayliValue: 90,
              squareMeterValue: 40),
          Painter(
              name: "Frederico",
              description: "Seu serviço em dois palito",
              dayliValue: 70,
              squareMeterValue: 15),
          Painter(
              name: "Jubileu",
              description: "O melhor pintor da cidade",
              dayliValue: 80,
              squareMeterValue: 20),
          Painter(
              name: "Severino",
              description: "Barato e rápido",
              dayliValue: 90,
              squareMeterValue: 40),
          Painter(
              name: "Frederico",
              description: "Seu serviço em dois palito",
              dayliValue: 70,
              squareMeterValue: 15),
        ];
  }
}
