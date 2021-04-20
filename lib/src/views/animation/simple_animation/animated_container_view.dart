import 'package:flutter/material.dart';

class AnimatedContainerView extends StatefulWidget {
  const AnimatedContainerView({
    Key? key,
  }) : super(key: key);

  @override
  _AnimatedContainerViewState createState() => _AnimatedContainerViewState();
}

class _AnimatedContainerViewState extends State<AnimatedContainerView> {
  double _size = 110.0;
  Color _color = Colors.pinkAccent;
  double _radius = 6.0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GestureDetector(
          onTap: () =>
              setState(() => _size == 110.0 ? _size += 60.0 : _size -= 60.0),
          child: AnimatedContainer(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                  color: _color, borderRadius: BorderRadius.circular(_radius)),
              width: _size,
              height: _size,
              child: Center(
                  child: _size == 110
                      ? const Text('Tap to GROW',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold))
                      : const Text('Tap to Shrink',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
              duration: Duration(milliseconds: 500))),
      ButtonBar(alignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: () => setState(() => _color =
                _color == Colors.pinkAccent ? Colors.teal : Colors.pinkAccent),
            child: const Text('Colors')),
        ElevatedButton(
            onPressed: () => setState(
                () => _radius == 6.0 ? _radius += 94.0 : _radius -= 94.0),
            child: const Text('Borders')),
      ])
    ]);
  }
}
