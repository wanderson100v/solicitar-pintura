import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:flutter/material.dart';

class EditBasicInfoWidget extends StatelessWidget {
  EditBasicInfoWidget();

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
              child: Text("Editar informações básicas", style: TextStyle(fontSize: 20))),
            MyForm()
          ],
        ),
      )),
    );
  }
}


class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildNameWidget(),
          _buildEmailWidget(),
          _buildTelWidget(),
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

  Widget _buildNameWidget(){
    return TextFormFieldWidget("Nome completo", false, "Nome completo não informado");
  }

  Widget _buildEmailWidget(){
    return TextFormFieldWidget("Nome completo", false, "");
  }

  Widget _buildTelWidget(){
    return TextFormFieldWidget("Nome completo", false, "");
  }
    
}