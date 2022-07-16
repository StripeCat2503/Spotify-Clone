import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';

class SpotifyTextField extends StatelessWidget {
  const SpotifyTextField({
    Key? key,
    this.backgroundColor = ColorName.greyLight,
    this.textStyle,
    this.hintTextStyle,
    this.hintText,
    this.helperText,
    this.helperTextStyle,
    this.onChanged,
  }) : super(key: key);

  final Color backgroundColor;
  final TextStyle? textStyle;
  final TextStyle? hintTextStyle;
  final TextStyle? helperTextStyle;
  final String? hintText;
  final String? helperText;
  final ValueChanged<String>? onChanged;

  TextStyle get _textStyle => TextStyle(
        color: ColorName.white,
        fontSize: 14.sp,
      );

  TextStyle get _helperTextStyle => TextStyle(
        color: ColorName.white,
        fontWeight: FontWeight.w600,
        fontSize: 10.sp,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: onChanged,
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
            hintText: hintText,
            hintStyle: hintTextStyle,
          ),
        ),
        if (helperText != null)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              helperText!,
              style: _helperTextStyle.merge(helperTextStyle),
            ),
          ),
      ],
    );
  }
}
