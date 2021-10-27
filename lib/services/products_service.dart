import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:validacion_app/models/models.dart';
import 'package:http/http.dart' as http;

class ProductsService extends ChangeNotifier{
  // https://crudflutter-7623c-default-rtdb.europe-west1.firebasedatabase.app/products.json
  final String _baseUrl = 'crudflutter-7623c-default-rtdb.europe-west1.firebasedatabase.app';
  final List<Product> products = [];

  late Product selectedProduct;
  // Product? selectedProduct;

  bool isLoading = true;

  ProductsService(){
      loadProducts();
  }
  //
Future<List<Product>> loadProducts() async{

    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'products.json');
    final resp = await http.get(url);

    final Map<String, dynamic> productsMap = json.decode( resp.body ) ;

    print ( productsMap);

    productsMap.forEach((key, value) {
      final tempProduct = Product.fromMap( value );
      tempProduct.id = key;
      products.add(tempProduct );
    });

    this.isLoading = false;
    notifyListeners();
    return products;
  }

}