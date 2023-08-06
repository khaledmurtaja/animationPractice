import 'dart:math';

import 'package:flutter/material.dart';

class PolygonAnimation extends StatefulWidget {
  const PolygonAnimation({Key? key}) : super(key: key);

  @override
  State<PolygonAnimation> createState() => _PolygonAnimationState();
}

class _PolygonAnimationState extends State<PolygonAnimation>
    with TickerProviderStateMixin {
  late AnimationController sideAnimationController;
  late AnimationController sizeAnimationController;
  late Animation<int> animation;
  late Animation<double> sizeAnimation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnimatedBuilder(
      animation: Listenable.merge([sideAnimationController,sizeAnimationController]),
      builder: (BuildContext context, Widget? child) {
        return CustomPaint(
          painter: Polygon(sides: animation.value),
          child: SizedBox(
            height: sizeAnimation.value,
            width: sizeAnimation.value,
          ),
        );
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    sideAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation = IntTween(begin: 3, end: 10).animate(sideAnimationController);
    sizeAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    sizeAnimation = Tween<double>(begin: 20, end: 400)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(sizeAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    sideAnimationController.dispose();
    sizeAnimationController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sideAnimationController.repeat(reverse: true);
    sizeAnimationController.repeat(reverse: true);
  }
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({
    required this.sides,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;

    final angles = List.generate(sides, (index) => index * angle);

    final radius = size.width / 2;

    /*
    x = center.x + radius * cos(angle)
    y = center.y + radius * sin(angle)
    */

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      oldDelegate is Polygon && oldDelegate.sides != sides;
}
