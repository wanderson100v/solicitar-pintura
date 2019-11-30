import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class EditValuesWidget extends StatefulWidget {
  @override
  _EditValuesWidgetState createState() => _EditValuesWidgetState();
}

class _EditValuesWidgetState extends State<EditValuesWidget> {
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Perfil"), centerTitle: true),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Editar valores cobrados", style: TextStyle(fontSize: 20))),
            _buildFormWidget()
          ],
        ),
      )),
    );
  }
  
  Form _buildFormWidget(){
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          buildTextFieldContainer("Diária",validation: "Diária vazia"),
          buildTextFieldContainer("Metros quadrados", validation: "Metros quadrados não informados"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                
              },
              child: Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }
}