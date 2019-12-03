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

Widget _buildRequestExpansionPanelListWidget(context) {
    Request.readPainterId(Painter.painterOn.id)
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
          title: Text(request.customer.name),
          subtitle: Text(SolicitationWidget._situation[request.situation]["title"])
        );
      },
      body: Padding(
        padding: EdgeInsets.all(10),
        child:Column(
          children: <Widget>[
            Text(SolicitationWidget._situation[request.situation]["description"]),
            buildLabelDescriptionWidget("Inicio", request.startDate.toString()),
            buildLabelDescriptionWidget("Fim", request.startDate.toString()),
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
                        _buildAction(request.situation, context)
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

  Widget _buildAction(String situation, context){
    if(situation == "novo")
      return _buildNewAction(context);
    else if(situation == "solicitacao-aceita")
      return _buildRequestAcceptedAction();
    else if(situation == "orcamento-aceito")
      return _buildAcceptedBudgetAction();
    else if(situation == "em-progresso")
      return _buildInProgressAction();
    else if(situation == "orcamento-rejeitado")
      return _buildBudgetRejectedAction();
    else if(situation == "cancelado-cliente")
      return _buildCustomerCanceledAction();
    else 
      return Container();

  }

  Form _buildNewAction(context){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          buildTextFieldContainer("Valor", validation: "Valor não informado"),
          Row(
            children :<Widget>[
            Padding(
              padding: const EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: () {
                    Navigator.of(context).pop();
                },
                child: Text('Regeitar'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    //Navigator.push(context, MaterialPageRoute(builder :(context) => ()));
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

  ButtonBar _buildRequestAcceptedAction(){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton()
      ],
    );
    return actionsBar;
  }

  ButtonBar _buildAcceptedBudgetAction(){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton(),
        RaisedButton(
          child: Text("iniciar serviço"),
          onPressed: (){

          },
        )
      ],
    );
    return actionsBar;
  } 

  ButtonBar _buildInProgressAction(){
    ButtonBar actionsBar = new ButtonBar(
      children: <Widget>[
        _buildCancelIconButton(),
        RaisedButton(
          child: Text("Finalizar serviço"),
          onPressed: (){

          },
        )
      ],
    );
    return actionsBar;
  } 

  ButtonBar _buildBudgetRejectedAction(){
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

  ButtonBar _buildCustomerCanceledAction(){
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

  RaisedButton _buildCancelIconButton(){
    return RaisedButton(
      child: Text("cancelar"),
      onPressed: (){},
    );
  }
}
