import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

enum BadgeType { mobile, tablet, desktop }

class SkillBadgeV2 extends StatefulWidget {
  final String icon;
  final String title;
  final BadgeType type;
  final double experience;

  const SkillBadgeV2({
    super.key,
    required this.icon,
    required this.title,
    required this.type,
    required this.experience,
  });

  @override
  State<SkillBadgeV2> createState() => _SkillBadgeV2State();
}

class _SkillBadgeV2State extends State<SkillBadgeV2> with TickerProviderStateMixin {
  // controller
  late AnimationController _controller;
  late AnimationController _textAnimController;
  late Tween<double> _textTween;
  late Animation<double> _textAnimation;

  // data variables
  bool isFront = true;
  double anglePlus = 0;
  bool isHovered = false;
  double iconSize = 0.0;
  double cardWidth = 0.0;
  double padding = 0.0;
  double fontSize = 0.0;
  double subtitleFontSize = 0.0;

  // Animation Variables
  static const Curve _animCurve = Curves.easeOut;

  // device variables
  late Size size;
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();

    // initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _textAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // init tween
    _textTween = Tween<double>(begin: 0.0, end: widget.experience);

    // init animation
    _textAnimation = _textTween.animate(CurvedAnimation(parent: _textAnimController, curve: _animCurve));

    // init data variables
    // Future.delayed(Duration.zero).then((_) => _initSizes());
    // _initSizes();
  }

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    textTheme = Theme.of(context).textTheme;

    _initSizes();

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _alterHoveredState,
      child: MouseRegion(
        onEnter: (_) => _alterHoveredState(),
        onExit: (_) => _alterHoveredState(),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            double angle = _controller.value * pi;

            if (isFront) angle += anglePlus;

            final transform = Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(angle);

            return Transform(
              transform: transform,
              alignment: Alignment.center,
              child: isFrontWidget(angle.abs())
                  ? _buildFrontSide()
                  : Transform(
                      transform: Matrix4.identity()..rotateY(pi),
                      alignment: Alignment.center,
                      child: _buildBackSide(),
                    ),
            );
          },
        ),
      ),
    );
  }

  /// Builder Functions
  ///
  ///
  Widget _buildFrontSide() => Container(
        width: cardWidth,
        margin: EdgeInsets.only(right: padding),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor.withOpacity(0.1),
          border: Border.all(color: AppTheme.secondaryColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // skill icon
            SvgPicture.asset(
              widget.icon,
              height: iconSize,
              width: iconSize,
              fit: BoxFit.fitHeight,
            ),
            // spacing
            SizedBox(height: padding),
            // skill name
            Text(
              widget.title,
              style: textTheme.bodyMedium!.copyWith(
                fontFamily: 'Victor Mono',
                fontSize: subtitleFontSize,
              ),
              maxLines: 1,
            )
          ],
        ),
      );

  Widget _buildBackSide() => Container(
        width: cardWidth,
        margin: EdgeInsets.only(right: padding),
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 18.0),
        decoration: BoxDecoration(
          color: AppTheme.secondaryColor.withOpacity(0.1),
          border: Border.all(color: AppTheme.secondaryColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // years of experience
            AnimatedBuilder(
              animation: _textAnimation,
              builder: (_, __) => SizedBox(
                height: iconSize,
                width: iconSize,
                child: FittedBox(
                  child: Text(
                    _textAnimation.value.toStringAsFixed(1),
                    style: textTheme.displayLarge!.copyWith(
                      fontFamily: 'Victor Mono',
                      color: AppTheme.ternaryColor,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ),
            ),
            // spacing
            SizedBox(height: padding),
            // subtitle
            Text(
              "YOE",
              style: textTheme.bodyMedium!.copyWith(
                fontFamily: 'Victor Mono',
                color: AppTheme.ternaryColor,
                fontWeight: FontWeight.bold,
                fontSize: subtitleFontSize,
              ),
            ),
          ],
        ),
      );

  /// Member Functions
  ///
  ///
  void _initSizes() {
    switch (widget.type) {
      case BadgeType.mobile:
        iconSize = 22.0;
        padding = 12.0;
        fontSize = 14.0;
        subtitleFontSize = 10.0;
        cardWidth = MediaQuery.of(context).size.width * 0.18;
        break;
      case BadgeType.tablet:
        iconSize = 36.0;
        padding = 18.0;
        fontSize = 18.0;
        subtitleFontSize = 14.0;
        cardWidth = MediaQuery.of(context).size.width * 0.2;
        break;
      case BadgeType.desktop:
        iconSize = 48.0;
        padding = 22.0;
        fontSize = 32.0;
        subtitleFontSize = 14.0;
        cardWidth = MediaQuery.of(context).size.width * 0.065;
        break;
    }
  }

  Future<void> _alterHoveredState() async {
    setState(() => isHovered = !isHovered);
    if (isHovered) {
      flipForward();
      await Future.delayed(const Duration(milliseconds: 500));
      _textAnimController.reset();
      _textAnimController.forward(from: 0.0);
    } else {
      flipBackward();
    }
  }

  bool isFrontWidget(double angle) {
    const double degrees90 = pi / 2;
    const double degrees270 = 3 * pi / 2;

    return angle <= degrees90 || angle >= degrees270;
  }

  Future flipForward() async {
    if (_controller.isAnimating) {
      await Future.delayed(const Duration(seconds: 2));
    }
    isFront = !isFront;

    await _controller.forward(from: 0.0).then((value) => anglePlus = pi);
  }

  Future flipBackward() async {
    if (_controller.isAnimating) {
      await Future.delayed(const Duration(seconds: 2));
    }
    await _controller.reverse(from: 1.0);
    isFront = !isFront;
  }
}
