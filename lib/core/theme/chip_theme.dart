import 'package:flutter/material.dart';
import '../assets/custom_colors.dart';

class TejaraChipTheme {
  TejaraChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TejaraColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: TejaraColors.black),
    selectedColor: TejaraColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TejaraColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: TejaraColors.darkerGrey,
    labelStyle: TextStyle(color: TejaraColors.white),
    selectedColor: TejaraColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: TejaraColors.white,
  );
}
