import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class EditImageWidget extends StatefulWidget {

  @override
  _EditImageWidgetState createState() => _EditImageWidgetState();
}

class _EditImageWidgetState extends State<EditImageWidget> {
    
  List<File> _images = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Editar portifólio"), centerTitle: true),
      body:Container(
        padding: EdgeInsets.all(20),
        child: _buildImageWidget()
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Widget _buildImageWidget() {
    return Container(
      child: Column(children: <Widget>[
        Padding(
          child : Center(child: Text("Imagens", style:  TextStyle(fontSize: 20),)),
          padding: EdgeInsets.symmetric(vertical: 10),
        ),
        Divider(),
        _buildImageList()
    ]));
  }

  Widget _buildImageList() {
    if (_images != null && _images.length > 0)
      return Expanded(
          child: GridView.count(
              crossAxisSpacing: 5,
              crossAxisCount: 3,
              children: _images
                  .map(
                    (imageFile) => RaisedButton(
                      child: Image.file(
                        imageFile,
                        height: 100,
                        width: 100,
                      ),
                      onPressed: (){
                        setState(() {
                          _images.remove(imageFile);
                        });
                      },
                    )
                    
                  )
                  .toList()));
    return Padding(
        child :Text("Não há imagens cadastradas"),
        padding: EdgeInsets.all(30),
      );
  }

  Future getImage() async {
    var images = await MultiMediaPicker.pickImages(source: ImageSource.gallery);
    if(images != null)
      setState(() {
          _images.addAll(images);
      });
  }

}
