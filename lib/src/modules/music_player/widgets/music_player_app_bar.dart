import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class MusicPlayerAppBar extends SliverAppBar {
  final VoidCallback? onLeadingTap;

  const MusicPlayerAppBar({this.onLeadingTap});

  @override
  bool get floating => true;

  @override
  Widget? get title => Text(
        'PLAYING',
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w300,
          color: ColorName.white,
        ),
      );

  @override
  Widget? get leading => IconButton(
        onPressed: onLeadingTap,
        icon: SvgPicture.asset(
          Assets.icons.svg.chervonDown.path,
          color: ColorName.white,
        ),
      );

  @override
  List<Widget>? get actions => [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            Assets.icons.svg.more.path,
            color: ColorName.white,
          ),
        ),
      ];
}
