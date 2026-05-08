import 'package:flutter/material.dart';
import 'package:lamlayer/core/theme/custom_colors.dart';

class CustomTextTheme {
  CustomTextTheme._();

  /// This Light Text Theme.
  static TextTheme customLightTextTheme = TextTheme(

    /// This is heading.
    headlineLarge: const TextStyle().copyWith(color: CustomColors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
    headlineMedium: const TextStyle().copyWith(color: CustomColors.black, fontSize: 22.0, fontWeight: FontWeight.w600),
    headlineSmall: const TextStyle().copyWith(color: CustomColors.black, fontSize: 18.0, fontWeight: FontWeight.w600),

    /// This is title.
    titleLarge: const TextStyle().copyWith(color: CustomColors.black, fontSize: 16.0,fontWeight: FontWeight.w600),
    titleMedium: const TextStyle().copyWith(color: CustomColors.black, fontSize: 16.0, fontWeight: FontWeight.w500),
    titleSmall: const TextStyle().copyWith(color: Colors.black, fontSize: 16.0, fontWeight: FontWeight.w400),

    /// This is body.
    bodyLarge: const TextStyle().copyWith(color: CustomColors.black, fontSize: 14.0, fontWeight: FontWeight.w500),
    bodyMedium: const TextStyle().copyWith(color: CustomColors.black, fontSize: 14.0, fontWeight: FontWeight.normal),
    bodySmall: const TextStyle().copyWith(color: CustomColors.blackWithOpacity, fontSize: 14.0, fontWeight: FontWeight.w500),

    /// This is label.
    labelLarge: const TextStyle().copyWith(color: CustomColors.black, fontSize: 12.0, fontWeight: FontWeight.normal),
    labelMedium: const TextStyle().copyWith(color: CustomColors.blackWithOpacity, fontSize: 12, fontWeight: FontWeight.normal),
    labelSmall: const TextStyle().copyWith(color: CustomColors.blackWithOpacity, fontSize: 10.0, fontWeight: FontWeight.normal),
  );

}
