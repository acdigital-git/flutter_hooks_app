import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/hooks/counter/animated_int_hook.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/styles/app_styles.dart';
import 'package:flutter_hooks_app/src/views/counter/widgets/total_widget.dart';
import 'package:flutter_hooks_app/src/views/counter/widgets/counter_widget.dart';

const _duration = AppGlobals.animationDuration;
const _minValue = 0;
const _maxValue = 1000;
const _addValue = 100;

class CounterView extends HookWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // counters
    final counter = useState<int>(0);
    final counter2 = useState<int>(0);
    // <Animation<int>> animations
    final animatedCounter =
        useAnimatedInt(counter: counter.value, duration: _duration);
    final animatedCounter2 =
        useAnimatedInt(counter: counter2.value, duration: _duration);
    // listen to animatedint and calls setState() when value change
    // We dont need an AnimatedBuilder to listen to the animation anymore
    final counterAnimatedValue = useAnimation(animatedCounter);
    final counter2AnimatedValue = useAnimation(animatedCounter2);
    // Total
    final total = (counterAnimatedValue + counter2AnimatedValue);
    // test values (min : 0, max : 1000)
    _incrementCounter(ValueNotifier<int> value) =>
        value.value < _maxValue ? () => value.value += _addValue : null;
    _decrementCounter(ValueNotifier<int> value) =>
        value.value > _minValue ? () => value.value -= _addValue : null;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('AnimatedCounter w/ Hooks')),
        body: Center(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 64.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CounterWidget(
                    counter: animatedCounter.value,
                    increment: _incrementCounter(counter),
                    decrement: _decrementCounter(counter),
                  ),
                  AppStyles.divider32,
                  CounterWidget(
                    counter: animatedCounter2.value,
                    increment: _incrementCounter(counter2),
                    decrement: _decrementCounter(counter2),
                  ),
                  AppStyles.divider32,
                  TotalWidget(total: total)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
