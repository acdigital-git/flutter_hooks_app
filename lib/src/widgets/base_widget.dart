import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/models/result_item.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:flutter_hooks_app/src/helpers/ui_helpers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseWidget extends HookWidget {
  const BaseWidget({
    Key? key,
    required this.appBar,
    required this.child,
    this.fab,
  }) : super(key: key);
  final AppBar appBar;
  final Widget child;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: ProviderListener<ResultItem?>(
            provider: appErrorStateNotifier,
            onChange: (context, item) {
              if (item != null && item.message != null)
                UiHelpers.showSnackBar(context: context, item: item);
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
      ),
    );
  }
}
