import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/hooks/scroll_controller_for_animation_hook.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const _duration = Duration(milliseconds: 500);

class AnimatedFabHookView extends HookWidget {
  const AnimatedFabHookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _animFab =
        useAnimationController(duration: _duration, initialValue: 1);
    final _scrollController = useScrollControllerForAnimation(_animFab);
    return BaseWidget(
        appBar: AppBar(title: Text('AnimatedFab w/ Hooks')),
        child: Center(
            child: Card(
          child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                  width: double.infinity,
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 10; i++)
                          Row(children: [
                            FlutterLogo(size: 260),
                            Column(children: [
                              Text('Scroll Down'),
                              Icon(Icons.arrow_downward_rounded, size: 120)
                            ])
                          ])
                      ]))),
        )),
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
