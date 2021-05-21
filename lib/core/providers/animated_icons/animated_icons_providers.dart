import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final animatedIconsProvider = Provider<List<AnimatedIconData>>(
  (ref) => const [
    AnimatedIcons.add_event,
    AnimatedIcons.menu_arrow,
    AnimatedIcons.menu_close,
    AnimatedIcons.menu_home,
    AnimatedIcons.ellipsis_search,
    AnimatedIcons.list_view,
    AnimatedIcons.pause_play,
    AnimatedIcons.play_pause,
  ],
);
