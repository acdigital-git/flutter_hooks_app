import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/providers/auth_providers.dart';
import 'package:flutter_hooks_app/src/views/auth/auth_view.dart';
import 'package:flutter_hooks_app/src/views/todo/todo_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthWrapper extends HookWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _authState = useProvider(authStateProvider);
    return _authState.when(
      data: (user) {
        return user == null ? AuthView() : TodoView(title: 'Flutter Hooks App');
      },
      loading: () => Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        body: Center(child: Text('Auth service error')),
      ),
    );
  }
}
