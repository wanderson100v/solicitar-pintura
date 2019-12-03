import 'package:app/src/model/Customer.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:app/src/profile/edit/address-widget.dart';
import 'package:app/src/profile/edit/edit-widget.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          Icon(Icons.person, size: 100, color: Colors.blue),
          _buildProfileEdit(context),
          buildLabelDescriptionWidget("Telefone", Customer.customerOn.telNumber),
          buildLabelDescriptionWidget("Email",  Customer.customerOn.email),
          _buildAnddressEdit(context),
          buildLabelDescriptionWidget("CEP", Customer.customerOn.address.zipCode),
          buildLabelDescriptionWidget("Logradouro", Customer.customerOn.address.street),
          buildLabelDescriptionWidget("Bairro", Customer.customerOn.address.neighborhood),
          buildLabelDescriptionWidget("Cidade", Customer.customerOn.address.city),
          buildLabelDescriptionWidget("Estado", Customer.customerOn.address.state),
          buildLabelDescriptionWidget("País", Customer.customerOn.address.country),
        ]
      )
    );
  }

  Widget _buildProfileEdit(context){
    return  _buildEdit(context, "Nome de usuário", EditProfileWidget() ,fontSize : 20);
  }

  Widget _buildAnddressEdit(context){
    return  _buildEdit(context, "Endereço", EditAddressWidget());
  }

  Widget _buildEdit(context, String labelText , Widget page, {double fontSize = 18}){
      Row row = Row(
        children: <Widget>[
          Text(labelText, style: TextStyle(fontSize: fontSize)),
          IconButton(
            onPressed: ()=>
              Navigator.of(context).push(MaterialPageRoute(builder :(context) =>EditProfileWidget()))
            ,
            icon: Icon(Icons.edit, size: 20,),
          )
        ],
      );
    return row;
  }
}