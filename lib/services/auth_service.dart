import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth;
  AuthService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> login(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Successfully logged in';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<String> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Successfully registered';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
