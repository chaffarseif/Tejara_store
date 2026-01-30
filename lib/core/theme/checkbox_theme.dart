import 'package:flutter/material.dart';
import '../assets/custom_colors.dart';
import '../assets/sizes.dart';

/// Custom Class for Light & Dark Text Themes
class TejaraCheckboxTheme {
  TejaraCheckboxTheme._(); // To avoid creating instances

  /// Customizable Light Text Theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TejaraSizes.xs),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TejaraColors.white;
      } else {
        return TejaraColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TejaraColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );

  /// Customizable Dark Text Theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TejaraSizes.xs),
    ),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TejaraColors.white;
      } else {
        return TejaraColors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return TejaraColors.primary;
      } else {
        return Colors.transparent;
      }
    }),
  );
}
