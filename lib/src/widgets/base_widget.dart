import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
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
        body: child,
        floatingActionButton: fab ?? null,
      ),
    );
  }
}
