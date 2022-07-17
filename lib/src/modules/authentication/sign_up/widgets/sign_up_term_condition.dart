import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_checkbox.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/providers/sign_up_provider.dart';

class SignUpTermCondition extends HookConsumerWidget {
  const SignUpTermCondition({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = TextStyle(
      fontSize: 10.sp,
      color: ColorName.originalWhite,
      fontWeight: FontWeight.w600,
    );

    final state = ref.watch(signUpProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: const Divider(
            color: ColorName.greyLight,
          ),
        ),
        Text(
          'By tapping on “Create account”, you agree to the spotify Terms of Use.',
          style: textStyle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: Text(
            'Terms of Use',
            style: textStyle.copyWith(
              color: ColorName.primary,
            ),
          ),
        ),
        Text(
          'To learn more about how Spotify collect, uses, shares and protects your personal data, Please see the Spotify Privacy Policy.',
          style: textStyle,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h),
          child: Text(
            'Privacy Policy',
            style: textStyle.copyWith(
              color: ColorName.primary,
            ),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 0.7.sw,
              child: Text(
                'Please send me news and offers from Spotify.',
                style: textStyle,
              ),
            ),
            const Spacer(),
            SpotifyCheckbox(
              checked: state.privacySendNewsChecked,
              onChanged: (_) =>
                  ref.watch(signUpProvider.notifier).onCheckPrivacySendNews(),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          children: [
            SizedBox(
              width: 0.7.sw,
              child: Text(
                'Share my registration data with Spotify’s content providers for marketing purposes.',
                style: textStyle,
              ),
            ),
            const Spacer(),
            SpotifyCheckbox(
              checked: state.privacyShareDataChecked,
              onChanged: (_) =>
                  ref.watch(signUpProvider.notifier).onCheckPrivacyShareData(),
            ),
          ],
        ),
      ],
    );
  }
}
