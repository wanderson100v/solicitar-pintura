import 'package:app/src/client/request/painter-details-widget.dart';
import 'package:app/src/client/request/request-quot-widget.dart';
import 'package:app/src/model/Painter.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class RequestWidget extends StatefulWidget {
  @override
  _RequestWidgetState createState() => _RequestWidgetState();
}

class _RequestWidgetState extends State<RequestWidget> {

  static List<Painter> painters;

  TextEditingController _queryFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildScaffold(
        "Pintores",
        Column(children: <Widget>[
          _buildFindConteiner(context),
          _buildPainterExpansionListPanel()
        ]));
  }

  Form _buildFindConteiner(c) {
    return Form(child: Row(children: <Widget>[
      Expanded(
          child: buildTextFieldContainer("buscar", validation: "Busca em branco", controller: _queryFieldController)),
      IconButton(icon: Icon(Icons.search), onPressed: ()=>
          Painter.read(_queryFieldController.text).then((response){
            setState((){
              painters = response;
            });
          }
          ).catchError((erro){
            showMsg(c, "Erro ao buscar pintores");
          })
      )
    ]));
  }

  Widget _buildPainterExpansionListPanel(){
    if(painters == null)
      return Container(child: Text(""));
    else{
      List<ExpansionPanel> paintesExpensionPane = painters.map<ExpansionPanel>((Painter painter)=> _buildPainterExpansionPanel(painter)).toList();
      return ExpansionPanelListAdapter(paintesExpensionPane);
    }
  }
  
  ExpansionPanel _buildPainterExpansionPanel(painter) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
            leading: Icon(Icons.format_paint),
            title: Text(painter.name),
            subtitle: Text(painter.description));
      },    
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: <Widget>[
            Text(
              "Valores cobrados",
              style: TextStyle(fontSize: 18),
            ),
            buildLabelDescriptionWidget("Diária", painter.dayliValue.toString()),
            buildLabelDescriptionWidget("Metro quadrado",painter.squareMeterValue.toString()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Expanded(child: Container()),
                IconButton(
                  icon: Icon(Icons.description),
                  onPressed: () => pushNavigator(context, PainterDetailsWidget(painter))
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => pushNavigator(context, RequestQuot(painter)),
                )
              ]
            )
          ]
        )
      )
    );
  }
}