import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks_app/core/models/todo.dart';
import 'package:flutter_hooks_app/core/providers/form_helpers.dart';
import 'package:flutter_hooks_app/core/services/firestore_services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum Filters { all, active, completed }

final todosFilterProvider = StateProvider<Filters>((ref) => Filters.all);

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final firestoreServiceProvider =
    ChangeNotifierProvider<FirestoreServices>((ref) => FirestoreServices(
          db: ref.watch(firestoreProvider),
          read: ref.read,
          filter: ref.watch(todosFilterProvider).state,
        ));

final todosProvider = StreamProvider<List<Todo>>(
    (ref) => ref.watch(firestoreServiceProvider).todos);

final todoValidationProvider = StateProvider.autoDispose<bool>((ref) {
  final _contentValidator = ref.watch(contentValidator);
  return _contentValidator.value != null ? true : false;
});
