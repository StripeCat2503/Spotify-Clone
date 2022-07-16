import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/routers/spotify_route.dart';
import 'package:spotify_clone/src/core/routers/spotify_router.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/screens/sign_up_screen.dart';

const _signUp = '/signup';

final signUpRoutes = <GoRoute>[
  SpotifyRoute(
    path: _signUp,
    pageTransitionBuilder: (_) => const SignUpScreen(),
  ),
];

void navigateSignUp(BuildContext context, {bool push = false}) =>
    navigate(context, _signUp, push: push);
