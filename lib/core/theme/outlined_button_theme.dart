import 'package:flutter/material.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/core/assets/sizes.dart';

/* -- Light & Dark Outlined Button Themes -- */
class TejaraOutlinedButtonTheme {
  TejaraOutlinedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: TejaraColors.dark,
      side: const BorderSide(color: TejaraColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TejaraColors.black,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: TejaraSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TejaraSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: TejaraColors.light,
      side: const BorderSide(color: TejaraColors.borderPrimary),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TejaraColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: TejaraSizes.buttonHeight,
        horizontal: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TejaraSizes.buttonRadius),
      ),
    ),
  );
}
