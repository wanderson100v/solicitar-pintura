import 'package:app/src/default-widgets/label-description-widget.dart';
import 'package:app/src/profile/edit/address/edit-address-widget.dart';
import 'package:app/src/profile/edit/profile/edit-profile-widget.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
          Icon(Icons.person, size: 100, color: Colors.blue),
          _buildNameWidget(context,"Nome de usuário"),
          LabelDescriptionWidget("Telefone", "(99) 99999-9999"),
          LabelDescriptionWidget("Email", "nome@servidor.com"),
          Padding(
            padding: EdgeInsets.only(top: 0),
            child:Row(
              children: <Widget>[
                Text(
                  "Endereço", style: TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditAddressWidget()));
                  },
                )
            ]),
        ),
          LabelDescriptionWidget("CEP", "00000-000"),
          LabelDescriptionWidget("Logradouro", "Tal Rua"),
          LabelDescriptionWidget("Bairro", "Tal Bairro"),
          LabelDescriptionWidget("Cidade", "Serra Talhada"),
          LabelDescriptionWidget("Estado", "PE"),
        ]
      )
    );
  }

  Widget _buildNameWidget(context,String name) {
    Row row = Row(
        children: <Widget>[
          Text(name, style: TextStyle(fontSize: 20)),
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
