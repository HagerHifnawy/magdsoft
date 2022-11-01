import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_constants_end_points.dart';
import 'package:magdsoft_task/labtop_shop/data/data_sources/remote/dio_helper.dart';
import 'package:magdsoft_task/labtop_shop/data/models/login_model.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/favoritescreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/helpscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/homescreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/loginscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/notificationscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/settingscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/helpIitem.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_themes.dart';
import '../../data/models/otp_model.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  List<MyItem> _items = <MyItem>[
    new MyItem(header: 'header', body: 'body')
  ];
  void expandedHelpItem( int index, bool isExpanded){
    emit(AppInitialState());
    _items[index].isExpanded = !_items[index].isExpanded;
    emit(AppExpandedHelpState());
  }
  int currentIndex = 2;
  List<Widget> screens = [
    LoginScreen(),
    FavoriteScreen(),
    HomeScreen(),
    NotificationScreen(),
    SettingScreen(),

  ];
  void changeIndex(int index){
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }

  void splash(BuildContext context){
    Timer(const Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => LoginScreen()));
      emit(AppSplashState());
    });
  }
  List <dynamic>productdata = [];
  void getProductData(String url){
    emit(AppLoadingGetDataState());
    DioHelper.getData(url: url,
    ).then((value) {
      //data = value.data['help'];
      //print(data);
      productdata = value.data['products'];
      print(productdata);
      emit(AppSuccessGetDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppErrorGetDataState());
    });
  }
  List<dynamic> helpdata = [];

  void getHelpData(String url){
    emit(AppLoadingGetDataState());
    DioHelper.getData(url: url,
    ).then((value) {
      helpdata = value.data['help'];
      print(helpdata);
      emit(AppSuccessGetDataState());
    }).catchError((onError){
      print(onError.toString());
      emit(AppErrorGetDataState());
    });
  }
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  LoginModel? loginModel;
  void loginUser({
  required String phone, required String name,
}){
    emit(AppLoginLoadingState());
    DioHelper.postData(url: verifyPhoneURL,
      body: {
      'phone':phone,
        'name':name,
      },
    ).then((value) {
      loginModel=LoginModel.fromJson(value.data);
      print(value.data);
      emit(AppLoginSuccessState(loginModel));
    }).catchError((onError){
      emit(AppLoginErrorState(onError.toString()));
    });
  }
OtpModel?otpModel;
  var verifyController1 = TextEditingController();
  var verifyController2 = TextEditingController();
  var verifyController3 = TextEditingController();
  var verifyController4 = TextEditingController();
  String code='';
  void otp({
    required String phone, required String code,context
  }){
    emit(AppOtpLoadingState());
    DioHelper.postData(url: otpURL,
      body: {
      'code':code,
        'phone':phone,
      },
    ).then((value) {
      code=verifyController1.text+
          verifyController2.text+verifyController3.text+
          verifyController4.text;
      print(code);
      otpModel=OtpModel.fromJson(value.data);
      print(value.data);
        emit(AppOtpSuccessState(otpModel));
      }).catchError((onError){
      emit(AppOtpErrorState(onError.toString()));
    });
  }
}