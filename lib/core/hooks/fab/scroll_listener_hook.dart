import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

ScrollController useScrollListener(
    {required AnimationController animationController}) {
  final _scrollController = useScrollController();
  _scrollController
    ..addListener(
      () {
        switch (_scrollController.position.userScrollDirection) {
          case ScrollDirection.forward:
            animationController.forward();
            break;
          case ScrollDirection.reverse:
            animationController.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      },
    );

  return _scrollController;
}
