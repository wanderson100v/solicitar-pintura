import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class EditAcessDataWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return buildScaffold("Editar Perfil",
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Editar dados de acesso", style: TextStyle(fontSize: 20))),
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildLoginWidget(),
          _buildPasswordWidget(),
          _buildNewPasswordWidget(),
          _buildConfirmPasswordWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                
              },
              child: Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }

   Widget _buildLoginWidget(){
     return buildTextFieldContainer("Login", validation:  "Login não informado");
  }

  Widget _buildPasswordWidget(){
    return buildTextFieldContainer("Senha", obscureText : true, validation: "Senha não informada");
  }
  
   
  Widget _buildNewPasswordWidget(){
    return buildTextFieldContainer("Nova senha", obscureText: true);
  }


  Widget _buildConfirmPasswordWidget(){
    return buildTextFieldContainer("Confirmação de senha", obscureText:true);
  }

    
}