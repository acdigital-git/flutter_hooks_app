import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/hooks/fab/scroll_listener_hook.dart';
import 'package:flutter_hooks_app/core/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/views/fab/widgets/background_widget.dart';

const _duration = AppGlobals.animationDuration;

class FabView extends HookWidget {
  const FabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fabAnimationController =
        useAnimationController(duration: _duration, initialValue: 1);
    final scrollListener =
        useScrollListener(animationController: fabAnimationController);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('AnimatedFab w/ Hooks')),
        body: Center(
          child: Card(
            child: SingleChildScrollView(
              controller: scrollListener,
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < 10; i++) BackgroundWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FadeTransition(
          opacity: fabAnimationController,
          child: ScaleTransition(
            scale: fabAnimationController,
            child: FloatingActionButton.extended(
                onPressed: () => print('** Useless fab **'),
                label: Text('Useless FAB')),
          ),
        ),
      ),
    );
  }
}
