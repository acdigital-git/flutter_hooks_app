import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

const Duration _duration = Duration(seconds: 2);

class SimpleAnimationView extends StatefulWidget {
  SimpleAnimationView({Key? key}) : super(key: key);

  @override
  _SimpleAnimationViewState createState() => _SimpleAnimationViewState();
}

class _SimpleAnimationViewState extends State<SimpleAnimationView>
    with TickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  Animation<int> _animatedCounter = const AlwaysStoppedAnimation(0);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: _duration, vsync: this);
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
    return BaseWidget(
        appBar: AppBar(title: Text('Simple Animation')),
        child: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
                icon: Icon(Icons.remove_rounded),
                onPressed: _decrement,
                iconSize: 40.0),
            const SizedBox(width: 8.0),
            AnimatedBuilder(
                animation: _animatedCounter,
                builder: (context, child) => Text('${_animatedCounter.value}',
                    style: TextStyle(fontSize: 40.0))),
            const SizedBox(width: 8.0),
            IconButton(
                icon: Icon(Icons.add_rounded),
                onPressed: _increment,
                iconSize: 40.0)
          ])
        ])));
  }
}
