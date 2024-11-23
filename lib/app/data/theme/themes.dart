import 'package:flutter/material.dart';
import 'package:superops/app/data/resource/color_resource.dart';

class Themes {
  //! LIGHT THEME DATA
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: WHITE,
    primaryColor: APP_MAIN_COLOR,
    primaryColorLight: APP_MAIN_COLOR,
    splashColor: WHITE,
    backgroundColor: WHITE,
    disabledColor: Colors.grey[500],
    highlightColor: WHITE,
    hintColor: Colors.black,
    //
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
    snackBarTheme: const SnackBarThemeData(
        backgroundColor: APP_DARK_GREY,
        elevation: 4,
        contentTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: APP_DARK_GREY,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: APP_MAIN_COLOR, elevation: 4),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.transparent),
    ),
    dividerTheme: const DividerThemeData(thickness: 2, color: INPUT_FIELD_GREY),
    chipTheme: ChipThemeData(
        backgroundColor: Colors.grey.shade500,
        disabledColor: Colors.grey.shade700,
        selectedColor: APP_MAIN_COLOR,
        secondarySelectedColor: WHITE,
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        brightness: Brightness.light,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        secondaryLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        elevation: 4),
// ! input decoration
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
      labelStyle: TextStyle(
          color: TEXT_HEADING, fontWeight: FontWeight.bold, fontSize: 20),
      errorMaxLines: 3,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1,
          color: Colors.red,
        ),
      ),
      errorStyle: TextStyle(
          fontWeight: FontWeight.w200, color: Colors.red, fontSize: 17),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle().copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 28,
        color: TEXT_HEADING,
      ),
      displayMedium:
          const TextStyle().copyWith(color: TEXT_HEADING, fontSize: 24),
      headlineMedium:
          const TextStyle().copyWith(color: TEXT_HEADING, fontSize: 20),
      displaySmall:
          const TextStyle().copyWith(color: TEXT_HEADING, fontSize: 14),
    ).apply(
      bodyColor: Colors.black,
    ),
  );
}
