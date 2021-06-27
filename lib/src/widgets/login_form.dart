import 'package:flutter/material.dart';
import 'package:validations/src/blocs/login_bloc.dart';
import 'package:validations/src/blocs/provider.dart';

class LoginForm extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    
    
    final bloc = Provider.of(context); 
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SafeArea( 
            child: Container(
              height: 180.0,
            ) 
          ),

          Container(
            width: size.width * 0.85, 
            margin: EdgeInsets.symmetric( vertical: 30 ),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow> [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset( 0.0, 5.0),
                  spreadRadius: 3.0
                  )
              ]
            ),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                SizedBox( height: 60.0),
                _crearBoxMail( bloc ),
                SizedBox( height: 30.0),
                _crearBoxPassword( bloc),
                SizedBox( height: 30.0),
                _ElevatedButton(
                  bloc: bloc,
                )

              ],
            ),
          ),
          Text('¿Olvido la contraseña?'),
          SizedBox( height: 100.0, )
        ],
      ),
    );
  }

  _TextBoxForm _crearBoxMail( LoginBloc bloc ) {

    return _TextBoxForm(
          decoration: InputDecoration(
            icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
            hintText: 'ejemplo@exaple.com',
            labelText: 'Correo electrónico',
            errorText: ''
          ),          
          edgeInsets: EdgeInsets.symmetric( horizontal: 20.0 ), 
          textInputType: TextInputType.emailAddress, obscureText: false, 
          bloc: bloc, 
          type: 'mail',               
        );
    
  }

  _TextBoxForm _crearBoxPassword( LoginBloc bloc ) {
    return _TextBoxForm(
        decoration: InputDecoration(
        icon: Icon( Icons.lock, color: Colors.deepPurple ),
        labelText: 'Contraseña',                    
      ), 
      edgeInsets: EdgeInsets.symmetric( horizontal: 20.0 ), 
      textInputType: TextInputType.text, obscureText: true, 
      bloc: bloc,  
      type: 'login',             
    );
  }
}

class _ElevatedButton extends StatelessWidget {

  final LoginBloc bloc;
  
  const _ElevatedButton({
    Key? key, 
    required this.bloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: (context, snapshot) {
              return ElevatedButton(
              onPressed: snapshot.hasData ? () => _login( context ,bloc ) : null ,
              child: Container(
                  child: Text('Ingresar'),
                  padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
              ),   
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  side: BorderSide(color: Colors.blue)
                  )
                )
              ),
        );
      }
    );
  }
}

_login (BuildContext context, LoginBloc bloc){
  print('================================================================');
  print("Email: ${ bloc.email } ");
  print("Name: ${ bloc.password } ");
  print("================================================================");

  Navigator.pushReplacementNamed(context, 'home');

}

class _TextBoxForm extends StatelessWidget {
  final InputDecoration decoration;
  final EdgeInsets edgeInsets;
  final TextInputType textInputType;  
  final bool obscureText;
  final LoginBloc bloc;
  final String type;

  const _TextBoxForm({
    Key? key, 
   
   required this.decoration,
   required this.edgeInsets,
   required this.textInputType, 
   required this.obscureText,
   required this.bloc, 
   required this.type
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  StreamBuilder(
      stream: type == 'mail' ? bloc.emailStream : bloc.passwordStream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {        
         return Container(
          padding: this.edgeInsets,
          child: TextField(
            obscureText: this.obscureText,
            keyboardType: this.textInputType,
            decoration: InputDecoration( 
              icon: this.decoration.icon,
              labelText: this.decoration.labelText,
              counterText: snapshot.data,
              errorText: snapshot.hasError ? snapshot.error.toString() : ""
            ),
                                   
            onChanged: type == 'mail' ? bloc.changeEmail: bloc.passwordEmail,
          ),
          
        );
      },
    );
    
    
    
    
    
  }
}

