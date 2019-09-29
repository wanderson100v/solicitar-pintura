import 'package:app/src/client/request/request-widget.dart';
import 'package:app/src/default-widgets/label-description-widget.dart';
import 'package:app/src/painter/portfolio/portfolio-widget.dart';
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
    return Scaffold(
      appBar: AppBar(title : Text("Detalhes Pintor"),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Text(widget.painter.name, style : TextStyle(fontSize: 28)),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              child: Text("Valores cobrados", style: TextStyle(fontSize: 18),),
            ),
            LabelDescriptionWidget("Diária", widget.painter.dayliValue.toString()),
            LabelDescriptionWidget("Metro quadrado", widget.painter.squareMeterValue.toString()),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Portifólio", style: TextStyle(fontSize: 18),),
            ),
            _buildPortifolioExpansionPanelListWidget(widget.painter.services)
          ],
        )
      ),
    );
  }

  ExpansionPanelList _buildPortifolioExpansionPanelListWidget(List<Service> services){
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
          setState(() {
            services[index].isExpanded = !isExpanded;
          });
        },
        children: services.map<ExpansionPanel>((Service service) {
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
              ]),
              isExpanded: service.isExpanded);
        }).toList());
  }
}