import 'package:flutter/material.dart';

class AnimatedController extends StatefulWidget {
  const AnimatedController({Key? key}) : super(key: key);

  @override
  State<AnimatedController> createState() => _AnimatedControllerState();
}

class _AnimatedControllerState extends State<AnimatedController> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        height: 100,
        width: 100,
      ),
    );
  }

  @override
  void dispose() {}
}
