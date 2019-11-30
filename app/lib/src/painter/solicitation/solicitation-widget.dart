import 'package:app/src/util/Request-details-widget.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/model/Request.dart';

class SolicitationWidget extends StatelessWidget {
  
  static Map<String, Map<String, dynamic>> _state = {    
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

  final  _formKey = GlobalKey<FormState>();

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
    List<ExpansionPanel> requestExpanstionPanels = Request.getAllP()
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
                        _buildAction(request.state, context)
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

  Widget _buildAction(String state, context){
    if(state == "novo")
      return _buildNewAction(context);
    else if(state == "solicitacao-aceita")
      return _buildRequestAcceptedAction();
    else if(state == "orcamento-aceito")
      return _buildAcceptedBudgetAction();
    else if(state == "em-progresso")
      return _buildInProgressAction();
    else if(state == "orcamento-rejeitado")
      return _buildBudgetRejectedAction();
    else if(state == "cancelado-cliente")
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
