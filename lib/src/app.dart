import 'package:flutter/material.dart';
import 'package:spotify_clone/src/core/constants/app_constants.dart';
import 'package:spotify_clone/src/themes/app_theme.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppTitle,
      theme: appTheme(),
    );
  }
}
