import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const _duration = Duration(milliseconds: 750);

class AnimatedIconsView extends StatelessWidget {
  const AnimatedIconsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      appBar: AppBar(title: Text('Animated Icons')),
      child: Center(
        child: CustomAnimatedIcon(),
      ),
    );
  }
}

class CustomAnimatedIcon extends HookWidget {
  const CustomAnimatedIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animController = useAnimationController(duration: _duration);
    var _isActive = useState(false).value; // stores the icon's state

    void _toggleIcon() {
      _isActive = !_isActive;
      _isActive ? _animController.forward() : _animController.reverse();
    }

    return InkWell(
      onTap: _toggleIcon,
      splashColor: Colors.indigoAccent,
      child: AnimatedIcon(
        icon: AnimatedIcons.add_event,
        size: 96,
        progress: _animController,
      ),
    );
  }
}
