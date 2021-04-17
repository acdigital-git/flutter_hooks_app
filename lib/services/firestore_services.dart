import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirestoreServices extends ChangeNotifier {
  final FirebaseFirestore _db;
  final Reader _read;
  FirestoreServices(this._db, this._read);

  String? _error;

  String? get error => _error;

  Future<void> loginAnon() async {
    _read(appLoadingStateProvider).state = true;
    /* try {
      await _firebaseAuth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      _error = e.message;
      notifyListeners();
    } */
    _read(appLoadingStateProvider).state = false;
  }
}
