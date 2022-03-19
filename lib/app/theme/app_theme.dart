import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class AppTheme {
  static ThemeData lightThemeData = FlexThemeData.light(
    scaffoldBackground: Colors.grey[50],
    scheme: FlexScheme.shark,
    //  textTheme: GoogleFonts.nunitoTextTheme(),
  );
  static ThemeData darkThemeData = FlexThemeData.dark(
    scaffoldBackground: const Color.fromARGB(255, 14, 13, 13),
    scheme: FlexScheme.shark,
    // textTheme: GoogleFonts.nunitoTextTheme(),
  );
}
