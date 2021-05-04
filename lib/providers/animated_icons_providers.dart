import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/widgets/animated_icon_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final animatedIcons = Provider<List<AnimatedIconWidget>>((ref) => _icons);

const List<AnimatedIconWidget> _icons = [
  AnimatedIconWidget(iconData: AnimatedIcons.add_event),
  AnimatedIconWidget(iconData: AnimatedIcons.menu_arrow),
  AnimatedIconWidget(iconData: AnimatedIcons.menu_close),
  AnimatedIconWidget(iconData: AnimatedIcons.menu_home),
  AnimatedIconWidget(iconData: AnimatedIcons.ellipsis_search),
  AnimatedIconWidget(iconData: AnimatedIcons.list_view),
  AnimatedIconWidget(iconData: AnimatedIcons.pause_play),
];