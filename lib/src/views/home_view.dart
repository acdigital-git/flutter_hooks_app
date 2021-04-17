import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final helloWorldProvider = Provider<String>((ref) => 'Hello World');

class HomeView extends HookWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final String _content = useProvider(helloWorldProvider);
    return BaseWidget(
      appBarTitle: title,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(_content, style: Theme.of(context).textTheme.headline5),
          ],
        ),
      ),
    );
  }
}
