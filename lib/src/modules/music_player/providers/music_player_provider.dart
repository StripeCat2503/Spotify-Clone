import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/modules/music_player/values/audio_type.dart';

part 'music_player_provider.freezed.dart';

class MusicPlayerProvider extends StateNotifier<MusicPlayerState> {
  MusicPlayerProvider(super.state);

  AudioPlayer get player => state.player;

  void init() {
    player.onDurationChanged.listen(_onDurationChanged);
    player.onPlayerStateChanged.listen(_onPlayerStateChanged);
    player.onPositionChanged.listen(_onPositionChanged);
    player.onPlayerComplete.listen(_onPlayerComplete);
    player.onSeekComplete.listen(_onSeekComplete);
  }

  Future<void> play(String path) async {
    await player.play(
      AssetSource(path),
    );

    state = state.copyWith(path: path);
  }

  Future<void> pause() async {
    if (player.state == PlayerState.playing) {
      await player.pause();
    }
  }

  Future<void> resume() async {
    if (player.state == PlayerState.paused) {
      await player.resume();
    }
  }

  void _onDurationChanged(Duration duration) {
    log('_onDurationChanged: $duration');
    state = state.copyWith(totalDuration: duration);
  }

  void _onPlayerStateChanged(PlayerState playerState) {
    log('_onPlayerStateChanged: $playerState');
    state = state.copyWith(playerState: playerState);
  }

  void _onPositionChanged(Duration duration) {
    log('_onPositionChanged: $duration');
    state = state.copyWith(currentDuration: duration);
  }

  Future<void> _onPlayerComplete(void _) async {
    await player.stop();
  }

  void _onSeekComplete(void event) {}

  @override
  void dispose() {
    super.dispose();
    state.player.dispose();
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
