import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  String? _error;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  String? get error => _error;

  Future<void> loginAnon() async {
    try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _error = e.message;
      notifyListeners();
    }
  }

  Future<void> login({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
    } on FirebaseAuthException catch (e) {
      print(e.message);
      _error = e.message;
      notifyListeners();
    }
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
