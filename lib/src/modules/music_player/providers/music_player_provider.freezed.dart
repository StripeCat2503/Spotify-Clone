// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'music_player_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MusicPlayerState {
  AudioPlayer get player => throw _privateConstructorUsedError;
  AudioType get audioType => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  PlayerState get playerState => throw _privateConstructorUsedError;
  Duration get currentDuration => throw _privateConstructorUsedError;
  Duration? get totalDuration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MusicPlayerStateCopyWith<MusicPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MusicPlayerStateCopyWith<$Res> {
  factory $MusicPlayerStateCopyWith(
          MusicPlayerState value, $Res Function(MusicPlayerState) then) =
      _$MusicPlayerStateCopyWithImpl<$Res>;
  $Res call(
      {AudioPlayer player,
      AudioType audioType,
      String? path,
      PlayerState playerState,
      Duration currentDuration,
      Duration? totalDuration});
}

/// @nodoc
class _$MusicPlayerStateCopyWithImpl<$Res>
    implements $MusicPlayerStateCopyWith<$Res> {
  _$MusicPlayerStateCopyWithImpl(this._value, this._then);

  final MusicPlayerState _value;
  // ignore: unused_field
  final $Res Function(MusicPlayerState) _then;

  @override
  $Res call({
    Object? player = freezed,
    Object? audioType = freezed,
    Object? path = freezed,
    Object? playerState = freezed,
    Object? currentDuration = freezed,
    Object? totalDuration = freezed,
  }) {
    return _then(_value.copyWith(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as AudioPlayer,
      audioType: audioType == freezed
          ? _value.audioType
          : audioType // ignore: cast_nullable_to_non_nullable
              as AudioType,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      playerState: playerState == freezed
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState,
      currentDuration: currentDuration == freezed
          ? _value.currentDuration
          : currentDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalDuration: totalDuration == freezed
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc
abstract class _$$_MusicPlayerStateCopyWith<$Res>
    implements $MusicPlayerStateCopyWith<$Res> {
  factory _$$_MusicPlayerStateCopyWith(
          _$_MusicPlayerState value, $Res Function(_$_MusicPlayerState) then) =
      __$$_MusicPlayerStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AudioPlayer player,
      AudioType audioType,
      String? path,
      PlayerState playerState,
      Duration currentDuration,
      Duration? totalDuration});
}

/// @nodoc
class __$$_MusicPlayerStateCopyWithImpl<$Res>
    extends _$MusicPlayerStateCopyWithImpl<$Res>
    implements _$$_MusicPlayerStateCopyWith<$Res> {
  __$$_MusicPlayerStateCopyWithImpl(
      _$_MusicPlayerState _value, $Res Function(_$_MusicPlayerState) _then)
      : super(_value, (v) => _then(v as _$_MusicPlayerState));

  @override
  _$_MusicPlayerState get _value => super._value as _$_MusicPlayerState;

  @override
  $Res call({
    Object? player = freezed,
    Object? audioType = freezed,
    Object? path = freezed,
    Object? playerState = freezed,
    Object? currentDuration = freezed,
    Object? totalDuration = freezed,
  }) {
    return _then(_$_MusicPlayerState(
      player: player == freezed
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as AudioPlayer,
      audioType: audioType == freezed
          ? _value.audioType
          : audioType // ignore: cast_nullable_to_non_nullable
              as AudioType,
      path: path == freezed
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      playerState: playerState == freezed
          ? _value.playerState
          : playerState // ignore: cast_nullable_to_non_nullable
              as PlayerState,
      currentDuration: currentDuration == freezed
          ? _value.currentDuration
          : currentDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalDuration: totalDuration == freezed
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration?,
    ));
  }
}

/// @nodoc

class _$_MusicPlayerState implements _MusicPlayerState {
  const _$_MusicPlayerState(
      {required this.player,
      required this.audioType,
      this.path,
      this.playerState = PlayerState.stopped,
      this.currentDuration = Duration.zero,
      this.totalDuration});

  @override
  final AudioPlayer player;
  @override
  final AudioType audioType;
  @override
  final String? path;
  @override
  @JsonKey()
  final PlayerState playerState;
  @override
  @JsonKey()
  final Duration currentDuration;
  @override
  final Duration? totalDuration;

  @override
  String toString() {
    return 'MusicPlayerState(player: $player, audioType: $audioType, path: $path, playerState: $playerState, currentDuration: $currentDuration, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MusicPlayerState &&
            const DeepCollectionEquality().equals(other.player, player) &&
            const DeepCollectionEquality().equals(other.audioType, audioType) &&
            const DeepCollectionEquality().equals(other.path, path) &&
            const DeepCollectionEquality()
                .equals(other.playerState, playerState) &&
            const DeepCollectionEquality()
                .equals(other.currentDuration, currentDuration) &&
            const DeepCollectionEquality()
                .equals(other.totalDuration, totalDuration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(player),
      const DeepCollectionEquality().hash(audioType),
      const DeepCollectionEquality().hash(path),
      const DeepCollectionEquality().hash(playerState),
      const DeepCollectionEquality().hash(currentDuration),
      const DeepCollectionEquality().hash(totalDuration));

  @JsonKey(ignore: true)
  @override
  _$$_MusicPlayerStateCopyWith<_$_MusicPlayerState> get copyWith =>
      __$$_MusicPlayerStateCopyWithImpl<_$_MusicPlayerState>(this, _$identity);
}

abstract class _MusicPlayerState implements MusicPlayerState {
  const factory _MusicPlayerState(
      {required final AudioPlayer player,
      required final AudioType audioType,
      final String? path,
      final PlayerState playerState,
      final Duration currentDuration,
      final Duration? totalDuration}) = _$_MusicPlayerState;

  @override
  AudioPlayer get player;
  @override
  AudioType get audioType;
  @override
  String? get path;
  @override
  PlayerState get playerState;
  @override
  Duration get currentDuration;
  @override
  Duration? get totalDuration;
  @override
  @JsonKey(ignore: true)
  _$$_MusicPlayerStateCopyWith<_$_MusicPlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}
