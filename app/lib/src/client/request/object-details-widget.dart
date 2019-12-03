import 'package:app/src/model/PainterObject.dart';
import 'package:app/src/util/widget-factory.dart';
import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';

class ObjectDetailsWidget extends StatefulWidget {
  
  final dynamic addPainterObject;

  const ObjectDetailsWidget(this.addPainterObject);

  @override
  _ObjectDetailsWidgetState createState() => _ObjectDetailsWidgetState();
}

class _ObjectDetailsWidgetState extends State<ObjectDetailsWidget> {
  
  final  _formKey = GlobalKey<FormState>();

  TextEditingController _titleFC = TextEditingController();

  TextEditingController _descriptionFC = TextEditingController();

  TextEditingController _squareMeterFC = TextEditingController();

  Image _image;

  @override
  Widget build(BuildContext context) {
    return buildScaffold("Solicitação",
       Column( children: <Widget>[
          Text("Oque deseja pintar?", style: TextStyle(fontSize: 18)),
          _buildForm(context)
        ])
      );
  }

  Form _buildForm(context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          buildTextFieldContainer("Titulo", validation :"Titulo não informado", controller: _titleFC),
          buildTextFieldContainer("Descrição", validation :"Descrição do que deve ser feito em está vazia", controller: _descriptionFC),
          buildTextFieldContainer("Tamenho em metros quadrados", controller: _squareMeterFC),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child : Center(child:Row(children: <Widget>[
                Expanded(child:Container()),
                Center(child: Text("Imagem", style:  TextStyle(fontSize: 18),)),
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: getImage
                ),
                Expanded(child:Container())
              ],)
            ),
          ),
          _buildImageWiget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ButtonBar(children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancelar'),
              ),
              RaisedButton(
                onPressed: () {
                  if(_formKey.currentState.validate()){
                    widget.addPainterObject(PainterObject(_titleFC.text, _descriptionFC.text, squareMeter: double.parse(_squareMeterFC.text) , image: _image));
                    Navigator.of(context).pop();
                  }
                },
                child: Text('confirmar'),
              ),
            ]
          )
          )
          ],
      ),
    );
  }

  Widget _buildImageWiget(){
    if(_image != null)
      return _image;
    else
      return Text("Nenhuma imagem definida");
  }

  Future getImage() async {
    var images = await MultiMediaPicker.pickImages(source: ImageSource.gallery);
    if(images != null)
      setState(() {
          _image = Image.file(images[0]);
      });
  }
}