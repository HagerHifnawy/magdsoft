
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/app_cubit.dart';
import '../../core/utils/app_colors.dart';
import '../../core/utils/app_images.dart';
import '../../core/utils/app_themes.dart';

  Widget buildItemOfProduct(article) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 14.0),
        child: Center(
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 40.w,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    width: 50.w,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Center(
                            child: Image.network(
                              '${article['image']}',
                            ),
                          ),
                          Image.asset(
                            AppImages.heart,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${article['company']}',
                        style: AppTheme.lightTheme.textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Text(
                        '${article['name']}',
                        style: AppTheme.lightTheme.textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${article['price']}',
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                          Container(
                            width: 10.w,//MediaQuery.of(context).size.width/8,
                            height: 7.h,
                            alignment: AlignmentDirectional.bottomEnd,
                            decoration: BoxDecoration(
                              color: AppColors.blue,
                              borderRadius: BorderRadiusDirectional.only(
                                topStart:Radius.circular(20.0),
                                bottomEnd: Radius.circular(20.0),
                              ),
                            ),
                            child: Center(child: Icon(Icons.add,color: AppColors.white,)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
    );
  }
