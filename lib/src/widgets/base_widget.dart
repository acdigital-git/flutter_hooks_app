import 'package:flutter/material.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({
    Key? key,
    required this.appBarTitle,
    required this.child,
    this.fab,
  }) : super(key: key);
  final String appBarTitle;
  final Widget child;
  final Widget? fab;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(appBarTitle)),
        body: child,
        floatingActionButton: fab ?? null,
      ),
    );
  }
}
