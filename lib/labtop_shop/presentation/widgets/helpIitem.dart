import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_task/labtop_shop/business_logic/cubit/app_cubit.dart';
import 'package:magdsoft_task/labtop_shop/core/utils/app_themes.dart';


  List<MyItem> _items = <MyItem>[
    MyItem(header: 'header', body: 'body')];
  Widget buildItem(article) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
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

            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                AppCubit.get(context).expandedHelpItem(index, isExpanded);
                //setState(() {
                _items[index].isExpanded = !_items[index].isExpanded;
                //});
              },
              children: _items.map((MyItem item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text("${article['question']}",style:AppTheme.lightTheme.textTheme.titleLarge,),
                    );
                  },
                  isExpanded: item.isExpanded,
                  body: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text("${article['answer']}",
                style: AppTheme.lightTheme.textTheme.titleSmall,
                  ),)
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }

class MyItem {
  MyItem({ this.isExpanded: false, required this.header, required this.body });

  bool isExpanded;
  final String header;
  final String body;
}

