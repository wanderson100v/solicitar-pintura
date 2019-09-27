import 'package:app/src/profile/profile-widget.dart';
import "package:flutter/material.dart";
import "package:bubble_bottom_bar/bubble_bottom_bar.dart";

class ClientDashboardWidget extends StatefulWidget {
  @override
  _ClientDashboardWidgetState createState() => _ClientDashboardWidgetState();
}

class _ClientDashboardWidgetState extends State<ClientDashboardWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Inicio',
      style: optionStyle,
    ),
    Text(
      'Solicitações',
      style: optionStyle,
    ),
    ProfileWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cliente app"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ),
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          //fabLocation: BubbleBottomBarFabLocation., //new
          hasNotch: true, //new
          hasInk: true, //new, gives a cute ink effect
          inkColor:
              Colors.black12, //optional, uses theme color if not specified
          items: <BubbleBottomBarItem>[
           _buildBubbleBottomBarItem("Inicio", Icons.home,),
           _buildBubbleBottomBarItem("Solicitações", Icons.send),
           _buildBubbleBottomBarItem("Perfil", Icons.person)
          ],
        ));
  }

  BubbleBottomBarItem _buildBubbleBottomBarItem(String text, icon) {
    return BubbleBottomBarItem(
        backgroundColor: Colors.indigo,
        icon: Icon(
          Icons.folder_open,
          color: Colors.black,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.indigo,
        ),
        title: Text(text)
      );
  }
}
