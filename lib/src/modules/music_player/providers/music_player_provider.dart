import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/modules/music_player/values/audio_type.dart';

part 'music_player_provider.freezed.dart';

class MusicPlayerProvider extends StateNotifier<MusicPlayerState> {
  MusicPlayerProvider(super.state);

  AudioPlayer get player => state.player;

  bool dragging = false;
  double currentVolume = 0.0;

  void init() {
    player.onDurationChanged.listen(_onDurationChanged);
    player.onPlayerStateChanged.listen(_onPlayerStateChanged);
    player.onPositionChanged.listen(_onPositionChanged);
    player.onPlayerComplete.listen(_onPlayerComplete);
    player.onSeekComplete.listen(_onSeekComplete);
  }

  Future<void> play(String path) async {
    currentVolume = 1.0;
    await player.play(
      AssetSource(path),
      volume: currentVolume,
    );

    state = state.copyWith(path: path);
  }

  Future<void> pause() async {
    if (player.state == PlayerState.playing) {
      await _decreaseVolumeLinearly();

      await player.pause();
    }
  }

  Future<void> resume() async {
    if (player.state == PlayerState.paused) {
      await player.resume();

      await _increaseVolumeLinearly();
    }
  }

  Future<void> seek(Duration duration) async {
    await player.seek(duration);
  }

  void _onDurationChanged(Duration duration) {
    final currentDuration = state.totalDuration;
    if (currentDuration != null && currentDuration.compareTo(duration) == 0) {
      return;
    }

    log('_onDurationChanged: $duration');
    state = state.copyWith(totalDuration: duration);
  }

  void _onPlayerStateChanged(PlayerState playerState) {
    log('_onPlayerStateChanged: $playerState');
    state = state.copyWith(playerState: playerState);
  }

  void _onPositionChanged(Duration duration) {
    if (dragging) return;

    log('_onPositionChanged: $duration');
    state = state.copyWith(currentDuration: duration);
  }

  Future<void> _onPlayerComplete(void _) async {
    log('_onPlayerComplete');
    await player.stop();
  }

  void _onSeekComplete(void _) {
    log('_onSeekComplete');
  }

  Future<void> _decreaseVolumeLinearly() async {
    currentVolume = 1.0;
    while (currentVolume > 0) {
      var sub = 0.1;
      if (currentVolume > 0.5 && currentVolume < 0.85) {
        sub = 0.3;
      }

      if (currentVolume >= 0.3 && currentVolume <= 0.5) {
        sub = 0.07;
      }

      if (currentVolume >= 0 && currentVolume < 0.3) {
        sub = 0.04;
      }

      currentVolume -= sub;

      await player.setVolume(currentVolume);
      await Future.delayed(
        Duration(
          milliseconds: (300 * currentVolume).ceil(),
        ),
      );
    }
  }

  Future<void> _increaseVolumeLinearly() async {
    while (currentVolume < 1.0) {
      var sub = 0.1;

      if (currentVolume >= 0 && currentVolume < 0.3) {
        sub = 0.02;
      }

      if (currentVolume >= 0.3 && currentVolume <= 0.5) {
        sub = 0.05;
      }

      if (currentVolume > 0.5 && currentVolume < 1) {
        sub = 0.5;
      }

      currentVolume += sub;

      await player.setVolume(currentVolume);
      await Future.delayed(
          Duration(milliseconds: (300 * currentVolume).ceil()));
    }
  }

  @override
  void dispose() {
    _decreaseVolumeLinearly().then((_) {
      state.player.dispose().then((_) => super.dispose());
    });
  }
}

@freezed
class MusicPlayerState with _$MusicPlayerState {
  const factory MusicPlayerState({
    required AudioPlayer player,
    required AudioType audioType,
    String? path,
    @Default(PlayerState.stopped) PlayerState playerState,
    @Default(Duration.zero) Duration currentDuration,
    Duration? totalDuration,
  }) = _MusicPlayerState;
}

final musicPlayerProvider =
    StateNotifierProvider.autoDispose<MusicPlayerProvider, MusicPlayerState>(
        (ref) {
  final player = AudioPlayer();
  const audioType = AudioType.local;

  final initialState = MusicPlayerState(
    player: player,
    audioType: audioType,
  );

  return MusicPlayerProvider(initialState);
});
