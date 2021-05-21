import 'package:flutter/material.dart';

class TotalWidget extends StatelessWidget {
  const TotalWidget({
    Key? key,
    required this.total,
  }) : super(key: key);

  final int total;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total: $total',
      style: const TextStyle(fontSize: 36.0),
    );
  }
}
