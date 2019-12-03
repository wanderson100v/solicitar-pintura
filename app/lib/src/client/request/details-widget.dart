import 'package:app/src/model/Address.dart';
import 'package:app/src/model/Customer.dart';
import 'package:app/src/model/Msg.dart';
import 'package:app/src/model/Painter.dart';
import 'package:app/src/model/PainterObject.dart';
import 'package:app/src/model/Request.dart';
import 'package:app/src/util/Date-time-form-field.dart';
import 'package:app/src/util/functions.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';

class DetailsWidget extends StatefulWidget {
  
  final Painter painter;
  final List<PainterObject> painterObjects;

  const DetailsWidget(this.painter, this.painterObjects);
  
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
          child:  MyForm(this),
        ),
      )
    );
  }
}


class MyForm extends StatefulWidget {
  final _DetailsWidgetState widget;
  MyForm(this.widget);
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _zipCodeFC = TextEditingController();
  TextEditingController _streetFC = TextEditingController();
  TextEditingController _neighborhoodFC = TextEditingController();
  TextEditingController _cityFC = TextEditingController();
  TextEditingController _stateFC = TextEditingController();
  TextEditingController _countryFC = TextEditingController();
  DateTime _startDate;

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
          BasicDateField("Data de ínicio", alterstartDate),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(children: <Widget>[
                Expanded(child: Container()),
                RaisedButton(
                  onPressed: () {
                   if( _formKey.currentState.validate()){
                      Address address = new Address();
                      address.zipCode = _zipCodeFC.text;
                      address.street = _streetFC.text;
                      address.neighborhood = _neighborhoodFC.text;
                      address.city = _cityFC.text;
                      address.state = _stateFC.text ;
                      address.country = _countryFC.text;

                      Request request = new Request();
                      request.startDate = _startDate;
                      request.painterObjects = widget.widget.widget.painterObjects;
                      request.painter = widget.widget.widget.painter;
                      request.customer = Customer.customerOn;
                      request.address = address;

                      request.create().then((Msg msg){
                        showMsg(context, msg.msgText);
                      }
                      );
                   }
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

  alterstartDate(DateTime date){
    setState(() {
      _startDate = date;
    });
  }

  Widget _buildZipCodeWidget() {
    return buildTextFieldContainer("CEP", controller: _zipCodeFC);
  }

  Widget _buildStreetWidget() {
    return buildTextFieldContainer("Logradouro",  validation :"Logradouro não informado", controller: _streetFC);
  }

  Widget _buildNeighborhoodWidget() {
    return buildTextFieldContainer("Bairro",  validation :"Bairro deve ser informado", controller: _neighborhoodFC);
  }

  Widget _buildCityWidget() {
    return buildTextFieldContainer("Cidade",  validation :"Cidade deve ser informado", controller: _cityFC);
  }

  Widget _buildStateWidget() {
    return buildTextFieldContainer("Estado",  validation :"Estado deve ser informado", controller: _stateFC);
  }

  Widget _buildCountryWidget() {
    return buildTextFieldContainer("Pais",  validation :"Pais deve ser informado", controller: _countryFC);
  }
}