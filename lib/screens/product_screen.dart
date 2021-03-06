import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:validacion_app/providers/product_form_provider.dart';

import 'package:validacion_app/screens/screens.dart';
import 'package:validacion_app/services/products_service.dart';

import 'package:validacion_app/ui/input_decorations.dart';
import 'package:validacion_app/widgets/widgets.dart';

class ProductScreeen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
        create: ( _ ) => ProductFormProvider( productService.selectedProduct  ),
        child:_ProductScreenBody(productService: productService)  ,

    );


  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior -> me esconde el tecvlado si realizo un scroll en la patlla
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [

            Stack(
              children: [
                ProductImage( url: productService.selectedProduct.picture),
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

      final productForm = Provider.of<ProductFormProvider>(context);
      final product = productForm.product;

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
                initialValue: product.name,
                onChanged: ( value ) => product.name = value,
                validator:  (value) {
                  if (value == null || value.length <1 ) return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                    labelText: 'Nombre del producto',
                    hintText: 'Nombre:'
                ),
              ),

              SizedBox( height: 30),
              TextFormField(
                initialValue:'${product.price}',
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                ],
                onChanged: ( value ){

                  if( double.tryParse(value) == null){
                    product.price = 0;
                  }else{
                    product.price = double.parse(value);
                  }
                },
                validator:  (value) {
                  if (value == null || value.length <1 ) return 'El nombre es obligatorio';
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                    labelText: '\$150',
                    hintText: 'Precio:'
                ),
              ),
              SizedBox( height: 30),
              SwitchListTile.adaptive(
                  value: product.available,
                  title: Text('Disponible'),
                  activeColor: Colors.indigo,
                  onChanged: (value)=> productForm.updateAvailability(value)
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

