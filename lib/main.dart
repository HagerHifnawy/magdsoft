import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/bloc_observer.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:magdsoft_task/labtop_shop/data/data_sources/remote/dio_helper.dart';
import 'package:magdsoft_task/labtop_shop/presentation/router/app_router.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/helpscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/home_layout.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/homescreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/loginscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/splashscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/verifyphoneotoscreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: Sizer(
        builder:(context,orgentation,deviceTybe){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            initialRoute: '/',
            //onGenerateRoute: AppRouter.onGenerateRoute(),
            home: SplashScreen(),
          );
        }
      )

    );
  }
}
