import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_textfield.dart';

class SignUpTextFieldForm extends StatelessWidget {
  const SignUpTextFieldForm({
    Key? key,
    required this.title,
    this.helperText,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final String? helperText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorName.originalWhite,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        SpotifyTextField(
          helperText: helperText,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
