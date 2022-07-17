import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_icon_button.dart';
import 'package:spotify_clone/src/core/components/spotify_music_progress_bar.dart';

class SpotifyMusicPlayer extends HookConsumerWidget {
  const SpotifyMusicPlayer({
    Key? key,
    required this.playerState,
    required this.currentDuration,
    required this.totalDuration,
    this.onPlay,
    this.onPause,
    this.onResume,
  }) : super(key: key);

  final Duration currentDuration;
  final Duration totalDuration;
  final PlayerState playerState;
  final VoidCallback? onPlay;
  final VoidCallback? onPause;
  final VoidCallback? onResume;

  Widget get _playIcon {
    if (playerState == PlayerState.stopped ||
        playerState == PlayerState.paused) {
      return SvgPicture.asset(
        Assets.icons.svg.play.path,
        color: ColorName.black,
        width: 36.w,
        fit: BoxFit.scaleDown,
      );
    }

    return SvgPicture.asset(
      Assets.icons.svg.pause.path,
      color: ColorName.black,
      width: 36.w,
      fit: BoxFit.scaleDown,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        SpotifyMusicProgressBar(
          barColor: ColorName.white,
          thumbColor: ColorName.white,
          thumbSize: 13.w,
          height: 4.h,
          duration: currentDuration,
          totalDuration: totalDuration,
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
                SpotifyIconButton(
                  onTap: _onTapPlay,
                  icon: Container(
                    width: 67.w,
                    height: 67.w,
                    decoration: const BoxDecoration(
                      color: ColorName.white,
                      shape: BoxShape.circle,
                    ),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: _playIcon,
                    ),
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
    if (playerState == PlayerState.playing) {
      onPause?.call();
    }

    if (playerState == PlayerState.paused) {
      onResume?.call();
    }

    if (playerState == PlayerState.stopped) {
      onPlay?.call();
    }
  }
}
