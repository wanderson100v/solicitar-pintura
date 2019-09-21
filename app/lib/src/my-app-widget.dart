import 'package:animated_splash/animated_splash.dart';
import 'package:app/src/login/login-widget.dart';
import 'package:flutter/material.dart';

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AnimatedSplash animatedSplash = AnimatedSplash(
        imagePath: 'assets/logo.png',
        home: LoginWidget(),
        duration: 5000,
        type: AnimatedSplashType.StaticDuration,
      );
    return MaterialApp(home:animatedSplash);
  }
}