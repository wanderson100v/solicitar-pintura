import 'package:app/src/painter/solicitation/ongoing-request/ongoing-request-widget.dart';
import 'package:app/src/painter/solicitation/pending-request/pending-request-widget.dart';
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
          child: Text("Pendentes"),
          onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(context)=>PendingRequestWidget()));
          },
        ),
        RaisedButton(
          child: Text("Em progresso"),
          onPressed: (){
             Navigator.of(context).push(MaterialPageRoute(builder:(context)=>OngoingRequestWidget()));
          },
        ),
      ],
    );
  }
}
