import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/hooks/scroll_controller_listener_hook.dart';
import 'package:flutter_hooks_app/src/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const _duration = AppGlobals.animDuration;

class AnimatedFabHookView extends HookWidget {
  const AnimatedFabHookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animFab =
        useAnimationController(duration: _duration, initialValue: 1);
    final _scrollListener =
        useScrollControllerWithListener(animationController: _animFab);

    return BaseWidget(
        appBar: AppBar(title: Text('AnimatedFab w/ Hooks')),
        child: Center(
          child: Card(
            child: SingleChildScrollView(
              controller: _scrollListener,
              child: Container(
                  width: double.infinity,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 10; i++) AnimatedFabLogoRow()
                      ])),
            ),
          ),
        ),
        fabLocation: FloatingActionButtonLocation.centerFloat,
        fab: FadeTransition(
          opacity: _animFab,
          child: ScaleTransition(
            scale: _animFab,
            child: FloatingActionButton.extended(
                onPressed: () => print('** Useless fab **'),
                label: Text('Useless FAB')),
          ),
        ));
  }
}

class AnimatedFabLogoRow extends StatelessWidget {
  const AnimatedFabLogoRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const FlutterLogo(size: 260),
      Column(children: [
        const Icon(Icons.arrow_upward_rounded, size: 90),
        const Text('Scroll Up & Down'),
        const Icon(Icons.arrow_downward_rounded, size: 90)
      ])
    ]);
  }
}
