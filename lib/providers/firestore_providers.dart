import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks_app/models/todo.dart';
import 'package:flutter_hooks_app/providers/form_helpers.dart';
import 'package:flutter_hooks_app/services/firestore_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firestoreServiceProvider = ChangeNotifierProvider<FirestoreServices>(
    (ref) => FirestoreServices(ref.watch(firestoreProvider), ref.read));

final firestoreErrorProvider =
    StateProvider<String?>((ref) => ref.watch(firestoreServiceProvider).error);

final todosProvider = StreamProvider<List<Todo>>(
    (ref) => ref.watch(firestoreServiceProvider).todos);

final todoValidationProvider = StateProvider.autoDispose<bool>((ref) {
  final _contentError = ref.watch(contentValidator);
  return _contentError != null ? false : true;
});
