import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_progress_bar.dart';

import 'package:spotify_clone/src/modules/song/widgets/song_playing_app_bar.dart';

class SongPlayingScreen extends StatelessWidget {
  const SongPlayingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          CustomScrollView(
            slivers: [
              SongPlayingAppBar(),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    _buildBodyContentList(),
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

  List<Widget> _buildBodyContentList() {
    return [
      Image.network(
        'https://images.theconversation.com/files/457052/original/file-20220408-15-pl446k.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1000&fit=clip',
        height: 360.h,
        fit: BoxFit.cover,
      ),
      SizedBox(
        height: 30.h,
      ),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phút ban đầu',
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
      SpotifyMusicProgressBar(
        barColor: ColorName.white,
        thumbColor: ColorName.white,
        thumbSize: 13.w,
        height: 4.h,
        value: 0,
      ),
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
