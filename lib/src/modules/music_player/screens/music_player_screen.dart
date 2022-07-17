import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/modules/music_player/providers/music_player_provider.dart';
import 'package:spotify_clone/src/modules/music_player/widgets/music_player_app_bar.dart';
import 'package:spotify_clone/src/modules/music_player/widgets/music_player_art_image.dart';
import 'package:spotify_clone/src/modules/music_player/widgets/music_player_bottom_actions.dart';
import 'package:spotify_clone/src/modules/music_player/widgets/spotify_music_player.dart';

class MusicPlayerScreen extends HookConsumerWidget {
  const MusicPlayerScreen({Key? key}) : super(key: key);

  String get path => 'audios/dong_kiem_em.mp3';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(musicPlayerProvider.notifier);
    final state = ref.watch(musicPlayerProvider);

    useEffect(
      () {
        provider.init();
        return () => {};
      },
      [],
    );

    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          CustomScrollView(
            slivers: [
              MusicPlayerAppBar(),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    _buildBodyContentList(provider, state),
                  ),
                ),
              ),
              const SliverFillRemaining(),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBodyContentList(
    MusicPlayerProvider provider,
    MusicPlayerState state,
  ) {
    return [
      const MusicPlayerArtImage(),
      SizedBox(
        height: 30.h,
      ),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Đông kiếm em',
                style: TextStyle(
                  color: ColorName.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 22.sp,
                ),
              ),
              Text(
                'Vũ',
                style: TextStyle(
                  color: ColorName.white.withOpacity(0.84),
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(
            Assets.icons.svg.heart.path,
            width: 24.w,
            color: ColorName.white,
          ),
        ],
      ),
      SizedBox(
        height: 20.h,
      ),
      SpotifyMusicPlayer(
        playerState: state.playerState,
        currentDuration: state.currentDuration,
        totalDuration: state.totalDuration ?? state.currentDuration,
        onPlay: () async {
          await provider.play(path);
        },
        onPause: () async {
          await provider.pause();
        },
        onResume: () async {
          await provider.resume();
        },
      ),
      SizedBox(
        height: 25.h,
      ),
      const MusicPlayerBottomActions(),
    ];
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff43cea2),
            Color(0xff185a9d),
          ],
        ),
      ),
    );
  }
}
