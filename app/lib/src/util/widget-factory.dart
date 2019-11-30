import 'package:flutter/material.dart';

Widget buildTextFieldContainer(String labelText, {bool obscureText = false, String validation = "" ,controller}){
  Padding textFieldContainer = Padding( 
      padding: EdgeInsets.fromLTRB(20,10,20,10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(labelText: labelText),
        validator: (value) {
          if (value.isEmpty) {
            return validation;
          }
          return null;
        },
      ),
    );
  return textFieldContainer;
}

Widget buildLabelDescriptionWidget(String labelText, String description){
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child :Row(
        children: <Widget>[
          Text(labelText),
          Padding(padding: EdgeInsets.only(left: 10), child: Text(description))
        ]
     )
    );
  }

Scaffold buildScaffold(String title, Widget content ,{floatingActionButton, floatingActionButtonLocation, bottomNavigationBar}){
  return Scaffold (
    appBar: AppBar(
      title: Text(title),
      centerTitle: true
    ),
    body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: content
      )
    ),
    floatingActionButton: floatingActionButton,
    floatingActionButtonLocation: floatingActionButtonLocation,
    bottomNavigationBar: bottomNavigationBar,
  );
}


