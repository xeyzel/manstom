import 'package:flutter/material.dart';
import 'package:inventory_app/core/constant/string_resource.dart';
import '../constant/custom_color.dart';

class CustomTheme {
  static ThemeData get themeData {
    final themeData = ThemeData(
      fontFamily: StringResource.openSans,
      primarySwatch: CustomColor.primary,
    );

    final borderRadius = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    );

    final elevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: borderRadius,
      ),
    );

    final inputDecorationTheme = themeData.inputDecorationTheme.copyWith(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    );

    return themeData.copyWith(
      elevatedButtonTheme: elevatedButtonTheme,
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: inputDecorationTheme,
    );
  }
}
