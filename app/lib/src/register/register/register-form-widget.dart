import 'package:app/src/default-widgets/text-form-field-widget.dart';
import 'package:app/src/login/login-widget.dart';
import 'package:flutter/material.dart';

class RegisterFormWidget extends StatelessWidget {

  final String title;

  RegisterFormWidget(this.title);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro Passo 2"),
        centerTitle: true
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children :<Widget>[
              Center(child:Text(title)),
              MyForm()
            ],
           
          )
        ),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  
  final  _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          _buildLoginWidget(),
          _buildPasswordWidget(),
          _buildConfirmPasswordWidget(),
          _buildNameWidget(),
          _buildEmailWidget(),
          _buildTelWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.push(context, MaterialPageRoute(builder :(context) => LoginWidget()));
                }else{
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Um ou mais campos inválidos')));
                }
              },
              child: Text('Próximo'),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLoginWidget(){
     return TextFormFieldWidget("Login", false,  "Login não informado");
  }

  Widget _buildPasswordWidget(){
    return TextFormFieldWidget("Senha", true, "Senha não informada");
  }
  
  Widget _buildConfirmPasswordWidget(){
    return TextFormFieldWidget("Confirmação de senha", true, "Confirmação da senha não informada");
  }

  Widget _buildNameWidget(){
    return TextFormFieldWidget("Nome completo", true, "Nome completo não informado");
  }

  Widget _buildEmailWidget(){
    return TextFormFieldWidget("E-mail", true, "");
  }

  Widget _buildTelWidget(){
    return TextFormFieldWidget("Telefone", true, "");
  }
}
