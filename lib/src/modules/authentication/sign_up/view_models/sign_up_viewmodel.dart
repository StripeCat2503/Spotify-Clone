import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_clone/src/core/view_models/base_viewmodel.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/models/sign_up_model.dart';
import 'package:spotify_clone/src/modules/authentication/sign_up/values/sign_up_step.dart';

class SignUpViewModel extends BaseViewModel {
  SignUpStep step = SignUpStep.email;
  bool loading = false;

  SignUpModel model = SignUpModel('', '', '', '');

  final int _totalStep = SignUpStep.values.length;

  int get stepIndex => SignUpStep.values.indexOf(step);

  void changeStep(SignUpStep step) {
    this.step = step;
    notifyListeners();
  }

  bool nextStep() {
    final currentStepIndex = SignUpStep.values.indexOf(step);
    if (currentStepIndex < _totalStep - 1) {
      step = SignUpStep.values[currentStepIndex + 1];
      notifyListeners();

      return true;
    }

    return false;
  }

  bool prevStep() {
    final currentStepIndex = SignUpStep.values.indexOf(step);
    if (currentStepIndex > 0) {
      step = SignUpStep.values[currentStepIndex - 1];
      notifyListeners();

      return true;
    }

    return false;
  }

  bool canNextStep(SignUpStep step) {
    switch (step) {
      case SignUpStep.email:
        return model.email.isNotEmpty;
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

  @override
  void refresh() {
    step = SignUpStep.email;
  }
}

final signUpProvider = ChangeNotifierProvider<SignUpViewModel>((ref) {
  return SignUpViewModel();
});
