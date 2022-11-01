
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:sizer/sizer.dart';

class VerifyCodeItem extends StatelessWidget {
   VerifyCodeItem({Key? key,required this.onChange,
     required this.validator,required this.controller
   }) : super(key: key);
  ValueChanged<String>? onChange;
  String? Function(String?)? validator;
TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15.w,
      height: 7.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        style: AppTheme.lightTheme.textTheme.titleLarge,
        textAlign: TextAlign.center,
        onChanged: onChange,
        validator: validator,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: BorderSide(color: AppColors.white,width: 0.0),
      ),
    ),)
    );
  }
}
