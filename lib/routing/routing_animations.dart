import 'package:flutter/material.dart';
import 'package:mayur_nile_portfolio/core/core.dart';

PageRoute getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name ?? AppRoutes.landingRoute);
}

PageRoute getSlidePageRoute(Widget child, RouteSettings settings) {
  return _SlidePageRoute(child: child, routeName: settings.name ?? AppRoutes.landingRoute);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({
    required this.child,
    required this.routeName,
  }) : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: child),
        );
}

class _SlidePageRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _SlidePageRoute({required this.child, required this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          transitionDuration: const Duration(milliseconds: 1500),
          reverseTransitionDuration: const Duration(milliseconds: 1500),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            // Offset from offscreen to the right to fully on screen.
            final Animatable<Offset> kRightMiddleTween = Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            );

            final Animation<Offset> layerOnePositionAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.0, 0.4, curve: Curves.linearToEaseOut),
              reverseCurve: const Interval(0.0, 0.4, curve: Curves.easeInToLinear),
            ).drive(kRightMiddleTween);

            final Animation<Offset> layerTwoPositionAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.3, 0.6, curve: Curves.linearToEaseOut),
              reverseCurve: const Interval(0.3, 0.6, curve: Curves.easeInToLinear),
            ).drive(kRightMiddleTween);

            final Animation<Offset> layerThreePositionAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.5, 0.8, curve: Curves.linearToEaseOut),
              reverseCurve: const Interval(0.5, 0.8, curve: Curves.easeInToLinear),
            ).drive(kRightMiddleTween);

            final Animation<Offset> childPositionAnimation = CurvedAnimation(
              parent: animation,
              curve: const Interval(0.6, 1.0, curve: Curves.linearToEaseOut),
              reverseCurve: const Interval(0.6, 1.0, curve: Curves.easeInToLinear),
            ).drive(kRightMiddleTween);

            final TextDirection textDirection = Directionality.of(context);

            return Stack(
              fit: StackFit.expand,
              children: [
                // green layer
                SlideTransition(
                  position: layerOnePositionAnimation,
                  textDirection: textDirection,
                  transformHitTests: false,
                  child: Container(color: AppTheme.ternaryColor),
                ),
                // yellow layer
                SlideTransition(
                  position: layerTwoPositionAnimation,
                  textDirection: textDirection,
                  transformHitTests: false,
                  child: Container(color: AppTheme.primaryColor),
                ),
                // pink layer
                SlideTransition(
                  position: layerThreePositionAnimation,
                  textDirection: textDirection,
                  transformHitTests: false,
                  child: Container(color: AppTheme.secondaryColor),
                ),
                // actual next page
                SlideTransition(
                  position: childPositionAnimation,
                  textDirection: textDirection,
                  transformHitTests: false,
                  child: child,
                ),
              ],
            );

            // return SlideTransition(
            //   position: _primaryPositionAnimation,
            //   textDirection: textDirection,
            //   transformHitTests: false,
            //   child: child,
            // );
            // return FadeTransition(opacity: animation, child: child);
          },
        );
}
