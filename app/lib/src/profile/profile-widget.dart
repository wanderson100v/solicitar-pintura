import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      _buildNameWidget("Nome de usuário"),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            _buildDefaultRow("Telefone", "(99) 99999-9999"),
            _buildDefaultRow("Email", "nome@servidor.com"),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(child: Text("Endereço", style: TextStyle(fontSize: 18)))
            ),
            _buildDefaultRow("CEP", "00000-000"),
            _buildDefaultRow("Logradouro", "Tal Rua"),
            _buildDefaultRow("Bairro", "Tal Bairro"),
            _buildDefaultRow("Cidade", "Serra Talhada"),
            _buildDefaultRow("Estado", "PE"),
            _buildDefaultRow("Pais", "Brasil"),
          ],
        ) ,
      )
    ]));
  }

  Widget _buildNameWidget(String name) {
    Row row = Row(
        children: <Widget>[
          Icon(Icons.person, size: 64, color: Colors.blue),
          Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(name, style: TextStyle(fontSize: 20))),
          IconButton(
            onPressed: ()=>{},
            icon: Icon(Icons.edit, size: 20,),
          )
        ],
      );
    return row;
  }

  Widget _buildDefaultRow(String label, String description) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child :Row(
        children: <Widget>[
          Text(label),
          Padding(padding: EdgeInsets.only(left: 10), child: Text(description))
        ],
     )
    );
  }
}
