import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///////ALERTS////////
const _loginSuccess = 'Successfully logged in';
const _logoutSuccess = 'Successfully logged out';

class AuthServices extends ChangeNotifier {
  final FirebaseAuth firebaseAuth;
  final Reader read;
  AuthServices({required this.firebaseAuth, required this.read});

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  User? get user => firebaseAuth.currentUser;

  Future<void> loginAnon() async {
    read(appLoadingStateProvider).state = true;
    try {
      await firebaseAuth.signInAnonymously();
      _setSuccess(_loginSuccess);
    } on FirebaseAuthException catch (e) {
      _setError(e.message!);
    }
    read(appLoadingStateProvider).state = false;
  }

  Future<void> login({required String email, required String password}) async {
    read(appLoadingStateProvider).state = true;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      _setSuccess(_loginSuccess);
    } on FirebaseAuthException catch (e) {
      _setError(e.message!);
    }
    read(appLoadingStateProvider).state = false;
  }

  Future<void> register(
      {required String email, required String password}) async {
    read(appLoadingStateProvider).state = true;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      _setSuccess(_loginSuccess);
    } on FirebaseAuthException catch (e) {
      _setError(e.message!);
    }
    read(appLoadingStateProvider).state = false;
  }

  Future<void> logout() async {
    read(appLoadingStateProvider).state = true;
    await firebaseAuth.signOut();
    _setSuccess(_logoutSuccess);
    read(appLoadingStateProvider).state = false;
  }

  void _setError(String _message) =>
      read(appErrorStateNotifier.notifier).errorMessage(_message);
  void _setSuccess(String _message) =>
      read(appErrorStateNotifier.notifier).successMessage(_message);
}
