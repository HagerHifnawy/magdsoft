
import 'package:flutter/material.dart';

class CusstomButton extends StatelessWidget {
  double width = double.infinity;
  Color backgroundColor = Colors.blue;
  bool isUpper = true;
  double radius = 30.0;
  VoidCallback function;
   String text;
   CusstomButton({Key? key,
     required this.text,
   required this.width,
   required this.backgroundColor,
     required this.isUpper,
      required this.radius,
     required this.function,
   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpper ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
