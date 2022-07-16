import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/routers/routes.dart';

String get initialRoute => welcome;

final router = GoRouter(
  initialLocation: initialRoute,
  routes: rootRoutes,
);

const navigate = SpotifyNavigation();

class SpotifyNavigation {
  const SpotifyNavigation();

  void call(BuildContext context, String path, {bool push = false}) {
    (push ? context.push : context.go).call(path);
  }
}
