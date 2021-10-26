import 'package:flutter/material.dart';
import 'package:validacion_app/screens/screens.dart';
import 'package:validacion_app/ui/input_decorations.dart';

class ProductScreeen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [

            Stack(
              children: [
                ProductImage(),
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon( Icons.arrow_back_ios_new, size: 40, color: Colors.white ),
                    )
                ),
                Positioned(
                    top: 60,
                    right: 20,
                    child: IconButton(
                      onPressed: () {
                        // TODO. CÁMARA O GALERIA
                      },
                      icon: Icon( Icons.camera_alt_outlined, size: 40, color: Colors.white ),
                    )
                ),
              ],
            ),

            _ProductForm( ),
            SizedBox( height:  100)
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.save_outlined),
        onPressed: (){
          // TODO......... gUARDAR PRODUCTO
        },
      ),


    );
  }
}

class _ProductForm extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10 )  ,
      child: Container(
        padding: EdgeInsets.symmetric( horizontal: 20 ),
        width: double.infinity,
        height: 300,
        decoration: buildBoxDecoration(),
        child: Form(
          child:
          Column(
            children: [

              SizedBox( height: 10),
              TextFormField(
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre del producto',
                    hintText: 'Nombre:'
                ),
              ),

              SizedBox( height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    labelText: '\$150',
                    hintText: 'Precio:'
                ),
              ),
              SizedBox( height: 30),
              SwitchListTile.adaptive(
                  value: true,
                  title: Text('Disponible'),
                  activeColor: Colors.indigo,
                  onChanged: (value){
                    // todo:
                  }
              ),
              SizedBox( height: 30)
            ],
          )
        ),

      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only( bottomRight: Radius.circular(25), bottomLeft:Radius.circular(25) ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        offset: Offset(0,5),
        blurRadius: 5
      )
    ]
  );




}

