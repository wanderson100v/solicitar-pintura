import 'package:app/src/util/widget-factory.dart';
import 'package:app/src/painter/values/edit-values-widget.dart';
import 'package:flutter/material.dart';

class ValuesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 0),
          child: Center(child: Row(
            children: <Widget>[
              Text("Valores cobrados", style: TextStyle(fontSize: 18),
              ),
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditValuesWidget()));
                },
              )
          ]),)
        ),
        buildLabelDescriptionWidget("Diária", "R\$ 80,00"),
        buildLabelDescriptionWidget("Metros quadrados", "R\$ 10,00"),
      ],
    );
  }
}
