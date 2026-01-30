import 'package:flutter/material.dart';
import 'package:tejara_store/core/assets/sizes.dart';
import '../assets/custom_colors.dart';

/* -- Light & Dark Elevated Button Themes -- */
class TejaraElevatedButtonTheme {
  TejaraElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TejaraColors.light,
      backgroundColor: TejaraColors.primary,
      disabledForegroundColor: TejaraColors.darkGrey,
      disabledBackgroundColor: TejaraColors.buttonDisabled,
      side: const BorderSide(color: TejaraColors.lightContainer),
      padding: const EdgeInsets.symmetric(vertical: TejaraSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TejaraColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TejaraSizes.buttonRadius),
      ),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: TejaraColors.light,
      backgroundColor: TejaraColors.primary,
      disabledForegroundColor: TejaraColors.darkGrey,
      disabledBackgroundColor: TejaraColors.darkerGrey,
      side: const BorderSide(color: TejaraColors.primary),
      padding: const EdgeInsets.symmetric(vertical: TejaraSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 16,
        color: TejaraColors.textWhite,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(TejaraSizes.buttonRadius),
      ),
    ),
  );
}
