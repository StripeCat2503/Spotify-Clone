import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/providers/base_provider.dart';
import 'package:spotify_clone/src/core/utils/validation.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/models/sign_up_model.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/values/sign_up_step.dart';

class SignUpProvider extends BaseProvider {
  SignUpStep step = SignUpStep.email;
  bool loading = false;
  bool privacySendNewsChecked = false;
  bool privacyShareDataChecked = false;

  SignUpModel model = SignUpModel('', '', '', '');

  final int _totalStep = SignUpStep.values.length;

  int get stepIndex => SignUpStep.values.indexOf(step);

  bool get isLastStep => stepIndex == SignUpStep.values.length - 1;

  void changeStep(SignUpStep step) {
    this.step = step;
    notifyListeners();
  }

  SignUpStep? nextStep() {
    final currentStepIndex = SignUpStep.values.indexOf(step);
    if (currentStepIndex < _totalStep - 1) {
      step = SignUpStep.values[currentStepIndex + 1];
      notifyListeners();

      return step;
    }

    return null;
  }

  SignUpStep? prevStep() {
    final currentStepIndex = SignUpStep.values.indexOf(step);
    if (currentStepIndex > 0) {
      step = SignUpStep.values[currentStepIndex - 1];
      switch (step) {
        case SignUpStep.gender:
          model.name = '';
          privacySendNewsChecked = false;
          privacyShareDataChecked = false;
          break;
        case SignUpStep.password:
          model.gender = '';
          break;
        case SignUpStep.email:
          model.password = '';
          break;
        default:
      }

      notifyListeners();

      return step;
    }

    return null;
  }

  bool canNextStep(SignUpStep step) {
    switch (step) {
      case SignUpStep.email:
        return isEmail(model.email);
      case SignUpStep.password:
        return model.password.isNotEmpty;
      case SignUpStep.gender:
        return model.gender.isNotEmpty;
      case SignUpStep.name:
        return model.name.isNotEmpty;
    }
  }

  void onChangeEmail(String value) {
    model.email = value;
    notifyListeners();
  }

  void onChangeName(String value) {
    model.name = value;
    notifyListeners();
  }

  void onChangeGender(String value) {
    model.gender = value;
    notifyListeners();
  }

  void onChangePassword(String value) {
    model.password = value;
    notifyListeners();
  }

  void onCheckPrivacySendNews() {
    privacySendNewsChecked = !privacySendNewsChecked;
    notifyListeners();
  }

  void onCheckPrivacyShareData() {
    privacyShareDataChecked = !privacyShareDataChecked;
    notifyListeners();
  }

  @override
  void refresh() {
    step = SignUpStep.email;
    loading = false;
    model = SignUpModel('', '', '', '');
    privacySendNewsChecked = false;
    privacyShareDataChecked = false;
  }
}

final signUpProvider = ChangeNotifierProvider<SignUpProvider>((ref) {
  return SignUpProvider();
});
