import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/hooks/rotating_logo/rotating_logo_hook.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';

const _duration = AppGlobals.rotationDuration;

class RotatingLogoView extends HookWidget {
  const RotatingLogoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animController = useRotatingLogoListener(
        duration: _duration,
        curveIn: Curves.easeInOut,
        curveOut: Curves.easeInOut);
    final currentAngleValue = useAnimation(animController);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('RotatingLogo w/ Hooks')),
        body: Center(
          child: Transform.rotate(
            angle: currentAngleValue,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(40.0),
              child: FlutterLogo(size: 220),
            ),
          ),
        ),
      ),
    );
  }
}
