import 'package:app/src/default-widgets/label-description-widget.dart';
import 'package:app/src/painter/values/edit/edit-values-widget.dart';
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
        LabelDescriptionWidget("Diária", "R\$ 80,00"),
        LabelDescriptionWidget("Metros quadrados", "R\$ 10,00"),
      ],
    );
  }
}
