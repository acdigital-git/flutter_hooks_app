import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthServices extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  final Reader _read;
  AuthServices(this._firebaseAuth, this._read);

  String? _error;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  String? get error => _error;

  User? get user => _firebaseAuth.currentUser;

  Future<void> loginAnon() async {
    _read(appLoadingStateProvider).state = true;
    try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _error = e.message;
      notifyListeners();
    }
    _read(appLoadingStateProvider).state = false;
  }

  Future<void> login({required String email, required String password}) async {
    _read(appLoadingStateProvider).state = true;
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      _error = e.message;
      notifyListeners();
    }
    _read(appLoadingStateProvider).state = false;
  }

  Future<void> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      _error = e.message;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
