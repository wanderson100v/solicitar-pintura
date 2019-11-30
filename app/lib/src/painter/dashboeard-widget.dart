import 'package:app/src/login-widget.dart';
import 'package:app/src/painter/solicitation/solicitation-widget.dart';
import 'package:app/src/painter/values/values-widget.dart';
import 'package:app/src/painter/portfolio/portfolio-widget.dart';
import 'package:app/src/profile/profile-widget.dart';
import 'package:app/src/util/functions.dart';
import "package:flutter/material.dart";
import "package:bubble_bottom_bar/bubble_bottom_bar.dart";


class PainterDashboardWidget extends StatefulWidget {
  @override
  _PainterDashboardWidgetState createState() => _PainterDashboardWidgetState();
}

class _PainterDashboardWidgetState extends State<PainterDashboardWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    SolicitationWidget(),
    PortfolioWidget(),
    Column(children: <Widget>[
      ProfileWidget(),
      ValuesWidget(),
    ],)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("Pintor"),
        leading: IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () =>pushReplacementNavigator(context, LoginWidget())
        ),
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
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
           _buildBubbleBottomBarItem("Solicitações", Icons.send),
           _buildBubbleBottomBarItem("Portifólio", Icons.folder_shared),
           _buildBubbleBottomBarItem("Perfil", Icons.person)
        ],
      )
    );
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