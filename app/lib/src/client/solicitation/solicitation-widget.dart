import 'package:app/src/model/Request.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/util/Request-details-widget.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class SolicitationWidget extends StatelessWidget {

  static Map<String, Map<String, dynamic>> _state = {    
    "novo": {
      "title" : "Solicitação enviada",
      "description" : "Sua solicitação para realização de serviço foi enviada ao pintor",
    },
    "solicitacao-aceita": {
      "title" : "Solicitação aceita",
      "description" : "O pintor aceitou sua solicitação de seviço"
    },
    "orcamento-aceito": {
      "title" : "Serviço não iniciado",
      "description" : "A realização do serviço ainda não foi iniciada pelo pintor"
    },
    "em-progresso": { 
      "title" : "Serviço em andamento",
      "description" : "Esta solicitação está no momento sendo realizada"
    },
    "solicitacao-rejeitada": { 
      "title" : "Solicitação rejeitada",
      "description" : "A sua solicitação de serviço foi rejeitada pelo pintor"
    },
    "cancelado-pintor": {
      "title" : "Solicitação cancelada",
      "description" : "O pintor cancelou a solicitação de serviço"
    } 
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child:  Text("Suas solicitações", style: TextStyle(fontSize: 18)),
        ),
        _buildRequestExpansionPanelListWidget(context)
      ],
    );
  }

ExpansionPanelListAdapter _buildRequestExpansionPanelListWidget(context){
    List<ExpansionPanel> requestExpanstionPanels = Request.getAllC()
      .map<ExpansionPanel>(
        (Request request) => _buildRequestExpansionPanelWidget(request, context)
      ).toList();
    return ExpansionPanelListAdapter(requestExpanstionPanels);
  }

  ExpansionPanel _buildRequestExpansionPanelWidget(Request request, context){
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          leading: Icon(Icons.send),
          title: Text(request.clienteName),
          subtitle: Text(_state[request.state]["title"])
        );
      },
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Text(_state[request.state]["description"]),
            buildLabelDescriptionWidget("Inicio", request.dataInicio),
            buildLabelDescriptionWidget("Fim", request.dataFim),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.description),
                  onPressed: () => 
                    pushNavigator(context, 
                      RequestDetailsWidget(
                        request,
                        _state[request.state]["title"],
                        _state[request.state]["description"],
                        _buildAction(request, context)
                      )
                    )
                ),
              ],
            )
          ]
        )
      )
    );
  }

  Widget _buildAction(Request request, context){
    if(request.state == "novo")
      return _buildNewAction();
    else if(request.state == "solicitacao-aceita")
      return _buildRequestAcceptedAction(request);
    else if(request.state == "orcamento-aceito")
      return _buildAcceptedBudgetAction();
    else if(request.state == "em-progresso")
      return _buildInProgressAction();
    else if(request.state == "solicitacao-rejeitada")
      return _buildRequestRejectedAction();
    else if(request.state == "cancelado-pintor")
      return _buildPainterCanceledAction();
    else 
      return Container();

  }
  
  ButtonBar _buildNewAction(){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton()
      ],
    );
    return actionsBar;
  }

  Column _buildRequestAcceptedAction(Request request){
    return Column(
      children: <Widget>[
        buildLabelDescriptionWidget("Valor", request.value.toString()),
        ButtonBar(
          children: <Widget>[
            RaisedButton(
              child: Text("Aceitar valor"),
              onPressed: (){

              },
            ),
            RaisedButton(
              child: Text("Rejeitar valor"),
              onPressed: (){

              }
        )
      ],
    )
      ],
    );
    
   
  }

  ButtonBar _buildAcceptedBudgetAction(){
    return _buildNewAction();
  } 


  ButtonBar _buildInProgressAction(){
     return _buildNewAction();
  } 

  ButtonBar _buildRequestRejectedAction(){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text("Confirmar"),
          onPressed: (){

          },
        )
      ],
    );
    return actionsBar;
  }

  ButtonBar _buildPainterCanceledAction(){
    return _buildRequestRejectedAction();
  } 

  RaisedButton _buildCancelIconButton(){
    return RaisedButton(
      child: Text("cancelar"),
      onPressed: (){},
    );
  }
}
