import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class DeactivateAccountWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  return buildScaffold("Editar Perfil",
    Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Desativar conta", style: TextStyle(fontSize: 20))),
          Center(child:Text("Realmente desava desativar\n sua conta de usuário? Você\n não terá mais acesso ao sistema.")),
          MyForm()
        ],
      )
    );
  }
}


class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          buildTextFieldContainer("Senha", obscureText : true, validation:"Senha deve ser informada"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                
              },
              child: Text('Desativar'),
            ),
          ),
        ],
      ),
    );
  }
    
}