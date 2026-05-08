import 'package:flutter/material.dart';
import 'package:lamlayer/core/theme/custom_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  /// Helper
  final Widget? helper;

  /// Label
  final String? labelText;
  final TextStyle? labelStyle;

  /// Hint
  final String? hintText;
  final TextStyle? hintStyle;

  /// Actual Text
  final TextStyle? textStyle;

  /// When Occur Error
  final String? errorText;

  /// Keyboard Handle
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;

  /// Permission
  final bool? readOnly;
  final bool? obscureText;

  /// Suffix Icon
  final Widget? suffixIcon;
  final Color? suffixIconColor;

  /// Focus
  final bool? enabled;
  final bool? autoFocus;
  final FocusNode? focusNode;

  /// Range Lines
  final int? maxLines;
  final int? minLines;

  /// Fill Color
  final Color? fillColor;
  final double borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  /// Interactive Color
  final void Function()? onTap;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function(PointerDownEvent)? onTapOutside;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  // final String? Function(String?)? validator;

  /// Border
  final InputBorder? enabledBorder;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.labelText,
    this.labelStyle,
    this.helper,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.enabled,
    this.readOnly,
    this.autoFocus,
    this.obscureText,
    this.suffixIcon,
    this.suffixIconColor,
    this.maxLines = 1,
    this.minLines,
    this.focusNode,
    this.fillColor,
    this.borderRadius = 8.0,
    this.contentPadding,

    /// Validate Function
    // this.validator,

    /// Interactive Function
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.enabledBorder,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      readOnly: readOnly ?? false,
      autofocus: autoFocus ?? false,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: textInputAction ?? TextInputAction.next,
      decoration: InputDecoration(
        /// Hint Text Section
        hintText: hintText ?? "Hint Text...",
        hintStyle: Theme.of(context).textTheme.labelMedium,
        hintFadeDuration: Duration(seconds: 3),

        /// Top Label Text Section
        labelText: labelText,
        labelStyle: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),

        /// Helper
        helper: helper,
        helperStyle: TextStyle(color: Colors.amberAccent),

        /// Error Text Section
        errorText: errorText,
        errorStyle: TextStyle(color: CustomColors.error),

        /// Fill Color Field
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        contentPadding:
        contentPadding ?? EdgeInsets.symmetric(horizontal: 10, vertical: 8),

        /// Suffix Icon
        suffixIcon: suffixIcon,
        suffixIconColor: suffixIconColor ?? Theme.of(context).iconTheme.color,

        /// Border Section
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CustomColors.grey, width: 1),
        ),

        /// This enable when user outside field or initial phase or when user unfocus.
        enabledBorder:
        enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: CustomColors.grey, width: 1),
            ),

        /// This enable when user typing or user on field.
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CustomColors.primaryColor, width: 1),
        ),

        /// This enable when occur error.
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: CustomColors.error, width: 1),
        ),
      ),

      /// Validator Function
      // validator: validator,

      /// Interactive Functions
      onTap: onTap,
      onChanged: onChanged,
      onSaved: onSaved,
      onTapOutside: onTapOutside ?? (v) => FocusScope.of(context).unfocus(),
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
