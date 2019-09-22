import "package:flutter/material.dart";
import "package:bubble_bottom_bar/bubble_bottom_bar.dart";


class PainterDashboardWidget extends StatefulWidget {
  @override
  _PainterDashboardWidgetState createState() => _PainterDashboardWidgetState();
}

class _PainterDashboardWidgetState extends State<PainterDashboardWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: op1',
      style: optionStyle,
    ),
    Text(
      'Index 1: op2',
      style: optionStyle,
    ),
    Text(
      'Index 2: op3',
      style: optionStyle,
    ),
    Text(
      'Index 2: op4',
      style: optionStyle,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Pintor app"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: _widgetOptions.elementAt(_selectedIndex),
        ) ,
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _selectedIndex,
        onTap: (index)=>
          setState(()=>_selectedIndex = index
        ),
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("op1")),
            BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.access_time, color: Colors.black,), activeIcon: Icon(Icons.access_time, color: Colors.deepPurple,), title: Text("op2")),
            BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(Icons.folder_open, color: Colors.black,), activeIcon: Icon(Icons.folder_open, color: Colors.indigo,), title: Text("op3")),
            BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.menu, color: Colors.black,), activeIcon: Icon(Icons.menu, color: Colors.green,), title: Text("op4"))
        ],
      )
    );
  }
}