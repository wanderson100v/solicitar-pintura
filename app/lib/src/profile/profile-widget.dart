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
          buildLabelDescriptionWidget("Telefone", "(99) 99999-9999"),
          buildLabelDescriptionWidget("Email", "nome@servidor.com"),
          _buildAnddressEdit(context),
          buildLabelDescriptionWidget("CEP", "00000-000"),
          buildLabelDescriptionWidget("Logradouro", "Tal Rua"),
          buildLabelDescriptionWidget("Bairro", "Tal Bairro"),
          buildLabelDescriptionWidget("Cidade", "Serra Talhada"),
          buildLabelDescriptionWidget("Estado", "PE"),
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