import 'package:flutter/material.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/gen/fonts.gen.dart';

ThemeData darkTheme() {
  return ThemeData(
    fontFamily: FontFamily.montserrat,
    primaryColor: ColorName.primary,
    scaffoldBackgroundColor: ColorName.black1,
    appBarTheme: _appbarTheme,
    textSelectionTheme: _textSelectionTheme,
  );
}

const _appbarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,
);

const _textSelectionTheme = TextSelectionThemeData(
  cursorColor: ColorName.primary,
);
