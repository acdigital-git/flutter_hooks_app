import 'package:email_validator/email_validator.dart';
import 'package:flutter_hooks_app/models/validation_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//// VALIDATORS ////
final pwValidator =
    StateNotifierProvider.autoDispose<FormValidationNotifier, ValidationItem>(
        (ref) => FormValidationNotifier());

final emailValidator =
    StateNotifierProvider.autoDispose<FormValidationNotifier, ValidationItem>(
        (ref) => FormValidationNotifier());

final contentValidator =
    StateNotifierProvider.autoDispose<FormValidationNotifier, ValidationItem>(
        (ref) => FormValidationNotifier());

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

class FormValidationNotifier extends StateNotifier<ValidationItem> {
  FormValidationNotifier({ValidationItem? item})
      : super(item ?? ValidationItem(error: null, value: null));

  void checkEmailValid(String? _email) {
    if (_email == null || _email.isEmpty) {
      state = ValidationItem(error: _emptyField);
    } else if (!EmailValidator.validate(_email)) {
      state = ValidationItem(error: _invalidEmail);
    } else {
      state = ValidationItem(value: _email);
    }
  }

  void checkPwValid(String? _password) {
    if (_password == null || _password.isEmpty) {
      state = ValidationItem(error: _emptyField);
    } else if (_password.length < 8) {
      state = ValidationItem(error: _pwTooShort);
    } else {
      state = ValidationItem(value: _password);
    }
  }

  void checkTodoContent(String? _todo) {
    if (_todo == null || _todo.isEmpty) {
      state = ValidationItem(error: _emptyField);
    } else if (_todo.length < 15) {
      state = ValidationItem(error: _todoTooShort);
    } else {
      state = ValidationItem(value: _todo);
    }
  }
}
