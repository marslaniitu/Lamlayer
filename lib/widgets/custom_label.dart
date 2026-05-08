import 'package:flutter/material.dart';

Text customLabel(BuildContext context, {String? text}) => Text(
  text ?? 'Label',
  style: Theme.of(
    context,
  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
);
