import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_images.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/media_query.dart';
import 'package:magdsoft_task/labtop_shop/presentation/router/app_router.dart';

import 'loginscreen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => AppCubit(),
       child: BlocConsumer<AppCubit, AppState>(
         listener: (context, state) {},
         builder: (context, state) {
           if(state is AppInitialState){
           AppCubit.get(context).splash(context);
           }
           return Scaffold(
             body: Container(
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage(
                     AppImages.splach,),
                   fit: BoxFit.cover,
                 ),
               ),
             ),
           );
         },
       ),
     );
  }
}
//BlocProvider(
//       create: (context) => AppCubit(),
//       child: BlocConsumer<AppCubit, AppState>(
//         listener: (context, state) {
//           if(State is AppInitialState){
//             Timer(const Duration(seconds: 5),(){
//               Navigator.pushReplacement(context, AppRouter() as Route<Object?>);
//             });
//           }
//         },
//         builder: (context, state) {
//           return Scaffold(
//             body: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                     AppImages.splach,),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );