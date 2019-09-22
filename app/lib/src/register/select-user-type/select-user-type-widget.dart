
import 'package:app/src/register/register/register-form-widget.dart';
import 'package:flutter/material.dart';

class SelectUserTypeWidget extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    Scaffold cadastroWidget = Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Passo 1"),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
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
          )
        )
      ),
    );
    return cadastroWidget;
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
    var action = ()=>{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFormWidget("Cadastro Cliente")))
    };
    Widget clientWidget =  _createOptionWidget(title, description, icon, action);
    return clientWidget;    
  }

  Widget _buildPainterWidget(context){
    String title = "Pintor";
    String description = "dasdda dasdadas dadsa\n"+
                "dasdda dasdadas dadsa\n"+
                "dasdda dasdadas dadsa\n";
    var icon = Icons.format_paint;
    var action = ()=>{
      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterFormWidget("Cadastro Pintor")))
    };
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
