import 'package:flutter/material.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';

import '../core/theme/custom_colors.dart';

class CustomCherryToast {
  static void success(BuildContext context, {String? title}) {
    return CherryToast.success(
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
      borderRadius: 5,
      displayCloseButton: false,
      titleDescriptionMargin: 40,
      iconWidget: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // ignore: deprecated_member_use
          color: CustomColors.primaryColor.withOpacity(0.3),
        ),
        child: Padding(
          padding:  EdgeInsets.all(5),
          child: Icon(Icons.done),
          // child: Image.asset(
          //   'assets/images/epay_logo.png',
          //   width: 30,
          //   height: 30,
          //   scale: 1.0,
          // ),
        ),
      ),
      backgroundColor: CustomColors.white,
      title: Text(
        title ?? "The toast title.",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: CustomColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).show(context);
  }

  static void warning(BuildContext context, {String? title}) {
    return CherryToast.warning(
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
      borderRadius: 5,
      displayCloseButton: false,
      titleDescriptionMargin: 40,
      iconWidget: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // ignore: deprecated_member_use
          color: Colors.amber.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(Icons.warning_rounded),
          // child: Image.asset(
          //   'assets/images/warning.png',
          //   width: 30,
          //   height: 30,
          //   scale: 1.0,
          // ),
        ),
      ),
      backgroundColor: CustomColors.custom('efef8d'),
      title: Text(
        title ?? "The toast title.",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: CustomColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).show(context);
  }

  static void error(BuildContext context, {String? title}) {
    return CherryToast.error(
      toastPosition: Position.top,
      animationType: AnimationType.fromTop,
      borderRadius: 5,
      displayCloseButton: false,
      titleDescriptionMargin: 40,
      iconWidget: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          // ignore: deprecated_member_use
          color: CustomColors.white.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(Icons.error),
          // child: Image.asset(
          //   'assets/images/error_icon.png',
          //   width: 30,
          //   height: 30,
          //   scale: 1.0,
          // ),
        ),
      ),
      backgroundColor: CustomColors.error,
      title: Text(
        title ?? "The toast title.",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: CustomColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ).show(context);
  }
}
