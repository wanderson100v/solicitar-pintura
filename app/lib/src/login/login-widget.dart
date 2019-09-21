import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: AppBar(title: Text("Login"), centerTitle: true),
      body:Container(
          padding: EdgeInsets.only(top:60),
          child: Column(
            children: <Widget>[
              Image.asset("assets/logo.png"),
              Padding( 
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Login',
                  ),
                ),
              ),
              Padding( 
                padding: EdgeInsets.fromLTRB(20,10,20,10),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                  ),
                ),
              ),
              ButtonBar(children: <Widget>[
                RaisedButton(
                  onPressed: () {},
                  child: Text("Cadastrar-se"), 
                ),
                RaisedButton(
                  onPressed: () {},
                  child: Text("Entrar")
                )
              ],)
            ],
          )
        )
    );
  }
}