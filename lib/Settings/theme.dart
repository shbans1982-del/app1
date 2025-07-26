import 'package:Wanso/Settings/textTheme.dart';
import 'package:flutter/material.dart';

class Ntheme {
  Ntheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    textTheme: NtextTheme.lightTextTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    textTheme: NtextTheme.darkTextTheme,
  );
}
