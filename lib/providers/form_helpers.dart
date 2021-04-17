import 'package:email_validator/email_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pwVisibilityHelper = StateNotifierProvider<PasswordToggleNotifier, bool>(
    (ref) => PasswordToggleNotifier());

final pwValidator =
    StateNotifierProvider.autoDispose<FormValidationNotifier, String?>(
        (ref) => FormValidationNotifier(error: 'Password is required'));

final emailValidator =
    StateNotifierProvider.autoDispose<FormValidationNotifier, String?>(
        (ref) => FormValidationNotifier(error: 'Email is required'));

final contentValidator =
    StateNotifierProvider.autoDispose<FormValidationNotifier, String?>(
        (ref) => FormValidationNotifier(error: 'Content is required'));

class PasswordToggleNotifier extends StateNotifier<bool> {
  // initalized to true so text is obscured
  PasswordToggleNotifier({bool? initValue}) : super(initValue ?? true);

  void toggle() => state = !state;
}

class FormValidationNotifier extends StateNotifier<String?> {
  FormValidationNotifier({String? error}) : super(error ?? null);

  void checkEmailValid(String? value) {
    if (value == null || value.isEmpty) {
      state = 'Please enter some text';
    } else if (!EmailValidator.validate(value)) {
      state = 'Invalid email format';
    } else {
      state = null;
    }
  }

  void checkPwValid(String? value) {
    if (value == null || value.isEmpty) {
      state = 'Please enter some text';
    } else if (value.length < 8) {
      state = 'Password is too short';
    } else {
      state = null;
    }
  }

  void checkTodoContent(String? value) {
    if (value == null || value.isEmpty) {
      state = 'Please enter some text';
    } else if (value.length < 8) {
      state = 'todo is too short';
    } else {
      state = null;
    }
  }
}
