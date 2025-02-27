import 'package:flutter/material.dart';
import 'package:resume_maker/style/color.dart';

class AppStyle {
  static var boxShadow = [
    BoxShadow(
      blurRadius: 10,
      color: AppColors.shadowColor,
      spreadRadius: -1,
    ),
  ];
  static var boxDecoration = BoxDecoration(
    color: AppColors.backGroundColor,
    borderRadius: BorderRadius.circular(10),
  );

  static var txtNormal = TextStyle(
    color: AppColors.txtColor,
    fontSize: 14,
  );
}
