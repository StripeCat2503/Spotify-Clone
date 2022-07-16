import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class SongPlayingAppBar extends SliverAppBar {
  @override
  bool get floating => true;

  @override
  PreferredSizeWidget? get bottom => const _BottomAppBar();

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
        onPressed: () {},
        icon: Transform.rotate(
          angle: pi / 2,
          child: Icon(
            Icons.chevron_right_sharp,
            size: 36.w,
          ),
        ),
      );

  @override
  List<Widget>? get actions => [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ),
        ),
      ];
}

class _BottomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BottomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(30.h);
}
