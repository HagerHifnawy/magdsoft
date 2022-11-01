import 'package:flutter/material.dart';
class HexColor extends Color{
  static int getColorFromHex(String hexcolor){
    hexcolor=hexcolor.toUpperCase().replaceAll('#', '');
    if(hexcolor.length==6){
      hexcolor='FF$hexcolor';
    }
    return int.parse(hexcolor,radix: 16);
  }
  HexColor(final String hexcolor):super(getColorFromHex(hexcolor));
}


class AppColors{
  static const Color white = Color(0xFFFFFFFF);
  static Color blue = Color(0xFF0062BD);
  static Color grey = Color(0xFFB1B1B1);
}