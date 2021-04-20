import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/routes/routes.dart';

class AnimatedCounterView extends StatefulWidget {
  AnimatedCounterView({Key? key}) : super(key: key);

  @override
  _AnimatedCounterViewState createState() => _AnimatedCounterViewState();
}

class _AnimatedCounterViewState extends State<AnimatedCounterView>
    with TickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  Animation<int> _animatedCounter = const AlwaysStoppedAnimation(0);
  int _counter2 = 0;
  late AnimationController _animationController2;
  Animation<int> _animatedCounter2 = const AlwaysStoppedAnimation(0);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animationController2 =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationController2.dispose();
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

  void _increment2() {
    setState(() {
      _counter2 += 50;
      _animatedCounter2 =
          IntTween(begin: _animatedCounter2.value, end: _counter2)
              .animate(_animationController2);
      _animationController2.forward(from: 0);
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

  void _decrement2() {
    setState(() {
      _counter2 -= 50;
      _animatedCounter2 =
          IntTween(begin: _animatedCounter2.value, end: _counter2)
              .animate(_animationController2);
      _animationController2.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 220.0),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        buildCard(),
        const SizedBox(height: 16.0),
        buildCard2(),
        const SizedBox(height: 16.0),
        buildCardResult(),
        const SizedBox(height: 16.0),
        TextButton.icon(
            onPressed: () =>
                Navigator.pushNamed(context, Routes.counterHookAnimation),
            icon: Icon(Icons.keyboard_arrow_right_rounded),
            label: Text('Go to hook page'))
      ]),
    );
  }

  Card buildCard() {
    return Card(
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
    );
  }

  Card buildCard2() {
    return Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(
            icon: Icon(Icons.remove_rounded),
            onPressed: _counter2 > 0 ? _decrement2 : null,
            iconSize: 40.0),
        const SizedBox(width: 8.0),
        AnimatedBuilder(
            animation: _animatedCounter2,
            builder: (context, child) => Text('${_animatedCounter2.value}',
                style: TextStyle(fontSize: 40.0))),
        const SizedBox(width: 8.0),
        IconButton(
            icon: Icon(Icons.add_rounded),
            onPressed: _counter2 < 300 ? _increment2 : null,
            iconSize: 40.0)
      ]),
    );
  }

  Card buildCardResult() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: AnimatedBuilder(
          animation: _animatedCounter,
          builder: (context, child) => AnimatedBuilder(
            animation: _animatedCounter2,
            builder: (context, child) => Text(
                '= ${_animatedCounter.value + _animatedCounter2.value}',
                style: TextStyle(fontSize: 40.0)),
          ),
        ),
      ),
    );
  }
}
