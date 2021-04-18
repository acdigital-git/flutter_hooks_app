import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks_app/providers/form_helpers.dart';
import 'package:flutter_hooks_app/services/auth_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider = ChangeNotifierProvider<AuthServices>(
    (ref) => AuthServices(ref.watch(authProvider), ref.read));

final authErrorProvider =
    StateProvider<String?>((ref) => ref.watch(authServiceProvider).error);

final authStateProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges);

final authUserInfoProvider =
    StateProvider<User?>((ref) => ref.watch(authServiceProvider).user);

final authValidationProvider = StateProvider.autoDispose<bool>((ref) {
  final _emailValidator = ref.watch(emailValidator);
  final _passwordValidator = ref.watch(pwValidator);
  return _emailValidator.value != null && _passwordValidator.value != null
      ? true
      : false;
});
