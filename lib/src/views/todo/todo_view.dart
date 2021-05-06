import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/auth_providers.dart';
import 'package:flutter_hooks_app/core/providers/todos_providers.dart';
import 'package:flutter_hooks_app/src/constants/app_routes.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter_hooks_app/src/widgets/layouts/dismissible_card.dart';
import 'package:flutter_hooks_app/src/widgets/scaffold/drawer_content_widget.dart';
import 'package:flutter_hooks_app/src/widgets/scaffold/drawer_header_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    print('**TodoView**');
    return BaseWidget(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: context.read(authServiceProvider).logout)
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeaderWidget(),
            DrawerContentWidget(),
          ],
        ),
      ),
      child: ListOfTodos(),
      fab: Directionality(
        textDirection: TextDirection.rtl,
        child: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.editTodo),
          icon: const Icon(Icons.playlist_add_rounded),
          label: const Text('New Todo'),
        ),
      ),
    );
  }
}

class ListOfTodos extends HookWidget {
  const ListOfTodos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('**ListOfTodos**');
    final _todos = useProvider(todosProvider);
    return Column(children: [
      Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 4, 0),
        child: const TodoViewHeader(),
      ),
      _todos.when(
          data: (value) => value.isEmpty
              ? EmptyList(isLoading: false)
              : Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16.0),
                    //shrinkWrap: true,
                    itemBuilder: (context, index) => DismissibleCard(
                      callBack: (_) => context
                          .read(firestoreServiceProvider)
                          .remove(todoId: value[index].uid),
                      content: GestureDetector(
                        onLongPress: () => Navigator.of(context).pushNamed(
                          AppRoutes.editTodo,
                          arguments: value[index],
                        ),
                        child: CheckboxListTile(
                          key: ValueKey(index),
                          value: value[index].completed,
                          title: Text(value[index].content),
                          onChanged: (newValue) => context
                              .read(firestoreServiceProvider)
                              .toggleCompleted(
                                  todoId: value[index].uid,
                                  newValue: newValue!),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16.0),
                    itemCount: value.length,
                  ),
                ),
          loading: () => EmptyList(isLoading: true),
          error: (error, stackTrace) => const Center(
                child: const Text('Error with the web service'),
              ))
    ]);
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    print('**EmptyList**');
    return Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(children: [
          const Icon(Icons.search_off_rounded, size: 32.0),
          const SizedBox(height: 16.0),
          Text(
            isLoading ? 'Loading...' : 'No todos found...',
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          )
        ]));
  }
}

class TodoViewHeader extends HookWidget {
  const TodoViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('**TodoViewHeader**');
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      const Text('Todos',
          style: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold)),
      FiltersRow()
    ]);
  }
}

class FiltersRow extends HookWidget {
  const FiltersRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('**FiltersRow**');
    final _filter = useProvider(todosFilterProvider).state;
    return Row(children: [
      const Text('all'),
      Radio<Filters>(
          value: Filters.all,
          groupValue: _filter,
          onChanged: (value) =>
              context.read(todosFilterProvider).state = value!),
      const Text('active'),
      Radio<Filters>(
          value: Filters.active,
          groupValue: _filter,
          onChanged: (value) =>
              context.read(todosFilterProvider).state = value!),
      const Text('completed'),
      Radio<Filters>(
          value: Filters.completed,
          groupValue: _filter,
          onChanged: (value) =>
              context.read(todosFilterProvider).state = value!)
    ]);
  }
}
