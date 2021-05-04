import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/auth_providers.dart';
import 'package:flutter_hooks_app/core/providers/global_providers.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter_hooks_app/src/widgets/formfields/email_field.dart';
import 'package:flutter_hooks_app/src/widgets/formfields/password_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthView extends HookWidget {
  const AuthView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _email = useTextEditingController();
    final _password = useTextEditingController();
    final _isValid = useProvider(authValidationProvider).state;
    final _isLoading = useProvider(appLoadingStateProvider).state;

    return BaseWidget(
      appBar: AppBar(title: const Text('Flutter Hooks App')),
      child: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ListView(
                padding: const EdgeInsets.all(32.0),
                shrinkWrap: true,
                children: [
                  // Title
                  const Text('Login or Register',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 26.0, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 32.0),
                  // Email field
                  EmailField(controller: _email),
                  const SizedBox(height: 24.0),
                  // Password field
                  PasswordField(controller: _password),
                  const SizedBox(height: 24.0),
                  // Login or Register
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                          onPressed: _isValid
                              ? () => context.read(authServiceProvider).login(
                                  email: _email.text, password: _password.text)
                              : null,
                          icon: const Icon(Icons.login_rounded),
                          label: const Text('Login')),
                      ElevatedButton.icon(
                          onPressed: _isValid
                              ? () => context
                                  .read(authServiceProvider)
                                  .register(
                                      email: _email.text,
                                      password: _password.text)
                              : null,
                          icon: const Icon(Icons.person_add_alt_1_rounded),
                          label: const Text('Register'))
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
