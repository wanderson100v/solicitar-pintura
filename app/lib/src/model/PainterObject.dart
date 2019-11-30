
import 'dart:ui';

class PainterObject{
  String title;
  String description;
  Image image;
  Color color;

  PainterObject(this.title,this.description,{this.image, this.color});

  static List<PainterObject> getAll(){
    return  [
      PainterObject("Parede", "Pintar parede com cuidado, tirar o mofo"),
      PainterObject("Porta", "Lixar e deixar como nova"),
    ];
  }

}