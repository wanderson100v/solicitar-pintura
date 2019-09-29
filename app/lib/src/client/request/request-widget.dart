
import 'package:app/src/default-widgets/label-description-widget.dart';
import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:app/src/painter/portfolio/portfolio-widget.dart';
import 'package:flutter/material.dart';

class RequestWidget extends StatefulWidget {
  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {
  static List<Painter> painters = [
    Painter(name: "Jubileu",description: "O melhor pintor da cidade",  dayliValue: 80, squareMeterValue: 20),
    Painter(name: "Severino",description: "Barato e rápido", dayliValue: 90, squareMeterValue: 40),
    Painter(name: "Frederico",description: "Seu serviço em dois palito", dayliValue: 70, squareMeterValue: 15),
    Painter(name: "Jubileu",description: "O melhor pintor da cidade",  dayliValue: 80, squareMeterValue: 20),
    Painter(name: "Severino",description: "Barato e rápido", dayliValue: 90, squareMeterValue: 40),
    Painter(name: "Frederico",description: "Seu serviço em dois palito", dayliValue: 70, squareMeterValue: 15),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pintores"),
        centerTitle: true,
      ),
      body:  Container(
        padding: EdgeInsets.all(10),
        child: ListView( children: <Widget>[
            Row(children :<Widget>[
              Expanded(child:TextFormFieldWidget("buscar", false,"Busca em branco")) ,
              IconButton(
                icon: Icon(Icons.search),
                onPressed : (){}
              )
            ]),
            Container(
              padding: EdgeInsets.all(2),
              child:_buildPainterExpansionPanelListWidget())
          ]
        ),
      ) 
    );
  }
  

  ExpansionPanelList _buildPainterExpansionPanelListWidget(){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
          setState(() {
            painters[index].isExpanded = !isExpanded;
          });
        },
        children: painters.map<ExpansionPanel>((Painter painter) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                    leading: Icon(Icons.format_paint),
                    title: Text(painter.name), 
                    subtitle: Text(painter.description)
                  );
              },
              body: Column(children: <Widget>[    
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text("Valores cobrados", style: TextStyle(fontSize: 18),),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child :LabelDescriptionWidget("Diária", painter.dayliValue.toString())
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child :LabelDescriptionWidget("Metro quadrado", painter.squareMeterValue.toString()),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("Portifólio", style: TextStyle(fontSize: 18),),
                ),
                Container(
                  padding :EdgeInsets.all(10),
                  child: _buildPortifolioExpansionPanelListWidget(painter.services)
                )
              ]),
              isExpanded: painter.isExpanded);
        }).toList());
  }

  ExpansionPanelList _buildPortifolioExpansionPanelListWidget(List<Service> services){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
          setState(() {
            services[index].isExpanded = !isExpanded;
          });
        },
        children: services.map<ExpansionPanel>((Service service) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                    title: Text(service.headerValue),
                  );
              },
              body: Column(children: <Widget>[    
                Text(service.expandedValue),
                Text("Imagens", style: TextStyle(fontSize: 18),),
                Row(
                  children: <Widget>[
                    Icon(Icons.image, size: 90),
                    Icon(Icons.image, size: 90),
                    Icon(Icons.image, size: 90),
                  ],
                ),
              ]),
              isExpanded: service.isExpanded);
        }).toList());
  }
}

class Painter{
  String name;
  Image image;
  double dayliValue;
  double squareMeterValue;
  String description;
  bool isExpanded;
  List<Service> services = [
    Service(headerValue: "Serviço tal", expandedValue: "Serviço realizado com tais procedimentos"),
    Service(headerValue: "Serviço tal2", expandedValue: "Serviço realizado com tais procedimentos2"),
  ];

  Painter({this.name, this.image, this.description, this.dayliValue, this.squareMeterValue, this.isExpanded = false});

}
