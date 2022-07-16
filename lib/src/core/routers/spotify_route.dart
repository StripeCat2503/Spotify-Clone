import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

typedef SpotifyPageBuilder = Widget Function(GoRouterState state);

enum SpotifyPageTransitionType {
  slide,
  scale,
  fade,
}

Widget _spotifyTransitionBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child, {
  SpotifyPageTransitionType transitionType = SpotifyPageTransitionType.fade,
}) {
  return _transitionMapper(transitionType, animation, child);
}

Widget _transitionMapper(
  SpotifyPageTransitionType transitionType,
  Animation<double> animation,
  Widget child,
) {
  switch (transitionType) {
    case SpotifyPageTransitionType.slide:
      return _slideTransition(animation, child);
    case SpotifyPageTransitionType.fade:
      return _fadeTransition(animation, child);
    case SpotifyPageTransitionType.scale:
      return _scaleTransition(animation, child);
  }
}

Widget _scaleTransition(Animation<double> animation, Widget child) {
  final scale = Tween<double>(begin: 0, end: 1).animate(animation);

  return ScaleTransition(
    scale: scale,
    child: child,
  );
}

Widget _fadeTransition(Animation<double> animation, Widget child) {
  final opacity = Tween<double>(begin: 0, end: 1).animate(animation);

  return FadeTransition(
    opacity: opacity,
    child: child,
  );
}

Widget _slideTransition(Animation<double> animation, Widget child) {
  final offset = Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero);

  return SlideTransition(
    position: animation.drive(offset),
    child: child,
  );
}

class SpotifyRoute extends GoRoute {
  SpotifyRoute({
    required super.path,
    required this.pageTransitionBuilder,
    this.transitionType = SpotifyPageTransitionType.fade,
  }) : super(builder: _defaultBuilder);

  final SpotifyPageBuilder pageTransitionBuilder;
  final SpotifyPageTransitionType transitionType;

  @override
  GoRouterPageBuilder? get pageBuilder =>
      (context, state) => CustomTransitionPage(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    _spotifyTransitionBuilder(
              context,
              animation,
              secondaryAnimation,
              child,
              transitionType: transitionType,
            ),
            child: pageTransitionBuilder(state),
          );

  static Widget _defaultBuilder(BuildContext context, GoRouterState state) =>
      const SizedBox.shrink();
}
