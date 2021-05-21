import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const FlutterLogo(size: 260),
      Column(children: [
        const Icon(Icons.arrow_upward_rounded, size: 90),
        const Text('Scroll Up & Down'),
        const Icon(Icons.arrow_downward_rounded, size: 90)
      ])
    ]);
  }
}
