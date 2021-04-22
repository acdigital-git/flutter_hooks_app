import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/hooks/rotating_logo_hook.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const _duration = Duration(milliseconds: 2000);

class RotatingLogoHookView extends HookWidget {
  const RotatingLogoHookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animController = useRotatingLogoListener(duration: _duration);
    final currentValue = useAnimation(animController);

    return BaseWidget(
        appBar: AppBar(title: Text('RotatingLogo w/ Hooks')),
        child: Center(
            child: Transform.rotate(
          angle: currentValue,
          child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              padding: const EdgeInsets.all(40.0),
              child: FlutterLogo(size: 220)),
        )));
  }
}
