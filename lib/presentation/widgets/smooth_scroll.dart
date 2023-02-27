import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../core/core.dart';

const int defaultNormalScrollAnimationLengthMS = 500;
const double defaultScrollSpeed = 1.2;

class SmoothScroll extends StatefulWidget {
  ///Same ScrollController as the child widget's.
  final ScrollController controller;

  ///Child scrollable widget.
  final Widget child;

  ///Scroll speed px/scroll.
  final double scrollSpeed;

  ///Scroll animation length in milliseconds.
  final int scrollAnimationLength;

  ///Curve of the animation.
  final Curve curve;

  const SmoothScroll({
    Key? key,
    required this.controller,
    required this.child,
    this.scrollSpeed = defaultScrollSpeed,
    this.scrollAnimationLength = defaultNormalScrollAnimationLengthMS,
    this.curve = Curves.fastLinearToSlowEaseIn,
  }) : super(key: key);

  @override
  State<SmoothScroll> createState() => _SmoothScrollState();
}

class _SmoothScrollState extends State<SmoothScroll> {
  // data variables
  double _scroll = 0;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(scrollListener);
  }

  @override
  void didUpdateWidget(covariant SmoothScroll oldWidget) {
    // ignore: invalid_use_of_protected_member
    if (widget.controller.hasListeners == false) {
      widget.controller.addListener(scrollListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (navBarController) {
      return Listener(
        onPointerSignal: (pointerSignal) {
          int millis = widget.scrollAnimationLength;
          if (pointerSignal is PointerScrollEvent) {
            if (pointerSignal.scrollDelta.dy > 0) {
              _scroll += (pointerSignal.scrollDelta.dy * widget.scrollSpeed);
            } else {
              _scroll += (pointerSignal.scrollDelta.dy * widget.scrollSpeed);
            }

            if (_scroll > widget.controller.position.maxScrollExtent) {
              _scroll = widget.controller.position.maxScrollExtent;
              millis = widget.scrollAnimationLength ~/ 4;
            }
            if (_scroll < 0) {
              _scroll = 0;
              millis = widget.scrollAnimationLength ~/ 4;
            }

            widget.controller.animateTo(
              _scroll,
              duration: Duration(milliseconds: millis),
              curve: widget.curve,
            );
          }
        },
        child: widget.child,
      );
    });
  }

  /// Member Functions
  ///
  ///
  void scrollListener() => _scroll = widget.controller.offset;
}
