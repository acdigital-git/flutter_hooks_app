import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

//const _duration = Duration(milliseconds: 4);

class RotatingLogoHookView extends HookWidget {
  const RotatingLogoHookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        appBar: AppBar(title: Text('AnimatedFab w/ Hooks')),
        child: Center(
            child: Transform.rotate(
          angle: 0,
          child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              padding: const EdgeInsets.all(32.0),
              child: FlutterLogo(size: 200)),
        )));
  }
}
