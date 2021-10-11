import 'package:flutter/material.dart';

/// clase reutilizable para

class InputDecorations{

  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
    }){
    return  InputDecoration(
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.deepOrange
            )
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
                color: Colors.deepOrange,
                width: 2
            )
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(
            color:  Colors.grey
        ),
        prefixIcon: prefixIcon != null
        ?   Icon( prefixIcon, color: Colors.deepOrange )
        :   null
    );
  }

}