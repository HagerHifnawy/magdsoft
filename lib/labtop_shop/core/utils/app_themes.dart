import 'package:flutter/material.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
      textTheme:  TextTheme(

        ///for titles
        bodyLarge: TextStyle(
            fontSize: 35.0,
            fontFamily: 'raleway',
          color: Colors.black87,
          fontWeight: FontWeight.w400

        ),
        /// for Small Text
        bodySmall: TextStyle(
            fontSize: 10.0,
            fontWeight: FontWeight.w400,
          color: AppColors.grey,
        ),
        /// for in TextField
        bodyMedium: TextStyle(
          fontSize: 25.0,
          color: AppColors.white,
          fontFamily: 'raleway',
        ),
       titleLarge: TextStyle(
         fontSize: 15.0,
         color: AppColors.blue,
         fontFamily: 'raleway',
       ),
        titleMedium: TextStyle(
          fontSize: 10.0,
          color: AppColors.blue,
          fontFamily: 'raleway',
        ),
        titleSmall: TextStyle(
          fontSize: 12.0,
          color: Colors.black87,
          fontFamily: 'raleway',
        ),
      ));


}
