import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedController extends StatefulWidget {
  const AnimatedController({Key? key}) : super(key: key);

  @override
  State<AnimatedController> createState() => _AnimatedControllerState();
}

class _AnimatedControllerState extends State<AnimatedController>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation =
        Tween<double>(begin: 0, end: pi * 2).animate(animationController);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateY(animation.value),
              child: Container(
                height: 100,
                width: 100,
                child: Text("heelo"),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
  }
}
