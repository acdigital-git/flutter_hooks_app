import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

class SimpleAnimationView extends HookWidget {
  SimpleAnimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        appBar: AppBar(title: Text('Simple Animation')),
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
                icon: Icon(Icons.remove_rounded),
                onPressed: () {},
                iconSize: 40.0),
            const SizedBox(width: 8.0),
            TweenAnimationBuilder<int>(
                duration: const Duration(seconds: 3),
                tween: IntTween(begin: 0, end: 100),
                builder: (_, int value, __) {
                  return Text(value.toString(),
                      style: TextStyle(fontSize: 40.0));
                }),
            const SizedBox(width: 8.0),
            IconButton(
                icon: Icon(Icons.add_rounded),
                onPressed: () {},
                iconSize: 40.0),
          ]),
        ])));
  }
}
