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
    "finalizado": { 
      "title" : "Serviço finalizado",
      "description" : "O pintor definiu o serviço como concluído"
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
          child: Row(children:[ 
            Text("Suas solicitações", style: TextStyle(fontSize: 18)),
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed:() =>_attRequests()
            ) ,
          ])
        ),
        _buildRequestExpansionPanelListWidget(context)
      ],
    );
  }
  _attRequests(){
    Request.readClientId(Customer.customerOn.id)
    .then((resquestsQuery){
      setState((){
        SolicitationWidget._requests = resquestsQuery;
      });
    });
  }

  Widget _buildRequestExpansionPanelListWidget(context){

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
          leading: Icon(Icons.work),
          title: Text(request.painter.name),
          subtitle: Text(SolicitationWidget._state[request.situation]["title"])
        );
      },
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Text(SolicitationWidget._state[request.situation]["description"]),
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
      return _buildNewAction(request);
    else if(request.situation == "solicitacao-aceita")
      return _buildRequestAcceptedAction(request);
    else if(request.situation == "orcamento-aceito")
      return _buildAcceptedBudgetAction(request);
    else if(request.situation == "em-progresso")
      return _buildInProgressAction(request);
    else if(request.situation == "finalizado")
      return _buildFinalizeAction(request);
    else if(request.situation == "solicitacao-rejeitada")
      return _buildRequestRejectedAction(request);
    else if(request.situation == "cancelado-pintor")
      return _buildPainterCanceledAction(request);
    else 
      return Container();

  }

  ButtonBar _buildNewAction(Request request){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton(request)
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
              child: Text("Rejeitar valor"),
              onPressed: (){
                 request.situation = "orcamento-rejeitado";
                    request.update().then((response){
                      _attRequests();
                      showAlert(context, "Alerta", "mensagem enviada para usuário informando sua rejeição ao orçamento proposto");
                    });
              }
          ),
          RaisedButton(
              child: Text("Aceitar valor"),
              onPressed: (){
                 request.situation = "orcamento-aceito";
                    request.update().then((response){
                      _attRequests();
                      showAlert(context, "Alerta", "mensagem enviada para usuário informando sua aceitação do orçamento");
                    });
              },
            ),
      ],
    )
      ],
    );
    
   
  }

  ButtonBar _buildAcceptedBudgetAction(Request request){
    return _buildNewAction(request);
  } 

  ButtonBar _buildInProgressAction(Request request){
     return _buildNewAction(request);
  } 

  ButtonBar _buildRequestRejectedAction(Request request){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text("Confirmar"),
          onPressed: (){
             request.situation = "historico";
                request.update().then((response){
                  _attRequests();
                  showAlert(context, "Alerta", "Requisição arquivada");
              });
          },
        )
      ],
    );
    return actionsBar;
  }

   ButtonBar _buildFinalizeAction(Request request){
    return _buildRequestRejectedAction(request);
  }

  ButtonBar _buildPainterCanceledAction(Request request){
    return _buildRequestRejectedAction(request);
  } 

  RaisedButton _buildCancelIconButton(Request request){
    return RaisedButton(
      child: Text("cancelar"),
      onPressed: (){
         request.situation = "cancelado-cliente";
            request.update().then((response){
              _attRequests();
              showAlert(context, "Alerta", "mensagem enviada para usuário informando o cancelamento da requisição");
          });
      },
    );
  }
}
