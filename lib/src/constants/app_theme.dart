import 'package:flutter/material.dart';

const _buttonStyle =
    ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap);

class AppTheme {
  static const accentColor = Colors.indigo;
  static final theme = ThemeData(
    primarySwatch: accentColor,
    scaffoldBackgroundColor: Colors.grey.shade300,
    // AppBar
    appBarTheme: const AppBarTheme(centerTitle: true),
    iconTheme: const IconThemeData(color: accentColor),
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // Card
    cardColor: Colors.white,
    cardTheme: const CardTheme(
        elevation: 3,
        shadowColor: Colors.indigoAccent,
        margin: const EdgeInsets.all(0.0),
        clipBehavior: Clip.antiAlias),
    // Buttons
    buttonTheme: const ButtonThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle),
    // Inputs
    inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6.0))),
  );
}
