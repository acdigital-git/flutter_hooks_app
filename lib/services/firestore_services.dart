import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/models/todo.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirestoreServices extends ChangeNotifier {
  final FirebaseFirestore _db;
  final Reader _read;
  FirestoreServices(this._db, this._read);

  String? _error;

  String? get error => _error;
  set error(String? value) {
    _error = value;
    notifyListeners();
  }

  // fetch todos <Stream>
  Stream<List<Todo>> get todos =>
      _db.collection('todos').snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());

  // create todo
  Future<void> create(Todo todo) async {
    _read(appLoadingStateProvider).state = true;
    try {
      await _db.collection('todos').add(todo.toMap());
    } catch (e) {
      error = e.toString();
    }
    _read(appLoadingStateProvider).state = false;
  }

  // upsert (either insert or update the entry)
  Future<void> upsert({required Todo todo}) async {
    var options = SetOptions(merge: true);
    _read(appLoadingStateProvider).state = true;
    try {
      await _db.collection('todos').doc(todo.id).set(todo.toMap(), options);
    } catch (e) {
      error = e.toString();
    }
    _read(appLoadingStateProvider).state = false;
  }

  // toggle completed
  Future<void> toggleCompleted({
    required String todoId,
    required bool newValue,
  }) async {
    try {
      await _db.collection('todos').doc(todoId).update({'completed': newValue});
    } catch (e) {
      error = e.toString();
    }
  }
}
