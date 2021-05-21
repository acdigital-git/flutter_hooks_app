import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/data/models/custom_animated_icon_controller.dart';
import 'package:flutter_hooks_app/data/models/icon_pair.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customIconsProvider = Provider<List<IconPair>>((ref) => [
      IconPair(start: Icons.check_circle_rounded, end: Icons.cancel_rounded),
      IconPair(start: Icons.add_rounded, end: Icons.close_rounded),
      IconPair(start: Icons.play_arrow_rounded, end: Icons.stop_rounded),
      IconPair(start: Icons.animation_rounded, end: Icons.auto_awesome_motion),
      IconPair(start: Icons.edit_rounded, end: Icons.delete_outline_rounded),
      IconPair(start: Icons.login_rounded, end: Icons.logout_rounded),
      IconPair(
          start: Icons.visibility_rounded, end: Icons.visibility_off_rounded),
      IconPair(
          start: Icons.location_on_rounded, end: Icons.location_off_rounded),
    ]);

final animatedIconsControllersStateNotifier = StateNotifierProvider<
        AnimatedIconsControllersStateNotifier,
        List<CustomAnimatedIconController>>(
    (ref) => AnimatedIconsControllersStateNotifier());

class AnimatedIconsControllersStateNotifier
    extends StateNotifier<List<CustomAnimatedIconController>> {
  AnimatedIconsControllersStateNotifier() : super([]);

  void addController(CustomAnimatedIconController newController) => state = [
        ...state,
        newController,
      ];
  void runAllForward() {
    for (var controller in state) {
      controller.animateToEnd();
    }
  }

  void runAllReverse() {
    for (var controller in state) {
      controller.animateToStart();
    }
  }
}
