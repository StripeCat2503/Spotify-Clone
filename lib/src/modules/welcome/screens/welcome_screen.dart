import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackground(),
          Positioned(
            top: 0.5.sh,
            left: 0,
            right: 0,
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _prefixIcon(String path) {
    return SvgPicture.asset(path);
  }

  Widget _buildBackground() {
    return SizedBox.expand(
      child: Opacity(
        opacity: 0.3,
        child: Image.asset(
          Assets.images.png.startBackground.path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Column(
        children: [
          SvgPicture.asset(Assets.icons.svg.logo.path),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Millions of Songs.\nFree on Spotify.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorName.white,
              fontWeight: FontWeight.w700,
              fontSize: 28.sp,
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          SpotifyButton(
            onTap: () {},
            title: 'Sign up free',
          ),
          SizedBox(
            height: 12.h,
          ),
          SpotifyButton(
            onTap: () {},
            title: 'Continue with Google',
            variant: SpotifyButtonVariant.outlined,
            color: ColorName.white,
            prefixIcon: _prefixIcon(Assets.icons.svg.google.path),
          ),
          SizedBox(
            height: 12.h,
          ),
          SpotifyButton(
            onTap: () {},
            title: 'Continue with Facebook',
            variant: SpotifyButtonVariant.outlined,
            color: ColorName.white,
            prefixIcon: _prefixIcon(Assets.icons.svg.facebook.path),
          ),
          SizedBox(
            height: 12.h,
          ),
          SpotifyButton(
            onTap: () {},
            title: 'Continue with Apple',
            variant: SpotifyButtonVariant.outlined,
            color: ColorName.white,
            prefixIcon: _prefixIcon(Assets.icons.svg.apple.path),
          ),
        ],
      ),
    );
  }
}
