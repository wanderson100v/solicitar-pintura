import 'dart:io';

import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:app/src/painter/portfolio/portfolio-widget.dart';
import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class EditPortfolioWidget extends StatelessWidget {
  final Service _service;

  EditPortfolioWidget(this._service);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar portifólio"), centerTitle: true),
      body:SingleChildScrollView(child: Container(
        padding: EdgeInsets.all(20),
        child: Column(children: <Widget>[
            MyForm(), 
            ImageGridWidget()]
          )
        )
      ),
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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildTitleWidget(),
          _buildDescriptionWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {},
              child: Text('Salvar'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleWidget() {
    return TextFormFieldWidget("Titulo", false, "Título de serviço vazio");
  }

  Widget _buildDescriptionWidget() {
    return TextFormFieldWidget(
        "Descrição", false, "Descrição do serviço não informada");
  }
}

class ImageGridWidget extends StatefulWidget {
  @override
  _ImageGridWidgetState createState() => _ImageGridWidgetState();
}

class _ImageGridWidgetState extends State<ImageGridWidget> {
  List<File> _images = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
            child: Text("Imagens"),
          ),
          IconButton(icon: Icon(Icons.add_a_photo), onPressed: () => getImage())
        ],
      ),
      _buildImageList()
    ]));
  }

  Widget _buildImageList() {
    if (_images != null && _images.length > 0)
      return Container(
          height: 200 ,
          child: GridView.count(
              crossAxisSpacing: 5,
              crossAxisCount: 3,
              children: _images
                  .map(
                    (imageFile) => Image.file(
                      imageFile,
                      height: 100,
                      width: 100,
                    ),
                  )
                  .toList()));
    return Text("Não há imagens cadastradas");
  }

  Future getImage() async {
    var images = await MultiMediaPicker.pickImages(source: ImageSource.gallery);
    if(images != null)
      setState(() {
          _images.addAll(images);
      });
  }
}
