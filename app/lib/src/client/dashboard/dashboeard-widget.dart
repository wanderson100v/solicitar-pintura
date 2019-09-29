import 'package:app/src/client/request/request-widget.dart';
import 'package:app/src/login/login-widget.dart';
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
      'Solicitações',
      style: optionStyle,
    ),
    ProfileWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children : <Widget>[
              DrawerHeader(
                child :Text("Menu"),
                decoration: BoxDecoration(
                  color: Colors.cyan
                ),
              ),
              ListTile(
                title: Text("Sair"),
                onTap: ()=>{
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=>LoginWidget()))
                },
              )
            ],
          ),
        ),
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
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{
            Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>RequestWidget()))
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BubbleBottomBar(
          opacity: .2,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          elevation: 8,
          fabLocation: BubbleBottomBarFabLocation.end, 
          hasNotch: true, 
          hasInk: true,
          inkColor: Colors.black12, 
          items: <BubbleBottomBarItem>[
           _buildBubbleBottomBarItem("Solicitações", Icons.send),
           _buildBubbleBottomBarItem("Perfil", Icons.person)
          ],
        ));
  }

  BubbleBottomBarItem _buildBubbleBottomBarItem(String text, icon) {
    return BubbleBottomBarItem(
        backgroundColor: Colors.indigo,
        icon: Icon(
          icon,
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