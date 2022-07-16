import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/gen/assets.gen.dart';
import 'package:spotify_clone/gen/colors.gen.dart';
import 'package:spotify_clone/src/core/components/spotify_button.dart';
import 'package:spotify_clone/src/core/containers/scroll_view_container.dart';
import 'package:spotify_clone/src/core/routers/main_routes.dart';
import 'package:spotify_clone/src/core/screens/base_screen.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/providers/sign_up_provider.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/values/sign_up_step.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/widgets/sign_up_app_bar.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/widgets/sign_up_term_condition.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/widgets/sign_up_textfield_form.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  Widget get _checkSuffix => SvgPicture.asset(
        Assets.icons.svg.check.path,
        fit: BoxFit.scaleDown,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch<SignUpProvider>(signUpProvider);
    final step = provider.step;
    final formData = provider.model;

    final focusMapRef = useRef<Map<SignUpStep, FocusNode>>({
      SignUpStep.password: FocusNode(),
      SignUpStep.gender: FocusNode(),
      SignUpStep.name: FocusNode(),
    });

    final canNext = provider.canNextStep(step);

    return BaseScreen(
      provider: provider,
      allowNativePop: false,
      onBack: () => _onBack(context, provider),
      child: Stack(
        children: [
          Scaffold(
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
                      keyboardType: TextInputType.emailAddress,
                      onSubmit: (value) =>
                          _onSubmit(provider.step, provider, focusMapRef.value),
                      autoFocus: true,
                      suffixIcon: canNext ? _checkSuffix : null,
                    ),
                    SignUpTextFieldForm(
                      title: 'Create a password',
                      helperText: 'Use atleast 8 characters.',
                      onChanged: provider.onChangePassword,
                      onSubmit: (value) =>
                          _onSubmit(provider.step, provider, focusMapRef.value),
                      focusNode: focusMapRef.value[SignUpStep.password],
                      suffixIcon: canNext ? _checkSuffix : null,
                      initialValue: formData.password,
                    ),
                    SignUpTextFieldForm(
                      title: 'What’s your gender?',
                      onChanged: provider.onChangeGender,
                      onSubmit: (value) =>
                          _onSubmit(provider.step, provider, focusMapRef.value),
                      focusNode: focusMapRef.value[SignUpStep.gender],
                      suffixIcon: canNext ? _checkSuffix : null,
                      initialValue: formData.gender,
                    ),
                    SignUpTextFieldForm(
                      title: 'What’s your name?',
                      helperText: 'This appears on your spotify profile',
                      onChanged: provider.onChangeName,
                      onSubmit: (value) =>
                          _onSubmit(provider.step, provider, focusMapRef.value),
                      focusNode: focusMapRef.value[SignUpStep.name],
                      suffixIcon: canNext ? _checkSuffix : null,
                      initialValue: formData.name,
                    ),
                  ],
                ),
                if (!provider.isLastStep)
                  Padding(
                    padding: EdgeInsets.only(top: 43.h),
                    child: SpotifyButton(
                      title: 'Next',
                      width: 82.w,
                      height: 42.h,
                      color: ColorName.originalWhite,
                      enabled: canNext,
                      onTap: () => _onSubmit(step, provider, focusMapRef.value),
                    ),
                  ),
                if (provider.isLastStep) const SignUpTermCondition(),
              ],
            ),
          ),
          if (provider.isLastStep)
            Positioned(
              bottom: 50.h,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 100.w),
                child: SpotifyButton(
                  title: 'Create an account',
                  color: ColorName.white,
                  splashColor: ColorName.primary,
                  onTap: () => navigateMain(context),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _onBack(BuildContext context, SignUpProvider provider) {
    if (provider.prevStep() == null) {
      context.pop();
    }
  }

  void _onSubmit(
    SignUpStep step,
    SignUpProvider provider,
    Map<SignUpStep, FocusNode> map,
  ) {
    if (provider.canNextStep(step)) {
      final nextStep = provider.nextStep();
      map[nextStep]?.requestFocus();
    }
  }
}
