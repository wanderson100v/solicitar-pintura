import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
  
    return 
      Scaffold(
        appBar: 
          AppBar(
            title:Text("Home"),
          ),
        body: 
          Center(
            child: Text("Solicitar pinturas")
          ),
        );
  }

}