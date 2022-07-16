import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spotify_clone/src/core/routers/spotify_route.dart';
import 'package:spotify_clone/src/core/routers/spotify_router.dart';
import 'package:spotify_clone/src/modules/song/screens/song_playing_screen.dart';

const _song = '/song';
const _playing = '$_song/playing';

final songRoutes = <GoRoute>[
  SpotifyRoute(
    path: _playing,
    pageTransitionBuilder: (state) {
      return const SongPlayingScreen();
    },
  ),
];

void navigateSongPlaying(BuildContext context, {bool push = false}) =>
    navigate(context, _playing, push: push);
