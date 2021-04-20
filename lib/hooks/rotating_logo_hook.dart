import 'package:flutter/material.dart';
import 'dart:math' as math;

Animation<double> useRotatingLogoController(
    {required AnimationController animationController}) {
  animationController.addStatusListener((status) {
    if (status == AnimationStatus.completed) {
      animationController.reverse();
    } else if (status == AnimationStatus.dismissed) {
      animationController.forward();
    }
  });
  return Tween<double>(begin: 0, end: 2 * math.pi).animate(animationController);
}
