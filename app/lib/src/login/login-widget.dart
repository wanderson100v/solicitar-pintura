import 'package:app/src/client/dashboard/dashboeard-widget.dart';
import 'package:app/src/painter/dashboard/dashboeard-widget.dart';
import 'package:app/src/register/select-user-type/select-user-type-widget.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
     return _buildTextFieldContainer("Login", false, "Login não informado", controller :_loginFieldController );
  }

  Widget _buildPasswordWidget(){
    return _buildTextFieldContainer("Senha", true, "Senha não informada");
  }

  Widget _buildTextFieldContainer(String labelText, bool obscureText, String validation, {controller}){
    Padding textFieldContainer = Padding( 
        padding: EdgeInsets.fromLTRB(20,10,20,10),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
          ),
          validator: (value) {
            if (value.isEmpty) {
              return validation;
            }
            return null;
          },
        ),
      );
    return textFieldContainer;
  }

  Widget _buildButtonBarWidget(context){
    ButtonBar buttonBar = ButtonBar(children: <Widget>[
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context, 
                MaterialPageRoute(builder :(context) =>SelectUserTypeWidget()));
            },
            child: Text("Cadastrar-se"), 
          ),
          RaisedButton(
            onPressed: () {
              if(_formKey.currentState.validate()){
                Widget dashBoard;
                if(_loginFieldController.text =="pintor")
                  dashBoard = PainterDashboardWidget();
                else if(_loginFieldController.text =="cliente")
                  dashBoard = ClientDashboardWidget();
                if(dashBoard != null)
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder :(context) => dashBoard
                  ));
                else
                 Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Usuário inválido')));
              }
            },
            child: Text("Entrar")
          )
        ]
      );
     return buttonBar;
  }
}

