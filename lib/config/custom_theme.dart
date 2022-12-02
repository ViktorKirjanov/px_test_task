import 'package:flutter/material.dart';

class CustomTheme {
  static const Color primary = Color.fromRGBO(212, 154, 0, 1);
  static const Color secondary = Color.fromRGBO(255, 185, 1, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color grey1 = Color.fromRGBO(231, 233, 234, 1);
  static const Color grey2 = Color.fromRGBO(184, 189, 191, 1);
  static const Color grey3 = Color.fromRGBO(137, 145, 148, 1);
  static const Color black1 = Color.fromRGBO(18, 35, 41, 1);
  static const Color black2 = Color.fromRGBO(14, 28, 33, 1);
  static const Color black3 = Color.fromRGBO(11, 21, 25, 1);
  static const Color red = Color.fromARGB(255, 195, 70, 61);
  static const Color error = Color.fromRGBO(255, 31, 11, 1);

  static const appBarElevation = 0.0;
  static const bottomNavigationBarElevation = 0.0;

  static const buttonHeight = 56.0;
  static const addButtonHeight = 40.0;

  static const smallSpacing = 8.0;
  static const mediumSpacing = 16.0;
  static const largeSpacing = 24.0;

  static const borderRadius = BorderRadius.all(Radius.circular(6.0));
  static const contentPadding = EdgeInsets.all(mediumSpacing);

  static final Color splashColor = secondary.withOpacity(.5);
  static final Color highlightColor = secondary.withOpacity(.1);

  /// collection
  static const productItemsInRow = 2;
  static const productGridSpacing = smallSpacing;
  static const productItemHeight = 313.0;

  static final darkTheme = ThemeData(
    fontFamily: 'EBGaramond',
    scaffoldBackgroundColor: black2,
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
      backgroundColor: black2,
      foregroundColor: grey1,
      toolbarHeight: 72.0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'EBGaramond',
        fontSize: 32.0,
      ),
      iconTheme: IconThemeData(
        color: grey1,
      ),
      elevation: appBarElevation,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: CustomTheme.black3,
      unselectedItemColor: CustomTheme.grey3,
      selectedItemColor: CustomTheme.white,
      elevation: bottomNavigationBarElevation,
      selectedLabelStyle: TextStyle(
        fontFamily: 'Lato',
        color: CustomTheme.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: 'Lato',
        color: CustomTheme.grey3,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
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
        borderSide: BorderSide(color: error),
      ),
      errorStyle: TextStyle(
        color: error,
        fontSize: 12.0,
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
