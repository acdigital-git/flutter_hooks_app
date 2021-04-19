import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/helpers/ui_helpers.dart';
import 'package:flutter_hooks_app/src/views/animation/simple_animation/animated_container_view.dart';
import 'package:flutter_hooks_app/src/views/animation/simple_animation/animated_counter_view.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

class SimpleAnimationView extends StatelessWidget {
  const SimpleAnimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        appBar: AppBar(title: Text('Simple Animation')),
        child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              const Text('Animated Counter (Statefull)',
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(height: 16.0),
              AnimatedCounterView(),
              const CustomDivider(),
              const Text('Animated Container',
                  style: TextStyle(fontSize: 18.0)),
              const SizedBox(height: 16.0),
              AnimatedContainerView(),
              const CustomDivider(),
            ])));
  }
}
