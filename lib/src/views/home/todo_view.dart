import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/providers/auth_providers.dart';
import 'package:flutter_hooks_app/providers/firestore_providers.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoView extends HookWidget {
  const TodoView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final _user = useProvider(authUserInfoProvider).state;
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const CircleAvatar(backgroundColor: Colors.indigo),
              Text(_user!.email!,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w600))
            ]),
            const SizedBox(height: 16.0),
            _todos.when(
              data: (value) => value.isEmpty
                  ? const Text('No data found...')
                  : ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Dismissible(
                        key: UniqueKey(),
                        background: Container(color: Colors.redAccent),
                        onDismissed: (direction) => context
                            .read(firestoreServiceProvider)
                            .remove(todoId: value[index].id),
                        child: Card(
                          child: CheckboxListTile(
                              key: UniqueKey(),
                              value: value[index].completed,
                              title: Text(value[index].content),
                              onChanged: (newValue) => context
                                  .read(firestoreServiceProvider)
                                  .toggleCompleted(
                                      todoId: value[index].id,
                                      newValue: newValue!)),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16.0),
                      itemCount: value.length,
                    ),
              loading: () =>
                  const Center(child: const CircularProgressIndicator()),
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
          onPressed: () => print('** add new todo **'),
          icon: const Icon(Icons.add_rounded),
          label: const Text('New Todo'),
        ),
      ),
    );
  }
}
