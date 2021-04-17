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
  Stream<List<Todo>> get todos =>
      _db.collection('todos').snapshots().map((snapshot) =>
          snapshot.docs.map((doc) => Todo.fromJson(doc.data())).toList());

  // upsert (either insert or update the entry)
  Future<void> upsert({required Todo todo}) async {
    var options = SetOptions(merge: true);
    _read(appLoadingStateProvider).state = true;
    await _db
        .collection('todos')
        .doc(todo.id)
        .set(todo.toMap(), options)
        .catchError((error) => _error = error.toString());
    _read(appLoadingStateProvider).state = false;
  }
}
