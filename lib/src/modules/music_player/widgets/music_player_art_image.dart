import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/src/core/components/spotify_network_image.dart';

class MusicPlayerArtImage extends StatelessWidget {
  const MusicPlayerArtImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.05.sh),
      child: SpotifyNetworkImage(
        'https://i.imgur.com/fEs1JNp.jpeg',
        height: 360.h,
        fit: BoxFit.cover,
      ),
    );
  }
}
