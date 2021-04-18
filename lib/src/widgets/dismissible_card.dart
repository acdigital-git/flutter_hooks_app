import 'package:flutter/material.dart';

class DismissibleCard extends StatelessWidget {
  const DismissibleCard({
    Key? key,
    required this.callBack,
    required this.content,
  }) : super(key: key);

  final Function(DismissDirection)? callBack;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(6.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.delete_forever_rounded, color: Colors.white),
                const Icon(Icons.delete_forever_rounded, color: Colors.white)
              ],
            ),
          ),
        ),
        onDismissed: callBack,
        child: content,
      ),
    );
  }
}
