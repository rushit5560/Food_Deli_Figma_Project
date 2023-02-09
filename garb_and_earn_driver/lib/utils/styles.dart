import 'package:flutter/material.dart';


class InputFieldStyles {

  InputBorder inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade400),
      // borderSide: const BorderSide(width: 1.0),
    );
  }

  InputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.red),
      // borderSide: const BorderSide(width: 1.0),
    );
  }

}


class TextStyleConfig {

  static TextStyle textStyle({
    Color textColor = Colors.black,
    FontWeight fontWeight = FontWeight.normal,
    double fontSize = 15.0,
    // String fontFamily = "Roboto",
  }) {
    return TextStyle(
      color: textColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      // fontFamily: fontFamily,
    );
  }

}