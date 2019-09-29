import 'package:flutter/material.dart';

class LabelDescriptionWidget extends StatelessWidget {
  
  final String label;
  final String description;

  const LabelDescriptionWidget(this.label, this.description);
  
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child :Row(
        children: <Widget>[
          Text(label),
          Padding(padding: EdgeInsets.only(left: 10), child: Text(description))
        ],
     )
    );
  }
}