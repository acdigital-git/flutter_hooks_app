import 'package:flutter/material.dart';

class CounterRowWidget extends StatelessWidget {
  const CounterRowWidget({
    required int counter,
    VoidCallback? increment,
    VoidCallback? decrement,
  })  : _counter = counter,
        _increment = increment,
        _decrement = decrement;

  final int _counter;
  final VoidCallback? _increment;
  final VoidCallback? _decrement;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
          icon: const Icon(Icons.remove_rounded, size: 36.0),
          onPressed: _decrement),
      const SizedBox(width: 8.0),
      Text(_counter.toString(), style: const TextStyle(fontSize: 36.0)),
      const SizedBox(width: 8.0),
      IconButton(
          icon: const Icon(Icons.add_rounded, size: 36.0),
          onPressed: _increment)
    ]);
  }
}
