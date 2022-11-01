import 'package:flutter/material.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_images.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';

  Widget labTybeItem(image,text,Color color) {
    return Container(
      width:100.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 2.0,
            color: Colors.grey,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top:3.0,right: 5.0,left: 5.0,bottom: 3.0),
        child: Center(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 2.0,
                      color: Colors.grey,
                      spreadRadius: 3.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  radius: 15.0,
                  backgroundImage: image,
                ),
              ),
              SizedBox(width: 5.0,),
              Text(text,style: AppTheme.lightTheme.textTheme.titleSmall,)
            ],
          ),
        ),
      ),
    );
  }
