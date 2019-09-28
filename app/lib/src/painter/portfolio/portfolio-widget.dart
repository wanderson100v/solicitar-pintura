import 'dart:io';

import 'package:app/src/painter/portfolio/edit/edit-portfolio.dart';
import 'package:flutter/material.dart';

class PortfolioWidget extends StatefulWidget {
  @override
  _PortfolioWidgetState createState() => _PortfolioWidgetState();
}

class _PortfolioWidgetState extends State<PortfolioWidget> {
  List<Service> _data = [
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
            "Descrição de teste para serviço 3, pintura rustica, estilo especializado"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text("Portifólio", style: TextStyle(fontSize: 20))),
      ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            _data[index].isExpanded = !isExpanded;
          });
        },
        children: _data.map<ExpansionPanel>((Service service) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return Row( children: <Widget>[
                  Expanded(child :Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(service.headerValue))),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: ()=>{
                      Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditPortfolioWidget(service)))
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: ()=>_deleteAlert(context)
                  ),
                  ]
                );
              },
              body: Container(
                  child: Column(children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      service.expandedValue,
                      softWrap: true,
                    )),
                Text("Imagens"),
                Row(
                  children: <Widget>[
                    Icon(Icons.image, size: 90),
                    Icon(Icons.image, size: 90),
                    Icon(Icons.image, size: 90),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.image, size: 90),
                    Icon(Icons.image, size: 90),
                    Icon(Icons.image, size: 90),
                  ],
                )
              ])),
              isExpanded: service.isExpanded);
        }).toList(),
      ),
    ]));
  }

  Future<void> _deleteAlert(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You will never be satisfied.'),
                Text('You\’re like me. I’m never satisfied.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class Service {
  String expandedValue;
  String headerValue;
  bool isExpanded;
  List<File> images = [];

  Service({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });
}