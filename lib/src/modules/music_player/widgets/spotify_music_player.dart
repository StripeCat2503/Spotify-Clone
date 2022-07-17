import 'package:animated_svg/animated_svg_controller.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_animated_svg_icon.dart';
import 'package:spotify_clone/src/core/components/spotify_icon_button.dart';
import 'package:spotify_clone/src/core/components/spotify_music_progress_bar.dart';

class SpotifyMusicPlayer extends StatefulWidget {
  const SpotifyMusicPlayer({
    Key? key,
    required this.playerState,
    required this.currentDuration,
    required this.totalDuration,
    this.onPlay,
    this.onPause,
    this.onResume,
    this.onPositionChanged,
    this.onDragStart,
    this.onDragEnd,
  }) : super(key: key);

  final Duration currentDuration;
  final Duration totalDuration;
  final PlayerState playerState;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final VoidCallback? onResume;
  final ValueChanged<Duration>? onPositionChanged;
  final VoidCallback? onDragStart;
  final VoidCallback? onDragEnd;

  @override
  State<SpotifyMusicPlayer> createState() => _SpotifyMusicPlayerState();
}

class _SpotifyMusicPlayerState extends State<SpotifyMusicPlayer> {
  late final AnimatedSvgController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimatedSvgController();
  }

  @override
  void didUpdateWidget(covariant SpotifyMusicPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.playerState != widget.playerState) {
      if (widget.playerState == PlayerState.stopped) {
        _controller.reverse();
      }

      if (widget.playerState == PlayerState.playing) {
        _controller.forward();
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SpotifyMusicProgressBar(
          barColor: ColorName.white,
          thumbColor: ColorName.white,
          thumbSize: 13.w,
          height: 4.h,
          duration: widget.currentDuration,
          totalDuration: widget.totalDuration,
          onPositionChanged: widget.onPositionChanged,
          onDragStart: () {
            widget.onDragStart?.call();
          },
          onDragEnd: () => widget.onDragEnd?.call(),
        ),
        SizedBox(
          height: 15.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SpotifyIconButton(
              icon: SvgPicture.asset(
                Assets.icons.svg.suffle.path,
                color: ColorName.white,
              ),
              onTap: () {},
            ),
            Row(
              children: [
                SpotifyIconButton(
                  icon: SvgPicture.asset(
                    Assets.icons.svg.playPrev.path,
                    color: ColorName.white,
                    width: 36.w,
                  ),
                  onTap: () {},
                ),
                SizedBox(
                  width: 45.w,
                ),
                Container(
                  width: 67.w,
                  height: 67.w,
                  decoration: const BoxDecoration(
                    color: ColorName.white,
                    shape: BoxShape.circle,
                  ),
                  child: SpotifyAnimatedSvgIcon(
                    controller: _controller,
                    onTap: _onTapPlay,
                    duration: const Duration(milliseconds: 400),
                    size: 36.w,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.svg.play.path,
                        color: ColorName.black,
                        width: 36.w,
                        fit: BoxFit.scaleDown,
                      ),
                      SvgPicture.asset(
                        Assets.icons.svg.pause.path,
                        color: ColorName.black,
                        width: 36.w,
                        fit: BoxFit.scaleDown,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 45.w,
                ),
                SpotifyIconButton(
                  onTap: () {},
                  icon: SvgPicture.asset(
                    Assets.icons.svg.playNext.path,
                    color: ColorName.white,
                    width: 36.w,
                  ),
                ),
              ],
            ),
            SpotifyIconButton(
              onTap: () {},
              icon: SvgPicture.asset(
                Assets.icons.svg.replay.path,
                color: ColorName.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onTapPlay() {
    if (widget.playerState == PlayerState.playing) {
      widget.onPause?.call();
    }

    if (widget.playerState == PlayerState.paused) {
      widget.onResume?.call();
    }

    if (widget.playerState == PlayerState.stopped) {
      widget.onPlay?.call();
    }
  }
}
