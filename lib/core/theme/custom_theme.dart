import 'package:flutter/material.dart';
import 'package:lamlayer/core/theme/custom_button_theme.dart';
import 'package:lamlayer/core/theme/custom_colors.dart';
import 'package:lamlayer/core/theme/custom_text_theme.dart';

class CustomTheme {
  CustomTheme._();

  /// Light Theme
  static ThemeData customLightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // fontFamily: "UberMove",
    scaffoldBackgroundColor: CustomColors.white,
    textTheme: CustomTextTheme.customLightTextTheme,
    primaryColor: CustomColors.primaryColor,
    colorScheme: ColorScheme.light(primary: CustomColors.primaryColor, onPrimary: CustomColors.black),
    elevatedButtonTheme: CustomButtonTheme.customLightButtonTheme,
    iconTheme: IconThemeData(color: CustomColors.grey200),
  );


}
