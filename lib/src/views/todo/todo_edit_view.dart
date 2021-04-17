import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/models/todo.dart';
import 'package:flutter_hooks_app/providers/firestore_providers.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter_hooks_app/src/widgets/formfields/content_field.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

const Uuid _uuid = Uuid();

class TodoFormView extends HookWidget {
  const TodoFormView({Key? key, this.item}) : super(key: key);
  final Todo? item;
  @override
  Widget build(BuildContext context) {
    final _content = useTextEditingController(text: item?.content ?? '');
    final _isValid = useProvider(todoValidationProvider).state;
    final _completed = useState<bool>(item?.completed ?? false);

    void _saveForm() {
      context.read(firestoreServiceProvider).upsert(
          todo: Todo(
              uid: item != null ? item!.uid : _uuid.v1(),
              content: _content.text.trim(),
              completed: _completed.value));
      Navigator.pop(context);
    }

    return BaseWidget(
      appBar: AppBar(title: const Text('Add todo')),
      child: ProviderListener<StateController<String?>>(
        provider: firestoreErrorProvider,
        onChange: (context, value) {
          if (value.state != null)
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(value.state!)));
        },
        child: Column(children: [
          TodoEditHeader(completed: _completed),
          ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16.0),
              children: [
                ContentField(controller: _content),
                const SizedBox(height: 24.0),
                // Add or Save
                ElevatedButton.icon(
                    onPressed: _isValid ? _saveForm : null,
                    icon: const Icon(Icons.playlist_add_rounded),
                    label: item != null
                        ? const Text('Edit todo')
                        : const Text('Create todo')),
              ]),
        ]),
      ),
    );
  }
}

class TodoEditHeader extends StatelessWidget {
  const TodoEditHeader({
    Key? key,
    required ValueNotifier<bool> completed,
  })   : _completed = completed,
        super(key: key);

  final ValueNotifier<bool> _completed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 4.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            const Icon(
              Icons.lightbulb,
              size: 28.0,
            ),
            const SizedBox(width: 8.0),
            const Text(
              'Be creative',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            )
          ]),
          Switch(
              value: _completed.value,
              onChanged: (value) => _completed.value = value),
        ],
      ),
    );
  }
}
