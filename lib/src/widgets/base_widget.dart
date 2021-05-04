import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/models/result_item.dart';
import 'package:flutter_hooks_app/core/providers/auth_providers.dart';
import 'package:flutter_hooks_app/core/providers/global_providers.dart';
import 'package:flutter_hooks_app/core/providers/menu_drawer_provider.dart';
import 'package:flutter_hooks_app/src/constants/app_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _trailingIcon = Icon(Icons.keyboard_arrow_right_rounded);

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
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    final _menuItems = useProvider(menuDrawerProvider);
    final _authState = useProvider(authStateProvider);
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: _authState.when(
            data: (user) => user != null
                ? Drawer(
                    child: ListView(children: <Widget>[
                    DrawerHeader(
                        decoration: const BoxDecoration(color: Colors.indigo),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Placeholder(
                                  fallbackHeight: 48,
                                  fallbackWidth: 48,
                                  color: Colors.white,
                                ),
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 32.0,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'My Drawer',
                              style: const TextStyle(
                                  fontSize: 26.0, color: Colors.white),
                            ),
                          ],
                        )),
                    ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => ListTile(
                            title: Text(_menuItems[index].title,
                                style: const TextStyle(fontSize: 15.0)),
                            leading: Icon(_menuItems[index].icon),
                            trailing: _trailingIcon,
                            onTap: () => Navigator.of(context)
                                .pushReplacementNamed(_menuItems[index].route)),
                        separatorBuilder: (_, __) =>
                            const Divider(thickness: 1.5),
                        itemCount: _menuItems.length)
                  ]))
                : null,
            loading: () => null,
            error: (error, stackTrace) => null),
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
