import 'package:app/src/profile/edit/acess-data/edit-acess-data-widget.dart';
import 'package:app/src/profile/edit/address/edit-address-widget.dart';
import 'package:app/src/profile/edit/basic-info/edit-basic-info-widget.dart';
import 'package:app/src/profile/edit/deactivate-account/deactivate-account-widget.dart';
import 'package:flutter/material.dart';

class EditProfileWidget extends StatelessWidget {
  EditProfileWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar Perfil"), centerTitle: true),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Informações básicas"),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditBasicInfoWidget()))
            ),
            ListTile(
              title: Text("Dados de acesso"),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditAcessDataWidget()))
            ),
            ListTile(
              title: Text("Endereço"),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditAddressWidget()))
            ),
            ListTile(
              title: Text("Desativar Conta"),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DeactivateAccountWidget()))
            ),
          ],
        ),
      )),
    );
  }
}
