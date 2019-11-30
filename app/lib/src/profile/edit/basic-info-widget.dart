import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class EditBasicInfoWidget extends StatelessWidget {
  EditBasicInfoWidget();

  @override
  Widget build(BuildContext context) {
    return buildScaffold("Editar Perfil",
     Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Editar informações básicas", style: TextStyle(fontSize: 20))),
          MyForm()
        ],
      )
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
    return buildTextFieldContainer("Nome completo", validation: "Nome completo não informado");
  }

  Widget _buildEmailWidget(){
    return buildTextFieldContainer("Nome completo");
  }

  Widget _buildTelWidget(){
    return buildTextFieldContainer("Nome completo");
  }
    
}