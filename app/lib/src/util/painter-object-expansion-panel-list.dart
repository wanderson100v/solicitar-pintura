import 'package:app/src/model/PainterObject.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:flutter/material.dart';

Widget buildPainterObjectExpansionPanelListWidget(List<PainterObject> paintersObject){
  if(paintersObject != null){
    List<ExpansionPanel> paintersObjectPanel = paintersObject.map<ExpansionPanel>((PainterObject painterObject)=>_buildPainterObjectExpansionPanelWidget(painterObject)).toList();
    return ExpansionPanelListAdapter(paintersObjectPanel);
  }
  else
    return Text("Objetos de pintura não especificados");
}


ExpansionPanel _buildPainterObjectExpansionPanelWidget(PainterObject painterObject){
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) =>
              ListTile(
                title: Text(painterObject.title),
              ),
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
  );
}