import 'package:app/src/client/request/details/details-widget.dart';
import 'package:app/src/client/request/object-details/object-details-widget.dart';
import 'package:flutter/material.dart';

class RequestQuot extends StatefulWidget {
  @override
  _RequestQuotState createState() => _RequestQuotState();
}

class _RequestQuotState extends State<RequestQuot> {
  
  List<PainterObjectObject> paintersObject = [
    PainterObjectObject("Parede", "Pintar parede com cuidado, tirar o mofo"),
    PainterObjectObject("Porta", "Lixar e deixar como nova"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title :Text("Solicitação"),
        centerTitle: true
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child:ListView(
          children: <Widget>[
            Row( children: <Widget>[
                Text("O que deseja pintar?", style: TextStyle(fontSize: 18)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder:(context)=>ObjectDetailsWidget(addPainterObjectObject)));
                  },
                ),
              ],
            ),
             _buildPainterObjectExpansionPanelListWidget(),
            RaisedButton(
              child: Text("Próximo"),
              onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsWidget()));
              },
            )
          ]
        )
      )
    );
  }

Widget _buildPainterObjectExpansionPanelListWidget(){
    if(paintersObject != null && paintersObject.length > 0)
      return Container(
        padding: EdgeInsets.all(1),
        child:ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
            setState(() {
              paintersObject[index].isExpanded = !isExpanded;
            });
          },
          children: paintersObject.map<ExpansionPanel>((PainterObjectObject painterObject) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                      title:Row( 
                      children : <Widget>[
                        Expanded(child: Text(painterObject.title)),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: (){
                            setState((){
                              paintersObject.remove(painterObject);
                            });
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

  addPainterObjectObject(painterObjectObject){
    if(painterObjectObject != null){
      setState(()=>
        paintersObject.add(painterObjectObject)
      );
    }
  }

  
}

class PainterObjectObject{
  
  String title;
  String description;
  Image image;
  Color color;
  bool isExpanded = false;

  PainterObjectObject(this.title,this.description,{this.image, this.color});

}