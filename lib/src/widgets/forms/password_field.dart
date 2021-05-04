import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/form_helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PasswordField extends HookWidget {
  const PasswordField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final _isObscured = useProvider(pwVisibilityHelper);
    final _validationItem = useProvider(pwValidator);
    return TextField(
        controller: controller,
        onChanged: (value) =>
            context.read(pwValidator.notifier).checkPwValid(value),
        obscureText: _isObscured,
        maxLength: 16,
        decoration: InputDecoration(
            hintText: 'password (8 characters)',
            errorText: _validationItem.error,
            suffixIcon: GestureDetector(
                onTap: context.read(pwVisibilityHelper.notifier).toggle,
                child: _isObscured
                    ? const Icon(Icons.visibility_off_rounded)
                    : const Icon(Icons.visibility_rounded)),
            prefixIcon: const Icon(Icons.lock_rounded)));
  }
}
