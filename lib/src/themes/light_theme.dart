import 'package:flutter/material.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/gen/fonts.gen.dart';

ThemeData lightTheme() {
  return ThemeData(
    fontFamily: FontFamily.montserrat,
    primaryColor: ColorName.primary,
    scaffoldBackgroundColor: ColorName.black1,
    appBarTheme: _appbarTheme,
    textSelectionTheme: _textSelectionTheme,
    backgroundColor: ColorName.black1,
  );
}

const _appbarTheme = AppBarTheme(
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,
  actionsIconTheme: _actionsIconTheme,
);

const _actionsIconTheme = IconThemeData(
  color: ColorName.white,
  size: 24,
  opacity: 1,
);

const _textSelectionTheme = TextSelectionThemeData(
  cursorColor: ColorName.primary,
  selectionColor: ColorName.primary,
  selectionHandleColor: ColorName.primary,
);
