import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/providers/form_helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ContentField extends HookWidget {
  const ContentField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    final _error = useProvider(contentValidator);
    return TextField(
        controller: controller,
        onChanged: (value) =>
            context.read(contentValidator.notifier).checkTodoContent(value),
        minLines: 4,
        maxLines: 4,
        maxLength: 120,
        decoration: InputDecoration(
            hintText: 'Donec sollicitudin molestie malesuada.',
            errorText: _error),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done);
  }
}
