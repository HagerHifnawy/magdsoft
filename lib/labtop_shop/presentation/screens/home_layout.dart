import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/loginscreen.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

import '../../core/utils/app_images.dart';

class HomeLayout extends StatelessWidget {
   HomeLayout({Key? key}) : super(key: key);
Color color = AppColors.grey;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return ScaffoldGradientBackground(
            extendBody: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF0062BD),
                Color(0xFFFFFFFF),
              ],
              stops: [0.05, 0.5],
            ),
            bottomNavigationBar:
            CurvedNavigationBar(
              backgroundColor: Colors.transparent,
             buttonBackgroundColor: AppColors.blue,
             // type: BottomNavigationBarType.fixed,
              index: cubit.currentIndex,
              items: [
                IconButton(onPressed:(){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                }, icon: Icon(
                  Icons.logout,
                  color: cubit.currentIndex==0?AppColors.white:AppColors.grey,
                  size: 30.0, ),),

                  ImageIcon(
                    color: cubit.currentIndex==1?AppColors.white:AppColors.grey,
                    AssetImage(
                      AppImages.greyheart
                    )  ,

                  ),
                 Icon(
                    Icons.home,
                   color: cubit.currentIndex==2?AppColors.white:AppColors.grey,
                    size: 30.0,
                ),
                ImageIcon(
                  color: cubit.currentIndex==3?AppColors.white:AppColors.grey,
                  AssetImage(
                      AppImages.notification
                  )  ,

                ),
                  Icon(
                    Icons.settings_rounded,
                    color: cubit.currentIndex==4?AppColors.white:AppColors.grey,
                    size: 30.0,
                  ),
              ],
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
