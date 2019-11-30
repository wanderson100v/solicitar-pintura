import 'package:flutter/material.dart';

class ExpansionPanelListAdapter extends StatefulWidget {
  
  final List<ExpansionPanel> expansionsPanel; 

  const ExpansionPanelListAdapter(this.expansionsPanel);

  @override
  _ExpansionPanelListAdapterState createState() => _ExpansionPanelListAdapterState();
}

class _ExpansionPanelListAdapterState extends State<ExpansionPanelListAdapter> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              widget.expansionsPanel[index] = new ExpansionPanel(
                isExpanded: !isExpanded,
                headerBuilder: widget.expansionsPanel[index].headerBuilder,
                body: widget.expansionsPanel[index].body,
              );
            });
          },
          children: widget.expansionsPanel
        )
      );
  }
}