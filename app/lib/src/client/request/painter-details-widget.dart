import 'package:app/src/client/request/request-quot-widget.dart';
import 'package:app/src/model/Painter.dart';
import 'package:app/src/model/Service.dart';
import 'package:app/src/util/Expansion-panel-list-adapter.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class PainterDetailsWidget extends StatefulWidget {
  
  final Painter painter;

  PainterDetailsWidget(this.painter);

  @override
  _PainterDetailsWidgetState createState() => _PainterDetailsWidgetState();
}

class _PainterDetailsWidgetState extends State<PainterDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return buildScaffold("Detalhes Pintor",
      Column(
          children: <Widget>[
            Text(widget.painter.name, style : TextStyle(fontSize: 28)),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text("Valores cobrados", style: TextStyle(fontSize: 18),),
            ),
            buildLabelDescriptionWidget("Diária", widget.painter.dayliValue.toString()),
            buildLabelDescriptionWidget("Metro quadrado", widget.painter.squareMeterValue.toString()),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Portifólio", style: TextStyle(fontSize: 18),),
            ),
            _buildPortifolioExpansionPanelListWidget()
          ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>RequestQuot(widget.painter)));
        },
      ),
    );
  }

  ExpansionPanelListAdapter _buildPortifolioExpansionPanelListWidget(){
    List<ExpansionPanel> portifolioExpanstionPanels = widget.painter.services
      .map<ExpansionPanel>(
        (Service service) => _buildPortifolioExpansionPanelWidget(service)
      ).toList();
    return ExpansionPanelListAdapter(portifolioExpanstionPanels);
  }

  ExpansionPanel _buildPortifolioExpansionPanelWidget(Service service){
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return ListTile(
              title: Text(service.headerValue),
            );
        },
        body: Column(children: <Widget>[    
          Text(service.expandedValue),
          Text("Imagens", style: TextStyle(fontSize: 18),),
          Row(
            children: <Widget>[
              Icon(Icons.image, size: 90),
              Icon(Icons.image, size: 90),
              Icon(Icons.image, size: 90),
            ],
          ),
        ]
      ),
    );
  }
}