import 'package:app/src/default-widgets/text-form-field-widget.dart';
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
    return TextFormFieldWidget("Titulo", false, "Título de serviço vazio");
  }

  Widget _buildDescriptionWidget() {
    return TextFormFieldWidget(
        "Descrição", false, "Descrição do serviço não informada");
  }
}
