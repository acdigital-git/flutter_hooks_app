import 'package:flutter/material.dart';

class AppStyles {
  const AppStyles();

  static const double elevation = 3;
  static const Divider divider32 = Divider(
    thickness: 1.5,
    indent: 90.0,
    endIndent: 90.0,
    height: 32.0,
  );
  static const BorderRadius circularBorderRadius = BorderRadius.all(
    Radius.circular(6.0),
  );
}
