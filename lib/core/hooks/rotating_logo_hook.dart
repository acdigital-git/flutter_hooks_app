import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_hooks/flutter_hooks.dart';

Animation<double> useRotatingLogoListener(
    {required Duration duration,
    required Curve curveIn,
    required Curve curveOut}) {
  final animationController = useAnimationController(duration: duration);
  animationController.addStatusListener(
    (status) {
      if (status == AnimationStatus.dismissed) {
        animationController.forward();
      } else if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
    },
  );
  if (!animationController.isAnimating) {
    animationController.forward();
  }
  final _curvedAnimation = CurvedAnimation(
      parent: animationController, curve: curveIn, reverseCurve: curveOut);
  return Tween<double>(begin: 0, end: 2 * math.pi).animate(_curvedAnimation);
}
