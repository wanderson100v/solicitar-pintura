import 'package:app/src/client/request/request-quot/request-quot-widget.dart';
import 'package:app/src/default-widgets/label-description-widget.dart';
import 'package:app/src/painter/solicitation/pending-request/pending-request-details/details-widget.dart';
import 'package:flutter/material.dart';

class PendingRequestWidget extends StatefulWidget{
  

  @override
  _PendingRequestWidgetState createState() => _PendingRequestWidgetState();
}

class _PendingRequestWidgetState extends State<PendingRequestWidget> {
  
  final List<Request> requests = [
    Request("Jubileu", "13/23/12", "13/23/12")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Solcitações pendentes"),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: _buildRequestListWidget()
        )
      ),
    );
  }

  Widget _buildRequestListWidget(){
    if(requests != null && requests.length > 0)
      return Container(
        padding: EdgeInsets.all(1),
        child:ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
            setState(() {
              requests[index].isExpanded = !isExpanded;
            });
          },
          children: requests.map<ExpansionPanel>((Request request) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                      title:Row( 
                      children : <Widget>[
                        Expanded(child: Text(request.clienteName)),
                        IconButton(
                          icon: Icon(Icons.description),
                          onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RequestDetailsWidget(request)));
                          },
                        )
                      ]
                    )
                    );
                },
                body: Padding(
                  padding: EdgeInsets.all(10),
                  child:Column(
                    children: <Widget>[    
                    LabelDescriptionWidget("Inicio", request.dataInicio),
                    LabelDescriptionWidget("Fim", request.dataFim)
                ])),
                isExpanded: request.isExpanded);
          }).toList())
    );
    else
      return Text("Não foi especificado o objeto a ser pintado");
  }
}

class Request{
  String clienteName;
  String dataInicio;
  String dataFim;
  bool isExpanded = false;
  List<PainterObject> paintersObject = [
    PainterObject("Parede", "Pintar parede com cuidado, tirar o mofo"),
    PainterObject("Porta", "Lixar e deixar como nova"),
  ];

  Request(this.clienteName, this.dataInicio, this.dataFim);

  
}
