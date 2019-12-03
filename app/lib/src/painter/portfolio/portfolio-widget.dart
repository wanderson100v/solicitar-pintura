import 'package:app/src/model/Service.dart';
import 'package:app/src/painter/portfolio/edit/edit-widget.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:flutter/material.dart';

class PortfolioWidget extends StatefulWidget {
  
  @override
  _PortfolioWidgetState createState() => _PortfolioWidgetState();
}

class _PortfolioWidgetState extends State<PortfolioWidget> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: Text("Portifólio", style: TextStyle(fontSize: 20))),
      _buildPortifolioExpansionPanelListWidget()
    ]));
  }

  ExpansionPanelListAdapter _buildPortifolioExpansionPanelListWidget(){
    List<ExpansionPanel> portifolioExpanstionPanels = Service.getAll()
      .map<ExpansionPanel>(
        (Service service) => _buildPortifolioExpansionPanelWidget(service)
      ).toList();
    return ExpansionPanelListAdapter(portifolioExpanstionPanels);
  }

  ExpansionPanel _buildPortifolioExpansionPanelWidget(Service service){
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Row( children: <Widget>[
          Expanded(child :Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(service.headerValue))),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: ()=>{
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditPortfolioWidget()))
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: ()=>_deleteAlert(context, service)
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
        ])
      )
    );
  }

  Future<void> _deleteAlert(context,service) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Remover serviço do portífólio?'),
          content: SingleChildScrollView(
            child: Text('Todos os dados referentes ao portifólio do serviço serão arquivados'),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Remover'),
              onPressed: () {
                setState((){
                  _buildPortifolioExpansionPanelListWidget();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
