
import 'package:app/src/painter/portfolio/edit/basic-info-widget.dart';
import 'package:app/src/painter/portfolio/edit/images-widget.dart';
import 'package:flutter/material.dart';

class EditPortfolioWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar portifólio"), centerTitle: true),
      body:
        Container(
        padding: EdgeInsets.all(20),
        child: ListView(children: <Widget>[
            ListTile(
              title: Text("Informações básicas"),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditBasicInfoWidget())),
            ),
            ListTile(
              title: Text("imagens"),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>EditImageWidget())),
            )
          ]
      ),
      ) 
    );
  }
}
