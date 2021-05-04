import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/hooks/animated_int_hook.dart';
import 'package:flutter_hooks_app/src/helpers/ui_helpers.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:flutter_hooks_app/src/widgets/layouts/counter_row_widget.dart';

const _duration = Duration(milliseconds: 750);
const _minValue = 0;
const _maxValue = 1000;
const _addValue = 100;

class AnimatedCounterHookView extends HookWidget {
  const AnimatedCounterHookView({Key? key}) : super(key: key);

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

    // listen to animatedint and calls setState() when value change
    // We dont need an AnimatedBuilder to listen to the animation anymore
    final _counterValue = useAnimation(_animCounter);
    final _counter2Value = useAnimation(_animCounter2);

    // test values (min : 0, max : 1000)
    _incrementCounter(ValueNotifier<int> counter) =>
        counter.value < _maxValue ? () => counter.value += _addValue : null;
    _decrementCounter(ValueNotifier<int> counter) =>
        counter.value > _minValue ? () => counter.value -= _addValue : null;

    return BaseWidget(
        appBar: AppBar(title: Text('AnimatedCounter w/ Hooks')),
        child: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CounterRowWidget(
                        counter: _animCounter.value,
                        increment: _incrementCounter(_counter),
                        decrement: _decrementCounter(_counter)),
                    const CustomDivider(),
                    CounterRowWidget(
                        counter: _animCounter2.value,
                        increment: _incrementCounter(_counter2),
                        decrement: _decrementCounter(_counter2)),
                    const CustomDivider(),
                    Text('Total: ${_counterValue + _counter2Value}',
                        style: const TextStyle(fontSize: 36.0))
                  ]),
            ),
          ),
        ));
  }
}
