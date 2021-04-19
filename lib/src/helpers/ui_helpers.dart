import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/models/result_item.dart';

class UiHelpers {
  static Future<void> showSnackBar(
          {required BuildContext context, required ResultItem item}) async =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(item.message!),
          action: SnackBarAction(
              textColor: Colors.white,
              label: 'CLOSE',
              onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar),
          backgroundColor: item.isError ? Colors.redAccent : Colors.teal));
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
        thickness: 1.5, indent: 90.0, endIndent: 90.0, height: 32.0);
  }
}
