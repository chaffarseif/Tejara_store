import 'package:flutter/material.dart';
import 'package:tejara_store/core/assets/custom_colors.dart';
import 'package:tejara_store/core/assets/sizes.dart';

class TejaraTextFormFieldTheme {
  TejaraTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TejaraColors.darkGrey,
    suffixIconColor: TejaraColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: TejaraSizes.fontSizeMd,
      color: TejaraColors.black,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TejaraSizes.fontSizeSm,
      color: TejaraColors.black,
    ),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TejaraColors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TejaraColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: TejaraColors.darkGrey,
    suffixIconColor: TejaraColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
      fontSize: TejaraSizes.fontSizeMd,
      color: TejaraColors.white,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: TejaraSizes.fontSizeSm,
      color: TejaraColors.white,
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TejaraColors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: TejaraColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(TejaraSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: TejaraColors.warning),
    ),
  );
}
