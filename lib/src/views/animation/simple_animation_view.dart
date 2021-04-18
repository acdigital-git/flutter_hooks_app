import 'package:flutter/material.dart';
import 'package:flutter_hooks_app/src/widgets/base_widget.dart';

class SimpleAnimationView extends StatefulWidget {
  SimpleAnimationView({Key? key}) : super(key: key);

  @override
  _SimpleAnimationViewState createState() => _SimpleAnimationViewState();
}

class _SimpleAnimationViewState extends State<SimpleAnimationView> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        appBar: AppBar(title: Text('Simple Animation')),
        child: Center(
            child: Container(width: 200, height: 200, color: Colors.teal)));
  }
}
