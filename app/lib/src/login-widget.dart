import 'package:app/src/client/dashboeard-widget.dart';
import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Painter.dart';
import 'package:app/src/model/User.dart';
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
  final TextEditingController _passwordFieldController = TextEditingController();

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
    return buildTextFieldContainer("Senha", obscureText :true, validation:  "Senha não informada", controller: _passwordFieldController);
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

  _logar(context){
    if(_formKey.currentState.validate()){
        User.singin(_loginFieldController.text,  _passwordFieldController.text)
        .timeout(const Duration(seconds: 5), onTimeout: ()async=> showMsg(context, "O servidor demorou de mais a reposder"))
        .then((response){
          if(response is Painter)
            pushReplacementNavigator(context, PainterDashboardWidget());
          else if(response is Customer)
            pushReplacementNavigator(context, ClientDashboardWidget());
          else if(response is Msg)
            showMsg(context, "Usuário inválido");
          else
            print("Sou ningém");
        })
        .catchError((erro){
          print(erro);
          showMsg(context, "Erro ao logar");
        });
    }
  }
}

