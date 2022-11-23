import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primary = Color.fromRGBO(212, 154, 0, 1);
  static const Color secondary = Color.fromRGBO(255, 185, 1, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color grey1 = Color.fromRGBO(231, 233, 234, 1);
  static const Color grey2 = Color.fromRGBO(184, 189, 191, 1);
  static const Color black3 = Color.fromRGBO(14, 28, 33, 1);
  static const Color red = Color.fromARGB(255, 195, 70, 61);
  static const Color systemError = Color.fromRGBO(255, 31, 11, 1);

  static const appBarElevation = 0.0;
  static const buttonHeight = 56.0;
  static const borderRadius = BorderRadius.all(Radius.circular(6.0));
  static const contentPadding = EdgeInsets.all(16.0);

  static final darkTheme = ThemeData(
    fontFamily: 'EBGaramond',
    scaffoldBackgroundColor: black3,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
      subtitle1: TextStyle(
        fontFamily: 'Lato',
      ),
    ).apply(
      bodyColor: grey1,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: black3,
      foregroundColor: black3,
      iconTheme: IconThemeData(
        color: grey1,
      ),
      elevation: appBarElevation,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      disabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: primary),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: red),
      ),
      errorStyle: TextStyle(
        color: red,
      ),
      errorMaxLines: 2,
      labelStyle: TextStyle(
        color: CustomTheme.primary,
        fontFamily: 'Lato',
      ),
      hintStyle: TextStyle(
        color: CustomTheme.primary,
        fontFamily: 'Lato',
      ),
    ),
    iconTheme: const IconThemeData(color: grey1),
    colorScheme: const ColorScheme.light().copyWith(
      primary: primary,
      secondary: primary,
    ),
  );
}
