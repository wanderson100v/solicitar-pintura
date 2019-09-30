import 'package:app/src/client/request/request-quot/request-quot-widget.dart';
import 'package:app/src/default-widgets/label-description-widget.dart';
import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:app/src/painter/solicitation/pending-request/pending-request-widget.dart';
import 'package:flutter/material.dart';

class RequestDetailsWidget extends StatefulWidget {
  final Request request;

  RequestDetailsWidget(this.request);

  @override
  _RequestDetailsWidgetState createState() => _RequestDetailsWidgetState();
}

class _RequestDetailsWidgetState extends State<RequestDetailsWidget> {
  
  final  _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("Detalhes Requisição"),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text(widget.request.clienteName, style : TextStyle(fontSize: 28)),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text("Período", style: TextStyle(fontSize: 18),),
            ),
            LabelDescriptionWidget("Inicio", widget.request.dataInicio.toString()),
            LabelDescriptionWidget("Fim", widget.request.dataInicio.toString()),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Serão pintados", style: TextStyle(fontSize: 18),),
            ),
           _buildPainterObjectExpansionPanelListWidget(widget.request.paintersObject),
          ],
        )
      ),
    );
  }

  Widget _buildPainterObjectExpansionPanelListWidget(List<PainterObject> paintersObject){
    if(paintersObject != null && paintersObject.length > 0)
      return Container(
        padding: EdgeInsets.all(1),
        child:ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
            setState(() {
              paintersObject[index].isExpanded = !isExpanded;
            });
          },
          children: paintersObject.map<ExpansionPanel>((PainterObject painterObject) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                      title:Text(painterObject.title)
                  );
                },
                body: Padding(
                  padding: EdgeInsets.all(10),
                  child:Column(
                    children: <Widget>[    
                    Text(painterObject.description),
                    Padding(
                      padding: EdgeInsets.only(top:10, bottom: 5),
                      child:Text("Imagem", style: TextStyle(fontSize: 18),)
                    ),
                    Icon(Icons.image, size: 150,),
                    Padding(
                      padding: EdgeInsets.only(top:10, bottom: 5),
                      child:Text("Cor", style: TextStyle(fontSize: 18),)
                    ),
                    Container(
                      height: 50,
                      color: Colors.red,
                    )
                ])),
                isExpanded: painterObject.isExpanded);
          }).toList())
    );
    else
      return Text("Não foi especificado o objeto a ser pintado");
  }
}