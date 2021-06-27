import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:validations/src/blocs/validator.dart';

class LoginBloc with Validators {

  final _emailController    = BehaviorSubject<String>();  
  final _passwordController = BehaviorSubject<String>();  

  //Repcuperar los datos del stream
  Stream<String> get emailStream    => _emailController.stream.transform( validarEmail ); 
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword ); 

  Stream<bool> get formValidStream =>
       Rx.combineLatest2(emailStream, passwordStream, (e, p) => true);



  // Insertear valores al stream
  Function( String )  get changeEmail   => _emailController.sink.add;
  Function( String )  get passwordEmail => _passwordController.sink.add;

  String get password => _passwordController.value;
  String get email => _emailController.value;
  
  
  dispose() {
    _emailController.close();
    _passwordController.close();
  }

}