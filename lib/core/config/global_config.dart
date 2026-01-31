import 'package:flutter/material.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/core/theme/appbar_theme.dart';
import 'package:tejara_store/core/theme/bottom_sheet_theme.dart';
import 'package:tejara_store/core/theme/checkbox_theme.dart';
import 'package:tejara_store/core/theme/chip_theme.dart';
import 'package:tejara_store/core/theme/elevated_button_theme.dart';
import 'package:tejara_store/core/theme/outlined_button_theme.dart';
import 'package:tejara_store/core/theme/text_field_theme.dart';
import 'package:tejara_store/core/theme/text_theme%20copy.dart';

class TejaraTheme {
  TejaraTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TejaraColors.grey,
    brightness: Brightness.light,
    primaryColor: TejaraColors.primary,
    textTheme: TejaraTextTheme.lightTextTheme,
    chipTheme: TejaraChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TejaraColors.white,
    appBarTheme: TejaraAppBarTheme.lightAppBarTheme,
    checkboxTheme: TejaraCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: TejaraBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TejaraElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TejaraOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TejaraTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: TejaraColors.grey,
    brightness: Brightness.dark,
    primaryColor: TejaraColors.primary,
    textTheme: TejaraTextTheme.darkTextTheme,
    chipTheme: TejaraChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TejaraColors.black,
    appBarTheme: TejaraAppBarTheme.darkAppBarTheme,
    checkboxTheme: TejaraCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: TejaraBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TejaraElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TejaraOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TejaraTextFormFieldTheme.darkInputDecorationTheme,
  );
}
