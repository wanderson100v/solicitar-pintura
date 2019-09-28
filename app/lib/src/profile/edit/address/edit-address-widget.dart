import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:flutter/material.dart';

class EditAddressWidget extends StatelessWidget {
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
                child: Text("Editar endereço", style: TextStyle(fontSize: 20))),
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
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildZipCodeWidget(),
          _buildStreetWidget(),
          _buildNeighborhoodWidget(),
          _buildCityWidget(),
          _buildStateWidget(),
          _buildCountryWidget(),
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

  Widget _buildZipCodeWidget() {
    return TextFormFieldWidget("CEP", false, "O CEP deve ser informado");
  }

  Widget _buildStreetWidget() {
    return TextFormFieldWidget("Logradouro", false, "Logradouro não informado");
  }

  Widget _buildNeighborhoodWidget() {
    return TextFormFieldWidget("Bairro", false, "Bairro deve ser informado");
  }

  Widget _buildCityWidget() {
    return TextFormFieldWidget("Cidade", false, "Cidade deve ser informado");
  }

  Widget _buildStateWidget() {
    return TextFormFieldWidget("Estado", false, "Estado deve ser informado");
  }

  Widget _buildCountryWidget() {
    return TextFormFieldWidget("Pais", false, "Pais deve ser informado");
  }
}
