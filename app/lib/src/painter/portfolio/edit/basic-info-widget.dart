import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class EditBasicInfoWidget extends StatefulWidget {
  @override
  _EditBasicInfoWidgetState createState() => _EditBasicInfoWidgetState();
}

class _EditBasicInfoWidgetState extends State<EditBasicInfoWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Editar portifólio"), centerTitle: true),
        body: SingleChildScrollView(
          child:
              Container(padding: EdgeInsets.all(20), child: _buildFormWidget()),
        ));
  }

  Widget _buildFormWidget() {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Center(
              child: Text(
            "Informações básicas",
            style: TextStyle(fontSize: 20),
          )),
          _buildTitleWidget(),
          _buildDescriptionWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleWidget() {
    return buildTextFieldContainer("Titulo", validation: "Título de serviço vazio");
  }

  Widget _buildDescriptionWidget() {
    return buildTextFieldContainer("Descrição", validation:"Descrição do serviço não informada");
  }
}
