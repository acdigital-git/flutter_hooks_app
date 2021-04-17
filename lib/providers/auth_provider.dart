import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hooks_app/services/auth_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authServiceProvider =
    Provider<AuthService>((ref) => AuthService(ref.watch(authProvider)));

final authStateProvider = StreamProvider<User?>(
    (ref) => ref.watch(authServiceProvider).authStateChanges);
