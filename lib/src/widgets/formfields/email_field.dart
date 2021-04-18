import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/providers/form_helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmailField extends HookWidget {
  const EmailField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final _validationItem = useProvider(emailValidator);
    return TextField(
        controller: controller,
        onChanged: (value) =>
            context.read(emailValidator.notifier).checkEmailValid(value),
        decoration: InputDecoration(
            hintText: 'exemple@email.com',
            errorText: _validationItem.error,
            prefixIcon: const Icon(Icons.email_rounded)),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next);
  }
}
