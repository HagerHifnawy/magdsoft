import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_validator.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/helpscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/custtom_button.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/verify_phone_item.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class VerifyPhoneScreen extends StatelessWidget {
  VerifyPhoneScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => AppCubit(),
  child: BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is! AppOtpErrorState) {
          MotionToast(
            primaryColor: AppColors.white,
            width: 80.w,
            height:10.h,
            backgroundType: BackgroundType.solid,
            title: Text('${AppCubit
                .get(context)
                .otpModel!
                .message}'
              , style: AppTheme.lightTheme.textTheme.titleMedium,
            ),
            position: MotionToastPosition.bottom,
            icon: Icons.zoom_out,
            secondaryColor: AppColors.blue,
            description: Text(''),

          ).show(context);}


        },
      builder: (context, state) {
        var cubit =AppCubit.get(context);
        return ScaffoldGradientBackground(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0062BD),
              Color(0xFFFFFFFF),
            ],
            stops: [0.05, 0.5],
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        'Verify Phone',
                        style: AppTheme.lightTheme.textTheme.bodyMedium,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          VerifyCodeItem(
                            controller: cubit.verifyController1,
                            validator: verifyCodeField,
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                          VerifyCodeItem(
                            controller: cubit.verifyController2,
                            validator: verifyCodeField,
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                          VerifyCodeItem(
                            controller: cubit.verifyController3,
                            validator: verifyCodeField,
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                          VerifyCodeItem(
                            controller: cubit.verifyController4,
                            validator: verifyCodeField,
                            onChange: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: (){
                          print(cubit.code);
                        },
                        child: Text(
                          'Resend Code',
                          style: AppTheme.lightTheme.textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),ConditionalBuilder(
                  condition: state is! AppOtpLoadingState,
                  builder:(context)=>
                      CusstomButton(
                          text: 'Verify',
                          width: double.infinity,
                          backgroundColor: AppColors.blue,
                          isUpper: false,
                          radius: 30.0,
                          function: () {
                              cubit.otp(
                                code: cubit.code,
                                phone: AppCubit
                                    .get(context)
                                    .phoneController
                                    .text,);
                              Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => HelpScreen()));
                          }
                          ), fallback: (BuildContext context) =>
                  Center(child: CircularProgressIndicator(),),
                      ),],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ),
);
  }
}
