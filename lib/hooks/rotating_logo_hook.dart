import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<double> useRotatingLogoListener(
    {required Duration duration,
    required Curve curveIn,
    required Curve curveOut}) {
  final _animController = useAnimationController(duration: duration);
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
  final _curvedAnimation = CurvedAnimation(
      parent: _animController, curve: curveIn, reverseCurve: curveOut);
  return Tween<double>(begin: 0, end: 2 * math.pi).animate(_curvedAnimation);
}
