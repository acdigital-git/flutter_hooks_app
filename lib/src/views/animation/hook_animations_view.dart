import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/menu_drawer_provider.dart';
import 'package:flutter_hooks_app/src/constants/app_utils.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HookAnimationsView extends HookWidget {
  const HookAnimationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _menuItems = useProvider(menuHookAnimationsProvider);
    return BaseWidget(
      appBar: AppBar(title: Text('Hook Animations')),
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          itemCount: _menuItems.length,
          itemBuilder: (context, index) => ElevatedButton.icon(
            onPressed: () =>
                Navigator.of(context).pushNamed(_menuItems[index].route),
            icon: Icon(_menuItems[index].icon),
            label: Text(_menuItems[index].title),
          ),
          separatorBuilder: (context, index) => AppUtils.divider32,
        ),
      ),
    );
  }
}
