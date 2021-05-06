import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks_app/core/models/todo.dart';
import 'package:flutter_hooks_app/core/providers/form_helpers.dart';
import 'package:flutter_hooks_app/core/services/firestore_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Filters { all, active, completed }

final todosFilterProvider = StateProvider<Filters>((ref) => Filters.all);

final firestoreProvider = Provider.autoDispose<FirebaseFirestore>(
    (ref) => FirebaseFirestore.instance);

final firestoreServiceProvider =
    ChangeNotifierProvider.autoDispose<FirestoreServices>(
        (ref) => FirestoreServices(
              db: ref.watch(firestoreProvider),
              read: ref.read,
              filter: ref.watch(todosFilterProvider).state,
            ));

final todosProvider = StreamProvider.autoDispose<List<Todo>>(
    (ref) => ref.watch(firestoreServiceProvider).todos);

final filteredTodos = StreamProvider.autoDispose<List<Todo>>((ref) {
  final db = ref.watch(firestoreServiceProvider);
  final currentFilter = ref.watch(todosFilterProvider).state;
  switch (currentFilter) {
    case Filters.completed:
      return db.completedTodos;
    case Filters.active:
      return db.activeTodos;
    case Filters.all:
    default:
      return db.allTodos;
  }
});

final todoValidationProvider = StateProvider.autoDispose<bool>((ref) {
  final _contentValidator = ref.watch(contentValidator);
  return _contentValidator.value != null ? true : false;
});
