import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/hooks/rotating_logo_hook.dart';
import 'package:flutter_hooks_app/src/routes/routes.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const _duration = Duration(milliseconds: 2500);

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
        appBar: AppBar(title: Text('RotatingLogo w/ Hooks'), actions: [
          IconButton(
              icon: const Icon(Icons.home_rounded),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(Routes.root))
        ]),
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
