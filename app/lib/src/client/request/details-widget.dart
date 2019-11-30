import 'package:app/src/util/widget-factory.dart';
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
          buildTextFieldContainer("Inicio", validation: "Data de inicio vazia"),
          buildTextFieldContainer("Fim"),
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
    return buildTextFieldContainer("CEP", validation :"O CEP deve ser informado");
  }

  Widget _buildStreetWidget() {
    return buildTextFieldContainer("Logradouro",  validation :"Logradouro não informado");
  }

  Widget _buildNeighborhoodWidget() {
    return buildTextFieldContainer("Bairro",  validation :"Bairro deve ser informado");
  }

  Widget _buildCityWidget() {
    return buildTextFieldContainer("Cidade",  validation :"Cidade deve ser informado");
  }

  Widget _buildStateWidget() {
    return buildTextFieldContainer("Estado",  validation :"Estado deve ser informado");
  }

  Widget _buildCountryWidget() {
    return buildTextFieldContainer("Pais",  validation :"Pais deve ser informado");
  }
}