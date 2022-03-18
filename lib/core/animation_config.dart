import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimationConfig {
  const AnimationConfig();

  static List<Widget> columnToAnimatedList({required List<Widget> children}) => AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 600),
        childAnimationBuilder: (widget) => SlideAnimation(
          verticalOffset: 100.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: children,
      );

  static List<Widget> sideBarAnimatedList({required List<Widget> children}) => AnimationConfiguration.toStaggeredList(
        duration: const Duration(seconds: 1),
        childAnimationBuilder: (widget) => SlideAnimation(
          verticalOffset: -200.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: children,
      );

  static List<Widget> rowToAnimatedList({required List<Widget> children}) => AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 600),
        delay: const Duration(seconds: 1),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 150.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: children,
      );
}
