import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class EditAddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildScaffold("Editar Perfil", 
      Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text("Editar endereço", style: TextStyle(fontSize: 20))),
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
    return buildTextFieldContainer("CEP", validation: "O CEP deve ser informado");
  }

  Widget _buildStreetWidget() {
    return buildTextFieldContainer("Logradouro", validation: "Logradouro não informado");
  }

  Widget _buildNeighborhoodWidget() {
    return buildTextFieldContainer("Bairro", validation: "Bairro deve ser informado");
  }

  Widget _buildCityWidget() {
    return buildTextFieldContainer("Cidade", validation: "Cidade deve ser informado");
  }

  Widget _buildStateWidget() {
    return buildTextFieldContainer("Estado", validation: "Estado deve ser informado");
  }

  Widget _buildCountryWidget() {
    return buildTextFieldContainer("Pais", validation: "Pais deve ser informado");
  }
}
