import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:app/src/login-widget.dart';
import 'package:flutter/material.dart';

class RegisterFormWidget extends StatelessWidget {

  final String title;

  RegisterFormWidget(this.title);

  Widget build(BuildContext context) {
    return buildScaffold(
      "Cadastro passo 2 ", 
      Column(
        children :<Widget>[
          Center(child:Text(title)),
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
          _buildEmailWidget(),
          _buildTelWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  pushNavigator(context, LoginWidget());
                }else{
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Um ou mais campos inválidos')));
                }
              },
              child: Text('Próximo'),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLoginWidget(){
     return buildTextFieldContainer("Login", validation: "Login não informado");
  }

  Widget _buildPasswordWidget(){
    return buildTextFieldContainer("Senha", obscureText: true, validation: "Senha não informada");
  }
  
  Widget _buildConfirmPasswordWidget(){
    return buildTextFieldContainer("Confirmação de senha", obscureText: true, validation: "Confirmação da senha não informada");
  }

  Widget _buildNameWidget(){
    return buildTextFieldContainer("Nome completo", obscureText: true, validation: "Nome completo não informado");
  }

  Widget _buildEmailWidget(){
    return buildTextFieldContainer("E-mail", obscureText: true);
  }

  Widget _buildTelWidget(){
    return buildTextFieldContainer("Telefone", obscureText: true);
  }
}
