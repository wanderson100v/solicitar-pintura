import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Painter.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:app/src/login-widget.dart';
import 'package:flutter/material.dart';

class PainterRegisterFormWidget extends StatelessWidget {

  Widget build(BuildContext context) {
    return buildScaffold(
      "Cadastro passo 2 ", 
      Column(
        children :<Widget>[
          Center(child:Text("Pintor")),
          MyForm()
        ]
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
  final TextEditingController _loginFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  final TextEditingController _confirmPasswordFieldController = TextEditingController();
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _emailFieldController = TextEditingController();
  final TextEditingController _telFieldController = TextEditingController();
  final TextEditingController _descriptionFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildLoginWidget(),
          _buildPasswordWidget(),
          _buildConfirmPasswordWidget(),
          _buildNameWidget(),
          _buildDescriptionWidget(),
          _buildEmailWidget(),
          _buildTelWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  Painter painter = new Painter();
                  painter.description = _descriptionFieldController.text;
                  painter.name = _nameFieldController.text;
                  painter.login = _loginFieldController.text;
                  painter.email = _emailFieldController.text;
                  painter.telNumber = _telFieldController.text;

                  Msg msg = await painter.create(_passwordFieldController.text, _confirmPasswordFieldController.text);
                  showMsg(context, msg.msgText);
                 // pushNavigator(context, LoginWidget());
                }else{
                  showMsg(context,'Um ou mais campos inválidos');
                }
              },
              child: Text('Próximo'),
            ),
          ),
        ],
      ),
    );
  }
  

  Widget _buildDescriptionWidget(){
    return buildTextFieldContainer("Descrição", validation: "Nome completo não informado", controller: _descriptionFieldController);
  }

  Widget _buildLoginWidget(){
     return buildTextFieldContainer("Login", validation: "Login não informado", controller: _loginFieldController);
  }

  Widget _buildPasswordWidget(){
    return buildTextFieldContainer("Senha", obscureText: true, validation: "Senha não informada", controller: _passwordFieldController);
  }
  
  Widget _buildConfirmPasswordWidget(){
    return buildTextFieldContainer("Confirmação de senha", obscureText: true, validation: "Confirmação da senha não informada", controller: _confirmPasswordFieldController);
  }

  Widget _buildNameWidget(){
    return buildTextFieldContainer("Nome completo", validation: "Nome completo não informado", controller: _nameFieldController);
  }

  Widget _buildEmailWidget(){
    return buildTextFieldContainer("E-mail", controller: _emailFieldController);
  }

  Widget _buildTelWidget(){
    return buildTextFieldContainer("Telefone", controller: _telFieldController);
  }
}
