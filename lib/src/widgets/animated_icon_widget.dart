import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

const _duration = Duration(milliseconds: 750);

class AnimatedIconWidget extends HookWidget {
  const AnimatedIconWidget({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final AnimatedIconData iconData;

  @override
  Widget build(BuildContext context) {
    final _animController = useAnimationController(duration: _duration);
    var _isActive = useState(false).value; // stores the icon's state

    void _toggleIcon() {
      _isActive = !_isActive;
      _isActive ? _animController.forward() : _animController.reverse();
    }

    return GestureDetector(
      onTap: _toggleIcon,
      child: Center(
        child: AnimatedIcon(
          icon: iconData,
          size: 76,
          progress: _animController,
        ),
      ),
    );
  }
}
