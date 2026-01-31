import 'package:flutter/material.dart';
import 'package:tejara_store/core/assets/sizes.dart';
import '../assets/custom_colors.dart';

class TejaraAppBarTheme {
  TejaraAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: TejaraColors.black,
      size: TejaraSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: TejaraColors.black,
      size: TejaraSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: TejaraColors.black,
    ),
  );
  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: TejaraColors.black,
      size: TejaraSizes.iconMd,
    ),
    actionsIconTheme: IconThemeData(
      color: TejaraColors.white,
      size: TejaraSizes.iconMd,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: TejaraColors.white,
    ),
  );
}
