import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/home_layout.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/custtom_button.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/helpIitem.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:sizer/sizer.dart';

import '../../core/utils/app_constants_end_points.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHelpData(getHelpURL),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var list =AppCubit.get(context).helpdata;
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
                body: ConditionalBuilder(
                  condition: state is! AppLoadingGetDataState,
                  builder: (context) =>SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 40.0,
                          left: 15.0,
                          right: 15.0,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Help',
                              style: AppTheme.lightTheme.textTheme.bodyMedium,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                                itemBuilder: (context, index) => buildItem(list[index]),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 3.h,
                                    ),
                                itemCount: list.length),
                           // buildItem(list[0]),
                            Padding(
                              padding: const EdgeInsets.only(top: 120.0),
                              child: CusstomButton(
                                  text: 'Continue',
                                  width: 65.w,
                                  isUpper: false,
                                  radius: 30.0,
                                  backgroundColor: AppColors.blue,
                                  function: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder:(context) => HomeLayout()));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ), fallback: (BuildContext context) =>
                    Center(child: CircularProgressIndicator())
              ),
          );
        },
      ),
    );
  }
}
