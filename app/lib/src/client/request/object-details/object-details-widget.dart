import 'package:app/src/default-widgets/text-form-field-widget.dart';
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

  Image _image;

  Color _color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar( 
          title :Text("Solicitação"),
          centerTitle: true
        ),
        body: SingleChildScrollView(
          child:Container(
            padding: EdgeInsets.all(20),
            child: Column( children: <Widget>[
                  Text("Oque deseja pintar?", style: TextStyle(fontSize: 18)),
                  _buildForm(context)
                ],
            )
          )
        )
      );
  }

  Form _buildForm(context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormFieldWidget("Titulo", false, "Titulo não informado"),
          TextFormFieldWidget("Descrição", false, "Descrição do que deve ser feito em está vazia"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child : Row(children: <Widget>[
                Center(child: Text("Imagem", style:  TextStyle(fontSize: 20),)),
                IconButton(
                  icon: Icon(Icons.add_a_photo),
                  onPressed: getImage
                )
              ],
            ),
          ),
          _buildImageWiget(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child :Center(child: Text("Cor", style:  TextStyle(fontSize: 20),)),
          ),
          _buildColorWiget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('cancelar'),
              ),
              RaisedButton(
                onPressed: () {
                 //  widget.addPainterObject(PainterObject(title, description, image, color));
                   Navigator.of(context).pop();
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

   Widget _buildColorWiget(){
    if(_color != null)
      return Container(
        height: 50,
        color: _color
      );
    else
      return Text("Nenhuma cor definida");
  }

  Future getImage() async {
    var images = await MultiMediaPicker.pickImages(source: ImageSource.gallery);
    if(images != null)
      setState(() {
          _image = Image.file(images[0]);
      });
  }
}