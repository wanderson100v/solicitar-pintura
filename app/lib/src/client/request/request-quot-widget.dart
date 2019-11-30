import 'package:app/src/client/request/details-widget.dart';
import 'package:app/src/client/request/object-details-widget.dart';
import 'package:app/src/model/PainterObject.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class RequestQuot extends StatefulWidget {
  @override
  _RequestQuotState createState() => _RequestQuotState();
}

class _RequestQuotState extends State<RequestQuot> {
  
  List<PainterObject> paintersObject;

  @override
  Widget build(BuildContext context) {
    return buildScaffold("Solicitação",
      Column(
        children: <Widget>[
          Row( children: <Widget>[
              Text("O que deseja pintar?", style: TextStyle(fontSize: 18)),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => pushNavigator(context, ObjectDetailsWidget(addPainterObjectObject))
              ),
            ],
          ),
           _buildPainterObjectExpansionPanelListWidget(),
          RaisedButton(
            child: Text("Próximo"),
            onPressed: () => pushNavigator(context,DetailsWidget())
          )
        ]
      )
    );
  }

  Widget _buildPainterObjectExpansionPanelListWidget(){
    if(paintersObject != null){
      List<ExpansionPanel> paintersObjectPanel = paintersObject.map<ExpansionPanel>((PainterObject painterObject)=>_buildPainterObjectExpansionPanelWidget(painterObject)).toList();
      return ExpansionPanelListAdapter(paintersObjectPanel);
    }
    else
      return Text("Não foi especificado o objeto a ser pintado");
  }

  ExpansionPanel _buildPainterObjectExpansionPanelWidget(PainterObject painterObject){
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                    title:Row( 
                    children : <Widget>[
                      Expanded(child: Text(painterObject.title)),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: (){
                          setState((){
                            paintersObject.remove(painterObject);
                          });
                        },
                      )
                    ]
                  )
                  );
              },
              body: Padding(
                padding: EdgeInsets.all(10),
                child:Column(
                  children: <Widget>[    
                  Text(painterObject.description),
                  Padding(
                    padding: EdgeInsets.only(top:10, bottom: 5),
                    child:Text("Imagem", style: TextStyle(fontSize: 18),)
                  ),
                  Icon(Icons.image, size: 150,),
                  Padding(
                    padding: EdgeInsets.only(top:10, bottom: 5),
                    child:Text("Cor", style: TextStyle(fontSize: 18),)
                  ),
                  Container(
                    height: 50,
                    color: Colors.red,
                  )
              ])),
    );
  }

  addPainterObjectObject(painterObjectObject){
    if(painterObjectObject != null){
      setState(()=>
        paintersObject.add(painterObjectObject)
      );
    }
  } 
}