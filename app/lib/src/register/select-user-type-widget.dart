import 'package:app/src/register/client-register-form-widget.dart';
import 'package:app/src/register/painter-register-form-widget.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class SelectUserTypeWidget extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    Column column =  Column(
      children: <Widget>[
        Center(
          child: Text(
            "Desejo ser um", 
            style:  TextStyle(fontSize: 18)
            )
        ),
        _buildDivider(),
        _buildClientWidget(context),
        _buildDivider(),
        _buildPainterWidget(context)
      ],
    );
    return buildScaffold("Cadastro passo 1", column);
  }

  Widget _buildDivider(){
     return Padding(
        padding: EdgeInsets.only(bottom: 5),
        child: Divider(),
      );
  }

  Widget _buildClientWidget(context){
    String title = "Cliente";
    String description = "dasdda dasdadas dadsa\n"+
                "dasdda dasdadas dadsa\n"+
                "dasdda dasdadas dadsa\n";
    var icon = Icons.person_outline;
    var action = () => pushNavigator(context, ClientRegisterFormWidget());
    Widget clientWidget =  _createOptionWidget(title, description, icon, action);
    return clientWidget;    
  }

  Widget _buildPainterWidget(context){
    String title = "Pintor";
    String description = "dasdda dasdadas dadsa\n"+
                "dasdda dasdadas dadsa\n"+
                "dasdda dasdadas dadsa\n";
    var icon = Icons.format_paint;
    var action = () => pushNavigator(context, PainterRegisterFormWidget()); 
    Widget painterWidget =  _createOptionWidget(title, description, icon, action);
    return painterWidget;           
  }

  Widget _createOptionWidget(String title,String description ,icon, action){
    Container optionWidget = Container(
      width: 300,
      child :RaisedButton(
        onPressed: action,
        child: Padding(
          padding: EdgeInsets.all(5),
          child:Column(
            children: <Widget>[
              Center(child: Text(title, style: TextStyle(fontWeight:  FontWeight.bold))),
              _buildDivider(),
              Row(
                children : <Widget>[
                  Icon(
                    icon,
                    size: 64,
                    color: Colors.blueAccent
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                  ),
                  Text(description)
                ]
              ),
            ],
          )
        )
      )
    );
    return optionWidget;
  }

}
