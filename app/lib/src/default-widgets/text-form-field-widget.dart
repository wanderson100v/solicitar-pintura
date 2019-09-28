import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  
  final bool _obscureText;
  final String _labelText;
  final String _validation;

  const TextFormFieldWidget(this._labelText,this._obscureText, this._validation);

  @override
  Widget build(BuildContext context) {
    Padding textFieldContainer = Padding( 
        padding: EdgeInsets.fromLTRB(20,10,20,10),
        child: TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: _labelText,
          ),
          validator: (value) {
            if (_validation != "" && value.isEmpty) {
              return _validation;
            }
            return null;
          },
        ),
      );
    return textFieldContainer;
  }
}