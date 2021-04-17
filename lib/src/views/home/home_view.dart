import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/providers/auth_provider.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    final _user = useProvider(authUserInfoProvider).state;
    return BaseWidget(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: context.read(authServiceProvider).logout)
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(backgroundColor: Colors.indigo),
                Text(_user!.email!,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.w600))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
