
import 'package:flutter/material.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:sizer/sizer.dart';

class custtomTextForm extends StatelessWidget {
   custtomTextForm({Key? key,
     required this.textinputtype,
      this.controller,
     this.suffix,
     required this.labelText,
    this.validator}) : super(key: key);
   final TextInputType textinputtype;
  final TextEditingController? controller;
   final String? labelText;
   String? Function(String?)? validator;
   IconData? suffix;
   @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          width: 170.w,
          height: 7.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 2.0,
                color: Colors.grey,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: TextFormField(
              controller: controller,
              keyboardType: textinputtype,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(color: AppColors.blue,width: 0.0),
                  ),
                  suffixIcon: Icon(suffix),
                  hintStyle: AppTheme.lightTheme.textTheme.bodySmall,
                  labelStyle: AppTheme.lightTheme.textTheme.bodySmall,
                  labelText: labelText,
                  fillColor: AppColors.blue,),
                validator: validator,

            ),
          ),
    );
  }
}
