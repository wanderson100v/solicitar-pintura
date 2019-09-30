import 'package:app/src/client/solicitation/request-history/request-history-widget.dart';
import 'package:flutter/material.dart';

class SolicitationWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10),
          child:  Text("Solicitações", style: TextStyle(fontSize: 18)),
        ),
        RaisedButton(
          child: Text("Histórico"),
          onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(context)=>HistoryRequestWidget()));
          },
        ),
      ],
    );
  }
}
