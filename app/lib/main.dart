import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';

void main(){
  runApp( 
    new MaterialApp(
      home: AnimatedSplash(
        imagePath: 'assets/logo.png',
        home: Home(),
        duration: 2500,
        type: AnimatedSplashType.StaticDuration,
      )
    )
  );
} 

class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
  
    return 
      Scaffold(
        appBar: 
          AppBar(
            title:Text("Solicitar pinturas"),
          ),
        body: 
          Center(
            child: Text("Solicitar pinturas")
          ),
        );
  }

}

