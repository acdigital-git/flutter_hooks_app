import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/core/providers/auth_providers.dart';
import 'package:flutter_hooks_app/src/constants/app_globals.dart';
import 'package:flutter_hooks_app/src/constants/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(color: AppTheme.accentColor),
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
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 32.0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppGlobals.name,
                style: const TextStyle(fontSize: 26.0, color: Colors.white),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  context.read(authServiceProvider).logout();
                },
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 26.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
