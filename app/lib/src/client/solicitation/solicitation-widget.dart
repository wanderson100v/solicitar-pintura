import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Request.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/util/Request-details-widget.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class SolicitationWidget extends StatefulWidget {

  static List<Request> _requests;

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
  _SolicitationWidgetState createState() => _SolicitationWidgetState();
}

class _SolicitationWidgetState extends State<SolicitationWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child:  Text("Suas solicitações", style: TextStyle(fontSize: 18)),
        ),
        _buildRequestExpansionPanelListWidget(context)
      ],
    );
  }

Widget _buildRequestExpansionPanelListWidget(context){
    Request.readPainterId(Customer.customerOn.id)
    .then((resquestsQuery){
      if(resquestsQuery != null && (SolicitationWidget._requests == null || SolicitationWidget._requests.length != resquestsQuery.length )){
        setState((){
          SolicitationWidget._requests = resquestsQuery;
        });
      }
    });
    if(SolicitationWidget._requests == null || SolicitationWidget._requests.isEmpty)
      return Center(child: Text("Nenhuma solicitação para mostrar"));
    else{
      List<ExpansionPanel> requestsEp = SolicitationWidget._requests
        .map<ExpansionPanel>((Request request) => _buildRequestExpansionPanelWidget(request, context))
        .toList();
      return ExpansionPanelListAdapter(requestsEp);
    }
  }

  ExpansionPanel _buildRequestExpansionPanelWidget(Request request, context){
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          leading: Icon(Icons.send),
          title: Text(request.painter.name),
          subtitle: Text(SolicitationWidget._state[request.situation]["title"])
        );
      },
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Text(SolicitationWidget._state[request.situation]["description"]),
            buildLabelDescriptionWidget("Inicio", request.startDate.toString()),
            buildLabelDescriptionWidget("Fim", request.endDate.toString()),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.description),
                  onPressed: () => 
                    pushNavigator(context, 
                      RequestDetailsWidget(
                        request,
                        SolicitationWidget._state[request.situation]["title"],
                        SolicitationWidget._state[request.situation]["description"],
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
    if(request.situation == "novo")
      return _buildNewAction();
    else if(request.situation == "solicitacao-aceita")
      return _buildRequestAcceptedAction(request);
    else if(request.situation == "orcamento-aceito")
      return _buildAcceptedBudgetAction();
    else if(request.situation == "em-progresso")
      return _buildInProgressAction();
    else if(request.situation == "solicitacao-rejeitada")
      return _buildRequestRejectedAction();
    else if(request.situation == "cancelado-pintor")
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
        buildLabelDescriptionWidget("Valor", request.amount.toString()),
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
