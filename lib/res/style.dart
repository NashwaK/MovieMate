import 'package:flutter/material.dart';


//todo large heading ->size 26
//todo normal heading ->size 14
//todo middle heading ->size 18


customStyle(var fontSize, var color, var fontWeight) {
  return TextStyle(
    fontSize: double.parse(fontSize.toString()),
    color: color,
    fontWeight: fontWeight,
  );
}

customStyleUnderline(var fontSize, var color, var fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    shadows: [
      Shadow(offset: Offset(0, -1), color: color)
    ],
    decoration: TextDecoration.underline,
    decorationColor: color,
  );
}