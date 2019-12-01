import 'package:flutter/material.dart';

void pushNavigator(context, page){
  Navigator.push(
    context, 
    MaterialPageRoute(
      builder : (context) => page)
  );
}

void pushReplacementNavigator(context, page){
  Navigator.pushReplacement(
    context, 
    MaterialPageRoute(builder :(context) => page)
  );
}

void showMsg(context, msg){
  Scaffold.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
