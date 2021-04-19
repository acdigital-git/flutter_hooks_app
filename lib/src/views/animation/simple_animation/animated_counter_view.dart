import 'package:flutter/material.dart';

class AnimatedCounterView extends StatefulWidget {
  AnimatedCounterView({Key? key}) : super(key: key);

  @override
  _AnimatedCounterViewState createState() => _AnimatedCounterViewState();
}

class _AnimatedCounterViewState extends State<AnimatedCounterView>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  Animation<int> _animatedCounter = const AlwaysStoppedAnimation(0);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _counter += 50;
      _animatedCounter = IntTween(begin: _animatedCounter.value, end: _counter)
          .animate(_animationController);
      _animationController.forward(from: 0);
    });
  }

  void _decrement() {
    setState(() {
      _counter -= 50;
      _animatedCounter = IntTween(begin: _animatedCounter.value, end: _counter)
          .animate(_animationController);
      _animationController.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 220.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Card(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
                icon: Icon(Icons.remove_rounded),
                onPressed: _counter > 0 ? _decrement : null,
                iconSize: 40.0),
            const SizedBox(width: 8.0),
            AnimatedBuilder(
                animation: _animatedCounter,
                builder: (context, child) => Text('${_animatedCounter.value}',
                    style: TextStyle(fontSize: 40.0))),
            const SizedBox(width: 8.0),
            IconButton(
                icon: Icon(Icons.add_rounded),
                onPressed: _counter < 300 ? _increment : null,
                iconSize: 40.0)
          ]),
        )
      ]),
    );
  }
}
