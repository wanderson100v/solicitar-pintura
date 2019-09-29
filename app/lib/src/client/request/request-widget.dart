
import 'package:app/src/client/request/painter-details/painter-details-widget.dart';
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
                    title:Text(painter.name),
                    subtitle: Text(painter.description)
                  );
              },
              body: Padding(
                padding: EdgeInsets.all(10),
                child:Column(children: <Widget>[    
                  Text("Valores cobrados", style: TextStyle(fontSize: 18),),
                  LabelDescriptionWidget("Diária", painter.dayliValue.toString()),
                  LabelDescriptionWidget("Metro quadrado", painter.squareMeterValue.toString()),
                  Row( 
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children : <Widget>[
                      Expanded(child: Container()),
                      IconButton(
                        icon: Icon(Icons.description),
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PainterDetailsWidget(painter)));
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.send),
                        onPressed: (){},
                      )
                    ]
                  )
              ])),
              isExpanded: painter.isExpanded);
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
