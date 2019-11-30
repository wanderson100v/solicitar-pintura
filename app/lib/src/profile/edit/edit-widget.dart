import 'package:app/src/profile/edit/acess-data-widget.dart';
import 'package:app/src/profile/edit/address-widget.dart';
import 'package:app/src/profile/edit/basic-info-widget.dart';
import 'package:app/src/profile/deactivate-account-widget.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:app/src/util/functions.dart';
import 'package:flutter/material.dart';

class EditProfileWidget extends StatelessWidget {
  EditProfileWidget();

  @override
  Widget build(BuildContext context) {
    return buildScaffold("Editar Perfil",
     Column(
      children: <Widget>[
        ListTile(
          title: Text("Informações básicas"),
          onTap: ()=> pushNavigator(context,EditBasicInfoWidget())
        ),
        ListTile(
          title: Text("Dados de acesso"),
          onTap: ()=>pushNavigator(context,EditAcessDataWidget())
        ),
        ListTile(
          title: Text("Endereço"),
          onTap: ()=>pushNavigator(context,EditAddressWidget())
        ),
        ListTile(
          title: Text("Desativar Conta"),
          onTap: ()=>pushNavigator(context,DeactivateAccountWidget())
        ),
      ],
    ),
    );
  }
}
