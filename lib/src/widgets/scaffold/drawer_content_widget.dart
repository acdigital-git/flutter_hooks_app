import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/menu_drawer_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

const _trailingIcon = Icon(Icons.keyboard_arrow_right_rounded);

class DrawerContentWidget extends HookWidget {
  const DrawerContentWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _menuItems = useProvider(menuDrawerProvider);
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => ListTile(
              title: Text(_menuItems[index].title,
                  style: const TextStyle(fontSize: 15.0)),
              leading: Icon(_menuItems[index].icon),
              trailing: _trailingIcon,
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.of(context).pushNamed(
                    _menuItems[index].route); // Navigate to named route
              },
            ),
        separatorBuilder: (_, __) => const Divider(thickness: 1.5),
        itemCount: _menuItems.length);
  }
}
