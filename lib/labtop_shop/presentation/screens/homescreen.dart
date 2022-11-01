import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_colors.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_constants_end_points.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_images.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';
import 'package:magdsoft_task/labtop_shop/presentation/screens/productdetailsscreens.dart';
import 'package:magdsoft_task/labtop_shop/presentation/widgets/type_item.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:sizer/sizer.dart';

import '../../business_logic/cubit/app_cubit.dart';
import '../widgets/custtom_text_form.dart';
import '../widgets/itemofproduct.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getProductData(getProductURL),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var list = AppCubit.get(context).productdata;
          return ConditionalBuilder(
            condition: state is! AppLoadingGetDataState,
            builder: (context) => ScaffoldGradientBackground(
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    right: 20.0,
                    left: 20.0,
                    bottom: 20.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 75.w,
                            child: custtomTextForm(
                              textinputtype: TextInputType.name,
                              labelText: 'Search',
                              suffix: Icons.search,

                            ),
                          ),
                          Container(
                            width: 7.h,
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
                            child: Image.asset(AppImages.cup),
                          ),
                        ],
                      ),
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        height: 30.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppImages.acer,
                            ),
                            // fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 7.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                             labTybeItem(
                                  AssetImage(AppImages.cupYellow),'All',AppColors.blue,),
                            SizedBox(width: 2.5.w,),
                            labTybeItem(
                                AssetImage(AppImages.razerlogo),'Acer',AppColors.white,),
                            SizedBox(width: 2.5.w,),
                            labTybeItem(

                                AssetImage(AppImages.acerlogo),'Razer',AppColors.white,),
                            SizedBox(width: 2.5.w,),
                            labTybeItem(
                                AssetImage(AppImages.ios),'Apple',AppColors.white,),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Recomended \n For You',
                                  style: TextStyle(
                                      fontSize: 25.0, color: Colors.black87),
                                ),
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          buildDetailsProduct(
                                                              list[index])));
                                            },
                                            child: buildItemOfProduct(
                                                list[index+=1])),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                    itemCount: 3),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          buildDetailsProduct(
                                                              list[index])));
                                            },
                                            child: buildItemOfProduct(
                                                list[index])),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                    itemCount: 3),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (BuildContext context) =>
                Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
