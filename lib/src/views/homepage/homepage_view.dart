import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_hooks_app/core/providers/homepage/homepage_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePageView extends HookWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final views = useProvider(viewsProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Hook Animations'),
        ),
        body: Center(
          child: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            itemCount: views.length,
            separatorBuilder: (context, index) => const SizedBox(height: 32.0),
            itemBuilder: (context, index) {
              final view = views[index];
              return ElevatedButton.icon(
                label: Text(view.label),
                icon: Icon(view.icon),
                onPressed: () => Navigator.pushNamed(context, view.path),
              );
            },
          ),
        ),
      ),
    );
  }
}
