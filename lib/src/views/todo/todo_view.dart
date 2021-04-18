import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/providers/auth_providers.dart';
import 'package:flutter_hooks_app/providers/firestore_providers.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter_hooks_app/src/widgets/dismissible_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoView extends HookWidget {
  const TodoView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final _todos = useProvider(todosProvider);
    return BaseWidget(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: context.read(authServiceProvider).logout)
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TodoViewHeader(),
            const SizedBox(height: 16.0),
            _todos.when(
              data: (value) => value.isEmpty
                  ? const Text('No data found...')
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => DismissibleCard(
                        callBack: (direction) => context
                            .read(firestoreServiceProvider)
                            .remove(todoId: value[index].uid),
                        content: GestureDetector(
                          onLongPress: () => Navigator.of(context)
                              .pushNamed('/edit_todo', arguments: value[index]),
                          child: CheckboxListTile(
                              key: UniqueKey(),
                              value: value[index].completed,
                              title: Text(value[index].content),
                              onChanged: (newValue) => context
                                  .read(firestoreServiceProvider)
                                  .toggleCompleted(
                                      todoId: value[index].uid,
                                      newValue: newValue!)),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0),
                      itemCount: value.length,
                    ),
              loading: () => Container(
                  constraints: BoxConstraints(minHeight: 300),
                  child:
                      const Center(child: const CircularProgressIndicator())),
              error: (error, stackTrace) => const Center(
                child: const Text('Error with the web service'),
              ),
            )
          ],
        ),
      ),
      fab: Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pushNamed('/edit_todo'),
          icon: const Icon(Icons.playlist_add_rounded),
          label: const Text('New Todo'),
        ),
      ),
    );
  }
}

class TodoViewHeader extends HookWidget {
  const TodoViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = useProvider(authUserInfoProvider).state;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Icon(Icons.toc_rounded, size: 34.0),
      Text(_user!.email!,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600))
    ]);
  }
}
