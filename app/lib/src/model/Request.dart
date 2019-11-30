import 'PainterObject.dart';

class Request{
  String clienteName;
  String dataInicio;
  String dataFim;
  String state;
  double value = 100;
  
  List<PainterObject> paintersObject = [
    PainterObject("Parede", "Pintar parede com cuidado, tirar o mofo"),
    PainterObject("Porta", "Lixar e deixar como nova"),
  ];

  Request(this.clienteName, this.dataInicio, this.dataFim, this.state);


  static List<Request> getAllP(){
  	return [
    	Request("Jubileu", "13/23/12", "13/23/12", "novo"),
      Request("frascis", "13/23/12", "13/23/12", "solicitacao-aceita"),
      Request("Maria", "13/23/12", "13/23/12", "orcamento-aceito"),
      Request("Dorinha", "13/23/12", "13/23/12", "em-progresso"),
      Request("Jaman", "13/23/12", "13/23/12", "orcamento-rejeitado"),
      Request("Airi", "13/23/12", "13/23/12", "cancelado-cliente"),
  	];
  }

  static List<Request> getAllC(){
  	return [
    	Request("Jubileu", "13/23/12", "13/23/12", "novo"),
      Request("frascis", "13/23/12", "13/23/12", "solicitacao-aceita"),
      Request("Maria", "13/23/12", "13/23/12", "orcamento-aceito"),
      Request("Dorinha", "13/23/12", "13/23/12", "em-progresso"),
      Request("Jaman", "13/23/12", "13/23/12", "solicitacao-rejeitada"),
      Request("Airi", "13/23/12", "13/23/12", "cancelado-pintor"),
  	];
  }
  
}
