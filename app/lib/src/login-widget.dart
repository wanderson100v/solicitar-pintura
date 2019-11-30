import 'package:app/src/client/dashboeard-widget.dart';
import 'package:app/src/painter/dashboeard-widget.dart';
import 'package:app/src/register/select-user-type-widget.dart';
import 'package:app/src/util/functions.dart';
import 'package:flutter/material.dart';
import 'package:app/src/util/widget-factory.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top:60),
          child: LoginForm()
        ),
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
       key: _formKey,
       child: Column(
            children: <Widget>[
              Container(
                height: 100,
                child :Image.asset("assets/logo.png"),
              ),
              _buildLoginWidget(),
              _buildPasswordWidget(),
              _buildButtonBarWidget(context)
            ],
          ),
    );
  }

  Widget _buildLoginWidget(){
     return buildTextFieldContainer("Login", validation: "Login não informado", controller :_loginFieldController );
  }

  Widget _buildPasswordWidget(){
    return buildTextFieldContainer("Senha", obscureText :true, validation:  "Senha não informada");
  }

  Widget _buildButtonBarWidget(context){
    ButtonBar buttonBar = ButtonBar(children: <Widget>[
          RaisedButton(
            onPressed: ()=> pushNavigator(context, SelectUserTypeWidget()),
            child: Text("Cadastrar-se"), 
          ),
          RaisedButton(
            onPressed: ()=> _logar(context),
            child: Text("Entrar")
          )
        ]
      );
     return buttonBar;
  }

  void _logar(context){
    if(_formKey.currentState.validate()){
      Widget dashBoard;
      if(_loginFieldController.text =="p")
        dashBoard = PainterDashboardWidget();
      else if(_loginFieldController.text =="c")
        dashBoard = ClientDashboardWidget();
      if(dashBoard != null)
        pushReplacementNavigator(context, dashBoard);
      else
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Usuário inválido')));
    }
  }
}

