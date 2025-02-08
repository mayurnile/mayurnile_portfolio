import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../../core/core.dart';

const int defaultNormalScrollAnimationLengthMS = 1500;
const double defaultScrollSpeed = 2.5;

class SmoothScroll extends StatefulWidget {
  final ScrollController controller;
  final Widget child;
  final double scrollSpeed;
  final int scrollAnimationLength;
  final Curve curve;

  const SmoothScroll({
    super.key,
    required this.controller,
    required this.child,
    this.scrollSpeed = defaultScrollSpeed,
    this.scrollAnimationLength = defaultNormalScrollAnimationLengthMS,
    this.curve = Curves.fastLinearToSlowEaseIn,
  });

  @override
  State<SmoothScroll> createState() => _SmoothScrollState();
}

class _SmoothScrollState extends State<SmoothScroll> {
  double _scroll = 0;
  bool _isAnimating = false;
  double _targetScroll = 0;
  DateTime _lastScrollTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(scrollListener);
    _targetScroll = widget.controller.initialScrollOffset;
  }

  @override
  void didUpdateWidget(covariant SmoothScroll oldWidget) {
    if (!widget.controller.hasClients) {
      widget.controller.addListener(scrollListener);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _smoothScrollTo(double delta) {
    final now = DateTime.now();
    final timeDiff = now.difference(_lastScrollTime).inMilliseconds;
    _lastScrollTime = now;

    // Update target scroll position
    _targetScroll += (delta * widget.scrollSpeed);

    // Bound the scroll value
    if (_targetScroll > widget.controller.position.maxScrollExtent) {
      _targetScroll = widget.controller.position.maxScrollExtent;
    }
    if (_targetScroll < 0) {
      _targetScroll = 0;
    }

    // Calculate animation duration based on time between scrolls
    int animationDuration = timeDiff < 50
        ? widget.scrollAnimationLength ~/ 4 // Faster for rapid scrolling
        : widget.scrollAnimationLength;

    // If at bounds, use shorter animation
    if (_targetScroll == widget.controller.position.maxScrollExtent ||
        _targetScroll == 0) {
      animationDuration = widget.scrollAnimationLength ~/ 4;
    }

    // Always start a new animation to the target
    widget.controller
        .animateTo(
      _targetScroll,
      duration: Duration(milliseconds: animationDuration),
      curve: widget.curve,
    )
        .then((_) {
      setState(() => _isAnimating = false);
    });

    setState(() => _isAnimating = true);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (navBarController) {
      return Listener(
        onPointerSignal: (pointerSignal) {
          if (pointerSignal is PointerScrollEvent) {
            _smoothScrollTo(pointerSignal.scrollDelta.dy);
          }
        },
        child: widget.child,
      );
    });
  }

  void scrollListener() {
    _scroll = widget.controller.offset;
    // Update target scroll when user manually scrolls
    if (!_isAnimating) {
      _targetScroll = _scroll;
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(scrollListener);
    super.dispose();
  }
}
