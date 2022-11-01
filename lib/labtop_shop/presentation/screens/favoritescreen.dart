import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
              child: Text('Favorite Screen',
                style: AppTheme.lightTheme.textTheme.bodyLarge,
              ),

          );

  }
}