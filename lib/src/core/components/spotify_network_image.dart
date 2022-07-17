import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class SpotifyNetworkImage extends StatelessWidget {
  const SpotifyNetworkImage(
    this.src, {
    Key? key,
    this.width,
    this.height,
    this.fit,
  }) : super(key: key);

  final String src;
  final double? width;
  final double? height;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: _errorBuilder,
    );
  }

  Widget _errorBuilder(
      BuildContext context, Object error, StackTrace? stackTrace) {
    return Container(
      width: double.infinity,
      height: 300.h,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorName.white,
          width: 3,
        ),
      ),
      child: Center(
        child: Text(
          'FAIL TO LOAD IMAGE',
          style: TextStyle(
            color: ColorName.white,
            fontWeight: FontWeight.w300,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
