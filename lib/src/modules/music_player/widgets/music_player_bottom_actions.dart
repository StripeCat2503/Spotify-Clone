import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_icon_button.dart';

class MusicPlayerBottomActions extends StatelessWidget {
  const MusicPlayerBottomActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SpotifyIconButton(
          icon: SvgPicture.asset(
            Assets.icons.svg.devices.path,
            color: ColorName.white,
          ),
        ),
        const Spacer(),
        SpotifyIconButton(
          icon: SvgPicture.asset(
            Assets.icons.svg.playlist.path,
            color: ColorName.white,
          ),
        ),
      ],
    );
  }
}
