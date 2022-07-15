import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

enum SpotifyButtonVariant {
  solid,
  outlined,
  text,
}

class SpotifyButton extends StatelessWidget {
  const SpotifyButton({
    Key? key,
    required this.title,
    this.variant = SpotifyButtonVariant.solid,
    this.color = ColorName.primary,
    this.prefixIcon,
    this.onTap,
    this.titleStyle,
    this.borderRadius,
    this.width,
    this.height,
    this.elevation,
  }) : super(key: key);

  final String title;
  final SpotifyButtonVariant variant;
  final Color color;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final TextStyle? titleStyle;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final double? elevation;

  TextStyle get _defaultStyle => TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16.sp,
        color: variant == SpotifyButtonVariant.solid ? ColorName.black : color,
      );

  double get _defaultWidth => double.infinity;
  double get _defaultHeight => 49.h;
  double get _defaultElevation => 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? _defaultWidth,
      height: height ?? _defaultHeight,
      child: Stack(
        children: [
          ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                variant == SpotifyButtonVariant.solid
                    ? color
                    : Colors.transparent,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(45.r),
                ),
              ),
              side: MaterialStateProperty.all<BorderSide>(
                BorderSide(
                  color: variant == SpotifyButtonVariant.solid
                      ? Colors.transparent
                      : color,
                ),
              ),
              elevation: MaterialStateProperty.all<double>(
                elevation ?? _defaultElevation,
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: _defaultStyle.merge(titleStyle),
              ),
            ),
          ),
          if (prefixIcon != null)
            Positioned(
              left: 16.w,
              top: 0,
              bottom: 0,
              child: prefixIcon!,
            ),
        ],
      ),
    );
  }
}
