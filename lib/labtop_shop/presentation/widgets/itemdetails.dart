
import 'package:flutter/material.dart';

import '../../core/utils/app_images.dart';

  Widget ItemDetails(image) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 90,
      height: 80,
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
        padding: const EdgeInsets.all(10.0),
        child: image,
      ),
    );
  }

