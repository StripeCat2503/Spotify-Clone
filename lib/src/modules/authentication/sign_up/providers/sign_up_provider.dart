import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/utils/validation.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/values/sign_up_step.dart';

part 'sign_up_provider.freezed.dart';

class SignUpProvider extends StateNotifier<SignUpState> {
  final int _totalStep = SignUpStep.values.length;

  SignUpProvider(super.state);

  void changeStep(SignUpStep step) {
    state = state.copyWith(step: step);
  }

  SignUpStep? nextStep() {
    final currentStepIndex = SignUpStep.values.indexOf(state.step);
    if (currentStepIndex < _totalStep - 1) {
      state = state.copyWith(
        step: SignUpStep.values[currentStepIndex + 1],
      );

      return state.step;
    }

    return null;
  }

  SignUpStep? prevStep() {
    final currentStepIndex = SignUpStep.values.indexOf(state.step);
    if (currentStepIndex > 0) {
      state = state.copyWith(step: SignUpStep.values[currentStepIndex - 1]);
      switch (state.step) {
        case SignUpStep.gender:
          state = state.copyWith(
            name: '',
            privacySendNewsChecked: false,
            privacyShareDataChecked: false,
          );
          break;
        case SignUpStep.password:
          state = state.copyWith(
            gender: '',
          );
          break;
        case SignUpStep.email:
          state = state.copyWith(password: '');
          break;
        default:
      }

      return state.step;
    }

    return null;
  }

  void onChangeEmail(String value) {
    state = state.copyWith(email: value);
  }

  void onChangeName(String value) {
    state = state.copyWith(name: value);
  }

  void onChangeGender(String value) {
    state = state.copyWith(gender: value);
  }

  void onChangePassword(String value) {
    state = state.copyWith(password: value);
  }

  void onCheckPrivacySendNews() {
    state =
        state.copyWith(privacySendNewsChecked: !state.privacySendNewsChecked);
  }

  void onCheckPrivacyShareData() {
    state =
        state.copyWith(privacyShareDataChecked: !state.privacyShareDataChecked);
  }
}

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    @Default(SignUpStep.email) SignUpStep step,
    @Default(false) bool loading,
    @Default(false) bool privacySendNewsChecked,
    @Default(false) bool privacyShareDataChecked,
    @Default('') String email,
    @Default('') String name,
    @Default('') String password,
    @Default('') String gender,
  }) = _SignUpState;

  const SignUpState._();

  int get stepIndex => SignUpStep.values.indexOf(step);

  bool get isLastStep => stepIndex == SignUpStep.values.length - 1;

  bool get canNextStep {
    switch (step) {
      case SignUpStep.email:
        return isEmail(email);
      case SignUpStep.password:
        return password.isNotEmpty;
      case SignUpStep.gender:
        return gender.isNotEmpty;
      case SignUpStep.name:
        return name.isNotEmpty;
    }
  }
}

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpProvider, SignUpState>((ref) {
  const initialState = SignUpState();
  return SignUpProvider(initialState);
});
