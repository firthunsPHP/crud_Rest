import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:validacion_app/screens/screens.dart';
import 'package:validacion_app/services/services.dart';
import 'package:validacion_app/widgets/widgets.dart';



class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);

     if( productsService.isLoading ) return LoadingScreen();

    return Scaffold(
          appBar: AppBar(
            title: const Text('Productos'),
          ),
      body: ListView.builder(
        itemCount: productsService.products.length ,
          itemBuilder: ( BuildContext context, int index )=> GestureDetector(
            onTap: () {
              // funcion que una vez seleccionado la imagene nos lo manda a la siguiente ventana
              productsService.selectedProduct =  productsService.products[index].copy();
              Navigator.pushNamed(context, 'product');
            },
              child: ProductCard(
                product: productsService.products[index],
              )

          )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},

      ),
   );
  }
}