import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/routers/spotify_route.dart';
import 'package:spotify_clone/src/core/routers/spotify_router.dart';
import 'package:spotify_clone/src/core/screens/main_screen.dart';

const _main = '/main';

final mainRoutes = <GoRoute>[
  SpotifyRoute(
    path: _main,
    pageTransitionBuilder: (_) => const MainScreen(),
  ),
];

void navigateMain(BuildContext context, {bool push = false}) =>
    navigate(context, _main, push: push);
