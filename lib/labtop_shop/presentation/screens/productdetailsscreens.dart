import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_constants_end_points.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/custtom_button.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/app_cubit.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_themes.dart';
import '../widgets/itemdetails.dart';

Widget buildDetailsProduct(article) {
  return BlocProvider(
    create: (context) => AppCubit()..getProductData(getProductURL),
    child: BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ScaffoldGradientBackground(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.blue,
              AppColors.white,
            ],
            stops: [0.05, 0.5],
          ),
          body: ConditionalBuilder(
            condition: state is! AppLoadingGetDataState,
            builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 14.w,
                        height:7.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              color: Colors.grey,
                              spreadRadius: 2.0,
                            ),
                          ],
                        ),
                        child: Center(child: Image.asset(AppImages.back)),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Text(
                      '${article['name']}',
                      style: AppTheme.lightTheme.textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Type: ${article['type']}',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 100.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.network('${article['image']}'),
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 12.h,
                      child: ListView(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          scrollDirection: Axis.horizontal,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 10.h,
                                child: ItemDetails(Image.asset(AppImages.helios)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 10.h,
                                child: ItemDetails(Image.network('${article['image']}')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 10.h,
                                child: ItemDetails(Image.asset(AppImages.helios300)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: SizedBox(
                                height: 10.h,
                                child: ItemDetails(Image.asset(AppImages.helios)),
                              ),
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      width: 100.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2.0,
                            color: Colors.grey,
                            spreadRadius: 2.0,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Column(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Container(
                                    height:15.h,
                                  width: 15.w,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 2.0,
                                        color: Colors.grey,
                                        spreadRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                    child:Image.asset(AppImages.acerlogorec),
                                  ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Acer Official Store',
                                              style: AppTheme
                                                  .lightTheme.textTheme.titleSmall,
                                            ),
                                            SizedBox(
                                              height: 0.2.h,
                                            ),
                                            Text(
                                              'View Store',
                                              style: AppTheme
                                                  .lightTheme.textTheme.bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 10.w,
                                        height: 6.h,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[100],
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(6.0),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 2.0,
                                              color: Colors.grey,
                                              spreadRadius: 2.0,
                                            ),
                                          ],
                                        ),
                                        child: Image.asset(AppImages.back2),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price',
                          style: AppTheme.lightTheme.textTheme.bodySmall,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${article['price']} EGP',
                              style: AppTheme.lightTheme.textTheme.titleSmall,
                            ),
                            CusstomButton(
                              text: 'Add To Cart',
                              width: 55.w,
                              backgroundColor: AppColors.blue,
                              function: () {},
                              isUpper: false,
                              radius: 10.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Center(
                          child: Container(
                            height: 0.2.h,
                            width: 150.w,
                            color: AppColors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: AlignmentDirectional.topStart,
                              child: Column(
                                children: [
                                  Text(
                                    'Overview',
                                    style: AppTheme
                                        .lightTheme.textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  CircleAvatar(
                                    minRadius: 4.0,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              'Spesification',
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                            Text(
                              'Review',
                              style: AppTheme.lightTheme.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Text(
                          '${article['description']}',
                          style: AppTheme.lightTheme.textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          ),
        );
      },
    ),
  );
}
