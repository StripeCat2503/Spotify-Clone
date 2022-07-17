import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/routers/spotify_route.dart';
import 'package:spotify_clone/src/core/routers/spotify_router.dart';
import 'package:spotify_clone/src/modules/music_player/screens/music_player_screen.dart';

const _song = '/song';
const _playing = '$_song/playing';

final musicPlayerRoutes = <GoRoute>[
  SpotifyRoute(
    path: _playing,
    transitionType: SpotifyPageTransitionType.slideVertical,
    transitionDuration: const Duration(milliseconds: 500),
    pageTransitionBuilder: (state) {
      return const MusicPlayerScreen();
    },
  ),
];

void navigateMusicPlayer(BuildContext context, {bool push = false}) =>
    navigate(context, _playing, push: push);
