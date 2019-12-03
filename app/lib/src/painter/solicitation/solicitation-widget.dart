import 'package:app/src/model/Painter.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/util/Request-details-widget.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';
import 'package:app/src/model/Request.dart';

class SolicitationWidget extends StatefulWidget {
  
  static List<Request> _requests;

  static Map<String, Map<String, dynamic>> _situation = {    
      "novo": {
        "title" : "Nova solicitação",
        "description" : "Você possui uma nova solicitação não respondida",
      },
      "solicitacao-aceita": {
        "title" : "Solicitação aceita",
        "description" : "Esta solicitação foi aceita por você e esta a espera de confirmação do cliente"
      },
      "orcamento-aceito": {
        "title" : "Orçamento aceito",
        "description" : "O cliente aceitou o valor definido para a realização serviço"
      },
      "em-progresso": { 
        "title" : "Solicitação em progresso",
        "description" : "Esta solicitação está no momento sendo realizada"
      },
      "finalizado": { 
        "title" : "Serviço finalizado",
        "description" : "Esta solicitação foi finalizada e esta aguardando confirmação do cliente"
      },
      "orcamento-rejeitado": { 
        "title" : "Orçamento rejeitado",
        "description" : "O cliente não aceitou o valor definido para a realização serviço"
      },
      "cancelado-cliente": {
        "title" : "Solicitação cancelada",
        "description" : "O cliente cancelou a solicitação de serviço"
      } 
    };

  @override
  _SolicitationWidgetState createState() => _SolicitationWidgetState();
}

class _SolicitationWidgetState extends State<SolicitationWidget> {
  final  _formKey = GlobalKey<FormState>();

  final TextEditingController _amountFieldController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
           padding: EdgeInsets.symmetric(vertical: 10),
          child:  Row(children:[ 
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
    Request.readPainterId(Painter.painterOn.id)
    .then((resquestsQuery){
      setState((){
        SolicitationWidget._requests = resquestsQuery;
      });
    });
  }

  Widget _buildRequestExpansionPanelListWidget(context) {
    
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
          title: Text(request.customer.name),
          subtitle: Text(SolicitationWidget._situation[request.situation]["title"])
        );
      },
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Text(SolicitationWidget._situation[request.situation]["description"]),
            ButtonBar(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.description),
                  onPressed: () => 
                    pushNavigator(context, 
                      RequestDetailsWidget(
                        request,
                        SolicitationWidget._situation[request.situation]["title"],
                        SolicitationWidget._situation[request.situation]["description"],
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
    String situation = request.situation;
    if(situation == "novo")
      return _buildNewAction(context, request);
    else if(situation == "solicitacao-aceita")
      return _buildRequestAcceptedAction(request);
    else if(situation == "orcamento-aceito")
      return _buildAcceptedBudgetAction(request);
    else if(situation == "em-progresso")
      return _buildInProgressAction(request);
    else if(situation == "finalizado")
      return _buildFinishAction(request);
    else if(situation == "orcamento-rejeitado")
      return _buildBudgetRejectedAction(request);
    else if(situation == "cancelado-cliente")
      return _buildCustomerCanceledAction(request);
    else 
      return Container();

  }

  Form _buildNewAction(context, Request request){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          buildTextFieldContainer("Valor", validation: "Valor não informado", controller: _amountFieldController),
          Row(
            children :<Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: () {
                    request.situation = "solicitacao-rejeitada";
                    request.update().then((response){
                      _attRequests();
                      showAlert(context, "Alerta", "mensagem enviada para usuário informando sua rejeição de requisição");
                    });
                },
                child: Text('Regeitar'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    request.amount = double.parse(_amountFieldController.text);
                    request.situation = "solicitacao-aceita";
                    request.update().then((response){
                      showAlert(context, "Alerta", "mensagem enviada para usuário informando sua aceitação de requisição");
                    });
                  }else{
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Um ou mais campos inválidos')));
                  }
                },
                child: Text('Aceitar'),
              ),
              )
            ]),
        ],
      ),
    );
  }

  ButtonBar _buildRequestAcceptedAction(Request request){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton(request)
      ],
    );
    return actionsBar;
  }

  ButtonBar _buildAcceptedBudgetAction(Request request){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton(request),
        RaisedButton(
          child: Text("iniciar serviço"),
          onPressed: (){
             request.situation = "em-progresso";
              request.update().then((response){
                _attRequests();
                showAlert(context, "Alerta", "mensagem enviada para usuário informando o ínicio da realização do serviço");
              });
          },
        )
      ],
    );
    return actionsBar;
  } 

  ButtonBar _buildInProgressAction(Request request){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton(request),
        RaisedButton(
          child: Text("Finalizar serviço"),
          onPressed: (){
             request.situation = "finalizado";
              request.update().then((response){
                _attRequests();
                showAlert(context, "Alerta", "mensagem enviada para o cliente informando a finalização do serviço");
              });
          },
        )
      ],
    );
    return actionsBar;
  } 
  
  Container _buildFinishAction(Request request){
    return Container();
  }


  ButtonBar _buildBudgetRejectedAction(Request request){
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

  ButtonBar _buildCustomerCanceledAction(Request request){
    return _buildBudgetRejectedAction(request);
  } 

  RaisedButton _buildCancelIconButton(Request request){
    return RaisedButton(
      child: Text("cancelar"),
      onPressed: (){
        request.situation = "cancelado-pintor";
          request.update().then((response){
            _attRequests();
            showAlert(context, "Alerta", "Uma mensagem informando o cancelamento da requisição foi enviada ao cliente");
          });
      },
    );
  }
}
