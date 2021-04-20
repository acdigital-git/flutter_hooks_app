import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/hooks/animated_int_hook.dart';
import 'package:flutter_hooks_app/src/helpers/ui_helpers.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter_hooks_app/src/widgets/layouts/counter_row_widget.dart';

const _duration = Duration(milliseconds: 500);

class CounterHookAnimationView extends HookWidget {
  const CounterHookAnimationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // counters
    final _counter = useState<int>(0);
    final _counter2 = useState<int>(0);
    // <Animation<int>> animations
    final _animCounter =
        useAnimatedInt(counter: _counter.value, duration: _duration);
    final _animCounter2 =
        useAnimatedInt(counter: _counter2.value, duration: _duration);

    final _counterValue = useAnimation(_animCounter);
    final _counter2Value = useAnimation(_animCounter2);

    void _incrementCounter(ValueNotifier<int> counter) => counter.value += 100;
    void _decrementCounter(ValueNotifier<int> counter) => counter.value -= 100;

    return BaseWidget(
        appBar: AppBar(title: Text('Hook Animation')),
        child: Center(
          child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64.0),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Animated Counters (With hook)',
                            style: TextStyle(fontSize: 18.0)),
                        const SizedBox(height: 16.0),
                        CounterRowWidget(
                            counter: _animCounter.value,
                            increment: () => _incrementCounter(_counter),
                            decrement: () => _decrementCounter(_counter)),
                        const CustomDivider(),
                        CounterRowWidget(
                            counter: _animCounter2.value,
                            increment: () => _incrementCounter(_counter2),
                            decrement: () => _decrementCounter(_counter2)),
                        const CustomDivider(),
                        Text('${_counterValue + _counter2Value}',
                            style: const TextStyle(fontSize: 32.0))
                      ]),
                ),
              )),
        ));
  }
}
