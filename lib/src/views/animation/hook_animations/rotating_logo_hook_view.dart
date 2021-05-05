import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/hooks/rotating_logo_hook.dart';
import 'package:flutter_hooks_app/src/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const _duration = AppGlobals.rotationDuration;

class RotatingLogoHookView extends HookWidget {
  const RotatingLogoHookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animController = useRotatingLogoListener(
        duration: _duration,
        curveIn: Curves.easeInOut,
        curveOut: Curves.easeInOut);
    final currentAngleValue = useAnimation(animController);

    return BaseWidget(
        appBar: AppBar(title: Text('RotatingLogo w/ Hooks')),
        child: Center(
            child: Transform.rotate(
          angle: currentAngleValue,
          child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              padding: const EdgeInsets.all(40.0),
              child: FlutterLogo(size: 220)),
        )));
  }
}
