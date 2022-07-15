import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/src/core/constants/app_constants.dart';
import 'package:spotify_clone/src/core/routers/spotify_router.dart';
import 'package:spotify_clone/src/themes/app_theme.dart';

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: kDesignSize,
      builder: (context, _) => MaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        title: kAppTitle,
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
      ),
    );
  }
}
