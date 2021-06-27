import 'package:flutter/material.dart';
import 'package:validations/src/widgets/fondo_login.dart';
import 'package:validations/src/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FondoLogin(),
          LoginForm(),
        ],
      )
    );    
  }  
}



