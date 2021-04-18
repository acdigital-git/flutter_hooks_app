import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/models/result_item.dart';
import 'package:flutter_hooks_app/providers/global_providers.dart';
import 'package:flutter_hooks_app/src/helpers/ui_helpers.dart';
import 'package:flutter_hooks_app/src/routes/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const List<MenuItem> _menuItems = [
  const MenuItem(
    title: 'Todo App',
    icon: Icons.home_rounded,
    route: Routes.root,
  ),
  const MenuItem(
    title: 'Simple Animation',
    icon: Icons.animation,
    route: Routes.simpleAnimation,
  )
];

const _trailingIcon = Icon(Icons.keyboard_arrow_right_rounded);

class BaseWidget extends HookWidget {
  const BaseWidget(
      {Key? key,
      required this.appBar,
      required this.child,
      this.fab,
      this.drawer})
      : super(key: key);
  final AppBar appBar;
  final Widget child;
  final Widget? fab;
  final Widget? drawer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        drawer: Drawer(
            child: ListView(children: <Widget>[
          const DrawerHeader(
              decoration: const BoxDecoration(color: Colors.indigo),
              child: const Text('Drawer menu',
                  style: const TextStyle(fontSize: 26.0, color: Colors.white))),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                  title: Text(_menuItems[index].title,
                      style: const TextStyle(fontSize: 15.0)),
                  leading: Icon(_menuItems[index].icon),
                  trailing: _trailingIcon,
                  onTap: () => Navigator.of(context)
                      .pushReplacementNamed(_menuItems[index].route)),
              separatorBuilder: (_, __) => const Divider(thickness: 1.5),
              itemCount: _menuItems.length)
        ])),
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

class MenuItem {
  final String title;
  final IconData icon;
  final String route;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.route,
  });
}
