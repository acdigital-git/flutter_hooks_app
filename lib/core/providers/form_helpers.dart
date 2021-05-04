import 'package:email_validator/email_validator.dart';
import 'package:flutter_hooks_app/models/form_validation_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//// VALIDATORS ////
final pwValidator = StateNotifierProvider.autoDispose<FormValidationNotifier,
    FormValidationItem>((ref) => FormValidationNotifier());

final emailValidator = StateNotifierProvider.autoDispose<FormValidationNotifier,
    FormValidationItem>((ref) => FormValidationNotifier());

final contentValidator = StateNotifierProvider.autoDispose<
    FormValidationNotifier,
    FormValidationItem>((ref) => FormValidationNotifier());

///// PwField //////
final pwVisibilityHelper = StateNotifierProvider<PasswordToggleNotifier, bool>(
    (ref) => PasswordToggleNotifier());

class PasswordToggleNotifier extends StateNotifier<bool> {
  // initalized to true so text is obscured
  PasswordToggleNotifier({bool? initValue}) : super(initValue ?? true);
  void toggle() => state = !state;
}

////// ERRORS //////
const _emptyField = 'Please enter some text';
const _invalidEmail = 'Invalid email format';
const _pwTooShort = 'Password is too short';
const _todoTooShort = 'todo is too short';

class FormValidationNotifier extends StateNotifier<FormValidationItem> {
  FormValidationNotifier({FormValidationItem? item})
      : super(item ?? FormValidationItem(error: null, value: null));

  void checkEmailValid(String? _email) {
    if (_email == null || _email.isEmpty) {
      state = FormValidationItem(error: _emptyField);
    } else if (!EmailValidator.validate(_email)) {
      state = FormValidationItem(error: _invalidEmail);
    } else {
      state = FormValidationItem(value: _email);
    }
  }

  void checkPwValid(String? _password) {
    if (_password == null || _password.isEmpty) {
      state = FormValidationItem(error: _emptyField);
    } else if (_password.length < 8) {
      state = FormValidationItem(error: _pwTooShort);
    } else {
      state = FormValidationItem(value: _password);
    }
  }

  void checkTodoContent(String? _todo) {
    if (_todo == null || _todo.isEmpty) {
      state = FormValidationItem(error: _emptyField);
    } else if (_todo.length < 15) {
      state = FormValidationItem(error: _todoTooShort);
    } else {
      state = FormValidationItem(value: _todo);
    }
  }
}
