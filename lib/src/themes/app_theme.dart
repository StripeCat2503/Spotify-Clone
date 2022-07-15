import 'package:flutter/material.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/gen/fonts.gen.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: FontFamily.montserrat,
    primaryColor: ColorName.primary,
    scaffoldBackgroundColor: ColorName.black1,
  );
}
