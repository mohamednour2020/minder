import 'package:flutter/material.dart';
Widget defaultTextEditing({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  Function()? onChanged,
  Function()? onSubmitted,
  Function()? onShowPassword,

  Function()? onTap,
}) =>
    TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,

      decoration: InputDecoration(
        focusedBorder:
       const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: Icon(prefix),
        focusColor: Colors.grey[800],
        fillColor: Colors.grey[800],
        hoverColor: Colors.grey[800],
        suffixIcon: IconButton(
          icon: Icon(suffix),
          color: Colors.grey[800],
          onPressed: onShowPassword,
        ),
      ),
      onFieldSubmitted: onSubmitted!()??(){},
      onChanged: onChanged!()??(){},
      onTap: onTap??(){},
    );