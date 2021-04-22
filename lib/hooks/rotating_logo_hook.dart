import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<double> useRotatingLogoListener({required Duration duration}) {
  final _animController =
      useAnimationController(duration: duration, upperBound: 2 * math.pi);
  _animController.addStatusListener((status) {
    if (status == AnimationStatus.dismissed) {
      _animController.forward();
    } else if (status == AnimationStatus.completed) {
      _animController.reverse();
    }
  });
  if (!_animController.isAnimating) {
    _animController.forward();
  }
  return _animController;
}
