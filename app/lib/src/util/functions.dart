import 'package:flutter/material.dart';

void pushNavigator(context, page){
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder : (context) => page)
  );
}

void pushReplacementNavigator(context, page){
  Navigator.pushReplacement(
    context, 
    MaterialPageRoute(builder :(context) => page)
  );
}

void showMsg(context, msg){
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
}

void showAlert(context, title, content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: new Text(title),
        content: new Text(content),
        actions: <Widget>[
          // define os botões na base do dialogo
          new FlatButton(
            child: new Text("Fechar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}