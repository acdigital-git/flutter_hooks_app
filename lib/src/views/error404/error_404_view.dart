import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/core/constants/app_routes.dart';

class Error404View extends StatelessWidget {
  const Error404View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Page introuvable'),
              const SizedBox(),
              ElevatedButton.icon(
                onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.homepage, (route) => false),
                icon: Icon(Icons.home_rounded),
                label: Text('HomeView'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
