import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/src/core/components/spotify_button.dart';
import 'package:spotify_clone/src/core/routers/song_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpotifyButton(
        width: 0.5.sw,
        title: 'Play song',
        onTap: () => navigateMusicPlayer(context),
      ),
    );
  }
}
