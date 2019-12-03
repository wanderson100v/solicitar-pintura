import 'package:app/src/model/Request.dart';
import 'package:app/src/util/painter-object-expansion-panel-list.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class RequestDetailsWidget extends StatefulWidget {
  
  final Request request;

  final String title;

  final String stateDescription;

  final Widget actionsWidget;

  RequestDetailsWidget(this.request, this.title, this.stateDescription, this.actionsWidget);

  @override
  _RequestDetailsWidgetState createState() => _RequestDetailsWidgetState();
}

class _RequestDetailsWidgetState extends State<RequestDetailsWidget> {
  
  @override
  Widget build(BuildContext context) {
    return buildScaffold("Detalhes Requisição",
      Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text(widget.title, style: TextStyle(fontSize: 18),),
            ),
            Text(widget.stateDescription),
            Text(widget.request.customer.name, style : TextStyle(fontSize: 28)),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text("Período", style: TextStyle(fontSize: 18),),
            ),
            buildLabelDescriptionWidget("Inicio", widget.request.startDate.toString()),
            buildLabelDescriptionWidget("Fim", widget.request.endDate.toString()),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Serão pintados", style: TextStyle(fontSize: 18),),
            ),
           buildPainterObjectExpansionPanelListWidget(widget.request.painterObjects),
           widget.actionsWidget
          ],
        )
    );
  }
}