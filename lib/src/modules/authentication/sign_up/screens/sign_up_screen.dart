import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_button.dart';
import 'package:spotify_clone/src/core/containers/scroll_view_container.dart';
import 'package:spotify_clone/src/core/screens/base_screen.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/view_models/sign_up_viewmodel.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/widgets/sign_up_app_bar.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/widgets/sign_up_textfield_form.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch<SignUpViewModel>(signUpProvider);
    final step = provider.step;

    return BaseScreen(
      provider: provider,
      child: Scaffold(
        appBar: SignUpAppBar(
          onBack: () => _onBack(context, provider),
        ),
        body: ScrollViewContainer(
          padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 25.h),
          children: [
            IndexedStack(
              index: provider.stepIndex,
              children: [
                SignUpTextFieldForm(
                  title: 'What’s your email?',
                  helperText: 'You’ll need to confirm this email later.',
                  onChanged: provider.onChangeEmail,
                ),
                SignUpTextFieldForm(
                  title: 'Create a password',
                  helperText: 'Use atleast 8 characters.',
                  onChanged: provider.onChangePassword,
                ),
                SignUpTextFieldForm(
                  title: 'What’s your gender?',
                  onChanged: provider.onChangeGender,
                ),
                SignUpTextFieldForm(
                  title: 'What’s your name?',
                  helperText: 'This appears on your spotify profile',
                  onChanged: provider.onChangeName,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 43.h),
              child: SpotifyButton(
                title: 'Next',
                width: 82.w,
                height: 42.h,
                color: ColorName.originalWhite,
                enabled: provider.canNextStep(step),
                onTap: () => provider.nextStep(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBack(BuildContext context, SignUpViewModel provider) {
    if (!provider.prevStep()) {
      context.pop();
    }
  }
}
