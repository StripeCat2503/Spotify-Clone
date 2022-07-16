import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class SpotifyTextField extends StatelessWidget {
  const SpotifyTextField({
    Key? key,
    this.backgroundColor = ColorName.greyLight,
    this.textStyle,
  }) : super(key: key);

  final Color backgroundColor;
  final TextStyle? textStyle;

  TextStyle get _textStyle => TextStyle(
        color: ColorName.white,
        fontSize: 14.sp,
      );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: _textStyle.merge(textStyle),
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        fillColor: backgroundColor,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
