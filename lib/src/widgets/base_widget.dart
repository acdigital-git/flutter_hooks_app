import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/models/result_item.dart';
import 'package:flutter_hooks_app/core/providers/global_providers.dart';
import 'package:flutter_hooks_app/src/constants/app_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseWidget extends HookWidget {
  const BaseWidget(
      {Key? key,
      required this.appBar,
      required this.child,
      this.fab,
      this.fabLocation,
      this.drawer})
      : super(key: key);
  final AppBar appBar;
  final Widget child;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;
  final Drawer? drawer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: drawer,
        body: ProviderListener<ResultItem?>(
            provider: appErrorStateNotifier,
            onChange: (context, item) {
              if (item != null && item.message != null)
                AppUtils.showSnackBar(context: context, item: item).then(
                    (value) =>
                        context.read(appErrorStateNotifier.notifier).reset());
            },
            child: ProviderListener<StateController<bool>>(
                provider: appLoadingStateProvider,
                onChange: (context, value) => value.state
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : child,
                child: child)),
        floatingActionButton: fab ?? null,
        floatingActionButtonLocation:
            fabLocation ?? FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
