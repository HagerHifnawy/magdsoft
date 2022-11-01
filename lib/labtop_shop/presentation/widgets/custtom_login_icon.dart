
import 'package:flutter/material.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';

class CusttomLoginIcon extends StatelessWidget {
  const CusttomLoginIcon({Key? key, required this.image}) : super(key: key);
final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Colors.grey,
            spreadRadius: 5.0,
          ),
        ],
      ),
      child: CircleAvatar(
        radius: 20.0,
        backgroundColor: AppColors.white,
        child: Image(image:image),
      ),
    );
  }
}
