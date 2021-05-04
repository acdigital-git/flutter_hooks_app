import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<int> useAnimatedInt(
    {required int counter, required Duration duration}) {
  final animationController = useAnimationController(duration: duration);
  return useValueChanged(
        counter,
        (int? prevCounter, prevAnim) {
          final previousValue = prevAnim?.value ?? prevCounter;
          animationController.forward(from: 0);
          return IntTween(begin: previousValue, end: counter)
              .animate(animationController);
        },
      ) ??
      AlwaysStoppedAnimation(counter);
}
