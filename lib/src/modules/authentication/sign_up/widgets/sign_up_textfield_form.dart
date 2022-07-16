import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_textfield.dart';

class SignUpTextFieldForm extends HookWidget {
  const SignUpTextFieldForm({
    Key? key,
    required this.title,
    this.helperText,
    this.onChanged,
    this.keyboardType,
    this.onSubmit,
    this.focusNode,
    this.autoFocus = false,
    this.suffixIcon,
    this.initialValue,
  }) : super(key: key);

  final String title;
  final String? helperText;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onSubmit;
  final FocusNode? focusNode;
  final bool autoFocus;
  final Widget? suffixIcon;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    useEffect(
      () {
        if (initialValue == null || initialValue!.isEmpty) {
          controller.text = '';
        }

        return () => {};
      },
      [initialValue],
    );

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
          keyboardType: keyboardType,
          onFieldSubmitted: onSubmit,
          focusNode: focusNode,
          autoFocus: autoFocus,
          suffixIcon: suffixIcon,
          controller: controller,
        ),
      ],
    );
  }
}
