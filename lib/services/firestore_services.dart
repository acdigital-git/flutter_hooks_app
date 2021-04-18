import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/models/todo.dart';
import 'package:flutter_hooks_app/providers/firestore_providers.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FirestoreServices extends ChangeNotifier {
  final FirebaseFirestore db;
  final Reader read;
  final Filters filter;
  FirestoreServices(
      {required this.db, required this.read, required this.filter});

  // fetch filtered todos <Stream>
  Stream<List<Todo>> get todos =>
      db.collection('todos').snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Todo.fromJson(doc.data())).where((todo) {
            switch (filter) {
              case Filters.active:
                return todo.completed == false;
              case Filters.completed:
                return todo.completed == true;
              case Filters.all:
              default:
                return true;
            }
          }).toList());

  // upsert (either insert or update the entry)
  Future<void> upsert({required Todo todo, required bool isUpdate}) async {
    var options = SetOptions(merge: true);
    read(appLoadingStateProvider).state = true;
    try {
      await db.collection('todos').doc(todo.uid).set(todo.toMap(), options);
      _setSuccess(isUpdate ? 'Successfully updated' : 'Successfully added');
    } catch (e) {
      _setError(e.toString());
    }
    read(appLoadingStateProvider).state = false;
  }

  // toggle completed
  Future<void> toggleCompleted({
    required String todoId,
    required bool newValue,
  }) async {
    try {
      await db.collection('todos').doc(todoId).update({'completed': newValue});
    } catch (e) {
      _setError(e.toString());
    }
  }

  // remove todo
  Future<void> remove({required String todoId}) async {
    try {
      db.collection('todos').doc(todoId).delete();
      _setSuccess('Successfully deleted');
    } catch (e) {
      _setError(e.toString());
    }
  }

  void _setError(String _message) =>
      read(appErrorStateNotifier.notifier).errorMessage(_message);
  void _setSuccess(String _message) =>
      read(appErrorStateNotifier.notifier).successMessage(_message);
}
