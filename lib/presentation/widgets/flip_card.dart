import 'dart:math';

import 'package:flutter/material.dart';

class FlipCardController {
  FlipCardState? _state;

  Future flipForward() async => _state?.flipForward();

  Future flipBackward() async => _state?.flipBackward();
}

class FlipCard extends StatefulWidget {
  final FlipCardController controller;
  final Widget front;
  final Widget back;

  const FlipCard({
    Key? key,
    required this.controller,
    required this.front,
    required this.back,
  }) : super(key: key);

  @override
  State<FlipCard> createState() => FlipCardState();
}

class FlipCardState extends State<FlipCard> with SingleTickerProviderStateMixin {
  // animation controllers
  late AnimationController animationController;
  bool isFront = true;
  double anglePlus = 0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    widget.controller._state = this;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          double angle = animationController.value * pi;

          if (isFront) angle += anglePlus;

          final transform = Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateY(angle);

          return Transform(
            transform: transform,
            alignment: Alignment.center,
            child: isFrontWidget(angle.abs())
                ? widget.front
                : Transform(
                    transform: Matrix4.identity()..rotateY(pi),
                    alignment: Alignment.center,
                    child: widget.back,
                  ),
          );
        });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  /// Member Functions
  ///
  ///
  bool isFrontWidget(double angle) {
    const double degrees90 = pi / 2;
    const double degrees270 = 3 * pi / 2;

    return angle <= degrees90 || angle >= degrees270;
  }

  Future flipForward() async {
    if (animationController.isAnimating) return;
    isFront = !isFront;

    await animationController.forward(from: 0.0).then((value) => anglePlus = pi);
  }

  Future flipBackward() async {
    if (animationController.isAnimating) return;
    await animationController.reverse(from: 1.0);
    isFront = !isFront;
  }
}
