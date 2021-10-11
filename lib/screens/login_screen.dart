
// import 'package:productos_app/providers/login_form_provider.dart';
// import 'package:provider/provider.dart';
// import 'package:productos_app/ui/input_decorations.dart';


import 'package:flutter/material.dart';
import 'package:validacion_app/ui/input_decorations.dart';
import 'package:validacion_app/widgets/widgets.dart';

// snippet de propia creación fl-screen.

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox( height: 250),
                  CardContainer(
                    child: Column(
                      children: [
                        SizedBox( height: 10),
                         Text('Login', style: Theme.of(context).textTheme.headline4),
                         SizedBox( height: 30),
                         _LoginForm()
                      ],
                    )
                  ),
                  SizedBox( height: 50),
                  Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox( height: 50),
                ],

            ),
          )

        ),

    );
  }
}


class _LoginForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
          // TODO: mantener la referencia al key
          child:  Column(
              children: [
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                    hintText: ' nombre@dominio.xxx',
                    labelText: 'Correo electrónico',
                    prefixIcon: Icons.alternate_email_rounded
                  ),
                ),
                SizedBox( height: 30),
                TextFormField(
                  autocorrect: false,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecorations.authInputDecoration(
                      hintText: '*****',
                      labelText: 'Contraseña',
                      prefixIcon: Icons.lock_outline
                  ),
                ),
                SizedBox( height: 30),
                MaterialButton(
                     shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(10)),
                     disabledColor: Colors.grey,
                     elevation: 0,
                     child: Container(
                       padding: EdgeInsets.symmetric( horizontal: 80, vertical: 15 ),
                       child: Text('ingresar',
                         style: TextStyle(color: Colors.white),
                       )
                     ),
                     onPressed: (){
                       //TODO: LOGIN FORM
                     }
                )
              ],
          ),
        ),
    );
  }
}



