import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData buildLightTheme() {
    return ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.k2dTextTheme(),
        iconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.grey,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(Colors.black),
          trackColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black),
        ));
  }

  static ThemeData buildDarkTheme() {
    return ThemeData(
        brightness: Brightness.dark,
        textTheme: GoogleFonts.k2dTextTheme(),
        iconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.grey,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.all<Color>(Colors.white),
          trackColor: MaterialStateProperty.all<Color>(Colors.blue),
          overlayColor: MaterialStateProperty.all<Color>(Colors.white),
        ));
  }
}
