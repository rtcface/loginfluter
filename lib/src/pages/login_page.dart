import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FondoLogin(),
          LoginForm()
        ],
      )
    );    
  }  
}

class FondoLogin extends StatelessWidget {
  
    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    ); 

    final headTitle = Container(
      padding: EdgeInsets.only( top: 80.0),
      child: Column(        
        children: <Widget> [
          Icon( Icons.person_pin_circle_outlined, color: Colors.white, size: 100.0),
          SizedBox( height: 10.0, width: double.infinity,),
          Text('Ramiro Tepehua Cortes', style: TextStyle( color: Colors.white, fontSize: 25.0), )
        ],
      ),
    );

  

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 176, 1.0),
            
          ] 
        )           
      )
    );
    return Stack(children: <Widget> [
        fondoMorado,
        Positioned( child: circulo, top: 90.0, left: 30.0),
        Positioned( child: circulo, top: -40.0, left: -30.0),
        Positioned( child: circulo, bottom: -50, right:  -10.0),
        Positioned( child: circulo, bottom: 120, right:  20.0),
        Positioned( child: circulo, bottom: 210, right:  -20.0),
        headTitle,
      ],);
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView();
  }
}