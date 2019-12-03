
import 'package:app/src/model/Entity.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class PainterObject extends Entity{
  String title;
  String description;
  Color color;
  Image image;
  double squareMeter;

  PainterObject(this.title,this.description, {this.squareMeter, this.image, this.color});

  static List<PainterObject> getAll(){
    return  [
      PainterObject("Parede", "Pintar parede com cuidado, tirar o mofo"),
      PainterObject("Porta", "Lixar e deixar como nova"),
    ];
  }

}