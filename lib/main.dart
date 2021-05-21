import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/views/app_wrapper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ProviderScope(
      child: AppWrapper(),
    ),
  );
}
