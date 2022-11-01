import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_images.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_validator.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/verifyphoneotoscreen.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/custtom_button.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/custtom_login_icon.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/custtom_text_form.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/app_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          if(state is AppLoginSuccessState){
            MotionToast(
              width: 80.w,
              height:10.h,
              primaryColor:AppColors.white,
              backgroundType: BackgroundType.solid,
              title: Text('Your Verivication Code is ${AppCubit.get(context).loginModel!.code}'
              ,style: AppTheme.lightTheme.textTheme.titleMedium,
              ),
              position: MotionToastPosition.top,
              secondaryColor:AppColors.blue,
              icon: Icons.zoom_out, description: Text(''),

            ).show(context);

          }
          Navigator.push(context, MaterialPageRoute(
                builder: (context)=>VerifyPhoneScreen()));
        },
        builder: (context, state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: AlignmentDirectional.topCenter,
                    height: 45.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          AppImages.photo,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 250.0),
                    child: Container(
                      height: 65.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.0),
                            topRight: Radius.circular(40.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: AppColors.blue,
                                  width: 40.w,
                                  height: 0.2.h,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text('OR',
                                  style: AppTheme.lightTheme.textTheme
                                      .titleLarge,),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Container(
                                  width: 40.w,
                                  color: AppColors.blue,
                                  height: 0.2.h,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CusttomLoginIcon(
                                  image: AssetImage(
                                    AppImages.facebook,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                CusttomLoginIcon(
                                  image: AssetImage(
                                    AppImages.ios,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                CusttomLoginIcon(
                                  image: AssetImage(
                                    AppImages.google,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 140.0),
                    child: Center(
                      child: Container(
                        width: 85.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(40.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: Colors.grey,
                              spreadRadius: 5.0,
                            ),
                          ],
                        ),
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Text('Welcome',
                                    style: AppTheme.lightTheme.textTheme.bodyLarge
                                ),
                                SizedBox(height: 2.5.h,),
                                Container(
                                  width: 45.w,
                                  color: AppColors.blue,
                                  height: 0.8.h,
                                ),
                                SizedBox(height: 5.h,),
                                custtomTextForm(
                                  validator: fullNameField,
                                  textinputtype: TextInputType.name,
                                  controller: cubit.nameController,
                                  labelText: 'Enter your Full Name',
                                ),
                                SizedBox(height: 2.h,),
                                custtomTextForm(
                                  validator: phoneField,
                                  textinputtype: TextInputType.phone,
                                  controller: cubit.phoneController,
                                  labelText: 'Enter your Phone Number',
                                ),
                                SizedBox(height: 2.h,),

                                ConditionalBuilder(
                                  condition: state is! AppLoginLoadingState,
                                  builder:(context)=> CusstomButton(
                                      text: 'Login',
                                      width: 170.w,
                                      isUpper: false,
                                      radius: 30.0,
                                      backgroundColor: AppColors.blue,
                                      function: () {
                                        if(formKey.currentState!.validate()){
                                          AppCubit.get(context).loginUser(
                                              phone: cubit.phoneController.text,
                                              name: cubit.nameController.text);
                                        }


                                      }), fallback: (BuildContext context)=>
                                  Center(child: CircularProgressIndicator()),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
//Fluttertoast.showToast(
//                 msg: 'Your Verivication Code is ${AppCubit.get(context).loginModel!.code}',
//             gravity: ToastGravity.TOP,
//               toastLength: Toast.LENGTH_SHORT,
//             );
//             Navigator.push(context, MaterialPageRoute(
//                 builder: (context)=>VerifyPhoneScreen()));