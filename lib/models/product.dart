

import 'dart:convert';


class Product {
  Product({
    required this.available,
    required this.name,
    this.picture,
    required this.price,

    this.id

  });

  bool available;
  String name;
  String? picture;
  double price;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap()); //para enviar al servidor los datos codificados

  factory Product.fromMap(Map<String, dynamic> json) => Product(
    available: json["available"],
    name: json["name"],
    picture: json["picture"],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "available": available,
    "name": name,
    "picture": picture,
    "price": price,
  };

/***  metodo copy(), conbseguimos romper la refencia
 * del producto que enviamos a otra actividad
 * para ser modificado, eliminado,...*/
  Product copy() => Product(
      available: available,
      name: name,
      picture: picture,
      price: price,
      id: id
  );

}
