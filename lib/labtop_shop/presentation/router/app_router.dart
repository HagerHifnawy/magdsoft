import 'package:flutter/material.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/helpscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/home_layout.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/splashscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/verifyphoneotoscreen.dart';

import '../screens/loginscreen.dart';

class AppRouter {

 static Route<dynamic> onGenerateRoute(RouteSettings settings) {
   final args = settings.arguments;
    switch (settings.name) {
     case '/':
       return MaterialPageRoute(builder: (context) =>  SplashScreen());
     case '/login':
       return MaterialPageRoute(builder: (context) => LoginScreen());
      case '/verify':
        return MaterialPageRoute(builder: (context) => VerifyPhoneScreen());
      case '/help':
        return MaterialPageRoute(builder: (context) => HelpScreen());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomeLayout());
      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute(){
    return MaterialPageRoute(builder: (context){
      return Scaffold();
    });
  }
}