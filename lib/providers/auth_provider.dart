import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks_app/providers/form_helpers.dart';
import 'package:flutter_hooks_app/services/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = ChangeNotifierProvider<AuthService>(
    (ref) => AuthService(ref.watch(authProvider), ref.read));

final authErrorProvider =
    StateProvider<String?>((ref) => ref.watch(authServiceProvider).error);

final authStateProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges);

final authValidationProvider = StateProvider.autoDispose<bool>((ref) {
  final _emailError = ref.watch(emailValidator);
  final _passwordError = ref.watch(pwValidator);
  return _emailError != null || _passwordError != null ? false : true;
});