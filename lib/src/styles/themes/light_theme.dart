import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/styles/app_styles.dart';

class LightTheme {
  const LightTheme();

  /// Colors
  static const _accentColor = Colors.indigo;
  static const _scaffoldClr = Color(0xFFE0E0E0);
  static const _primaryLightClr = Color(0xFFF5F5F5);
  static const _shadowClr = Colors.indigoAccent;

  /// ThemeData
  static final theme = ThemeData(
    primarySwatch: _accentColor,
    primaryColorDark: _primaryLightClr,
    scaffoldBackgroundColor: _scaffoldClr,
    // AppBar
    appBarTheme: const AppBarTheme(centerTitle: true),
    // Icons
    iconTheme: const IconThemeData(color: _accentColor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // Card
    cardColor: _primaryLightClr,
    cardTheme: const CardTheme(
      elevation: AppStyles.elevation,
      shadowColor: _shadowClr,
      margin: const EdgeInsets.all(0.0),
      clipBehavior: Clip.antiAlias,
    ),
    // Buttons
    buttonTheme: const ButtonThemeData(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    ),
    // InputFields
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: _primaryLightClr,
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: AppStyles.circularBorderRadius,
      ),
    ),
  );
}
