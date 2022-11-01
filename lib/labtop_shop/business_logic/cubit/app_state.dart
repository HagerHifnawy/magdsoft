part of 'app_cubit.dart';

abstract class AppState  {
  const AppState();
}

class AppInitialState extends AppState {}
class AppSplashState extends AppState {}
class AppExpandedHelpState extends AppState {}
class AppChangeBottomNavBarState extends AppState {}
class AppLoadingGetDataState extends AppState {}
class AppSuccessGetDataState extends AppState {}
class AppErrorGetDataState extends AppState {}
class AppLoginLoadingState extends AppState {}
class AppLoginSuccessState extends AppState {
  final LoginModel? loginModel;

  AppLoginSuccessState(this.loginModel);
}
class AppLoginErrorState extends AppState {
  final String error;

  AppLoginErrorState(this.error);

}
class AppOtpLoadingState extends AppState {}
class AppOtpSuccessState extends AppState {
  final OtpModel? otpModel;

  AppOtpSuccessState(this.otpModel);

}
class AppOtpErrorState extends AppState {
  final String error;

  AppOtpErrorState(this.error);
}

