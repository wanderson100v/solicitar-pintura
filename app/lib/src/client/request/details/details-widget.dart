import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatefulWidget {
  @override
  _DetailsWidgetState createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes da solicitação"), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child:  MyForm(),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text("Onde o serviço será realizado ?", style: TextStyle(fontSize: 18))
          ),
          _buildZipCodeWidget(),
          _buildStreetWidget(),
          _buildNeighborhoodWidget(),
          _buildCityWidget(),
          _buildStateWidget(),
          _buildCountryWidget(),
          Padding(
            padding: EdgeInsets.only(top:20,bottom: 10),
            child: Text("Em qual período de tempo?", style: TextStyle(fontSize: 18))
          ),
          TextFormFieldWidget("Inicio", false, "Data de inicio vazia"),
          TextFormFieldWidget("Fim", false, ""),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(children: <Widget>[
                Expanded(child: Container()),
                RaisedButton(
                  onPressed: () {
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>);
                  },
                  child:Text('Finalizar'),
                )
              ]
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