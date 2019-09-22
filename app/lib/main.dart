import 'package:flutter/material.dart';
import 'package:animated_splash/animated_splash.dart';
import 'package:app/src/login/login-widget.dart';

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnimatedSplash animatedSplash = AnimatedSplash(
        imagePath: 'assets/logo.png',
        home: LoginWidget(),
        duration: 5000,
        type: AnimatedSplashType.StaticDuration,
      );
    return MaterialApp(
      home:animatedSplash,
      title: "Solicitar pintura",
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
  )
    );
  }
}

void main() => runApp(MyAppWidget());
