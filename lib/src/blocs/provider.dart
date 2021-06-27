import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:validations/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget {

  static Provider? _instancia;

  factory Provider ({ Key? key, required Widget child }) {
    if ( _instancia == null ){
      _instancia = new Provider._internal(
        key: key ,
        child: child);
    }
    
    return _instancia!;
  }
    
    Provider._internal({ Key? key, required Widget child })
    : super (key: key, child: child);




  final loginBloc = LoginBloc();
 
  // Provider({ Key? key, required Widget child })
  
  //   : super (key: key, child: child);



  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of( BuildContext context ){
    return ( context.dependOnInheritedWidgetOfExactType<Provider>() as Provider ).loginBloc;

  }

}
