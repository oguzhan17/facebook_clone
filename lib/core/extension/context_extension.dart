import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  double dynamicHeight(val) => MediaQuery.of(this).size.height * val;
  double dynamicWidth(val) => MediaQuery.of(this).size.width * val;

  ThemeData get theme => Theme.of(this);
}

extension NumberExtension on BuildContext{
  double get lowValue => dynamicHeight(0.01);
  double get mediumValue => dynamicWidth(0.03);
}