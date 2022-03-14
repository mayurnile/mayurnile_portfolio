import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/core.dart';

enum BadgeType { mobile, tablet, desktop }

class SkillBadge extends StatefulWidget {
  final String icon;
  final String title;
  final BadgeType type;
  final double skillLevel;

  const SkillBadge({
    Key? key,
    required this.icon,
    required this.title,
    required this.type,
    required this.skillLevel,
  }) : super(key: key);

  @override
  State<SkillBadge> createState() => _SkillBadgeState();
}

class _SkillBadgeState extends State<SkillBadge> with SingleTickerProviderStateMixin {
  // controller
  late AnimationController _controller;
  late Tween<double> _textTween;
  late Animation<double> _textAnimation;

  // data variables
  bool isHovered = false;

  // Animation Variables
  static const Duration _animDuration = Duration(milliseconds: 500);
  static const Curve _animCurve = Curves.easeInOutCubic;

  // device variables
  late TextTheme textTheme;

  @override
  void initState() {
    super.initState();

    // initialize controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // init tween
    _textTween = Tween<double>(begin: 0.0, end: widget.skillLevel);

    // init animation
    _textAnimation = _textTween.animate(CurvedAnimation(parent: _controller, curve: _animCurve));
  }

  @override
  Widget build(BuildContext context) {
    // initializing device variables
    textTheme = Theme.of(context).textTheme;

    // calculating size
    double iconSize;
    double padding;
    double fontSize;
    switch (widget.type) {
      case BadgeType.mobile:
        iconSize = 22.0;
        padding = 12.0;
        fontSize = 14.0;
        break;
      case BadgeType.tablet:
        iconSize = 36.0;
        padding = 18.0;
        fontSize = 18.0;
        break;
      case BadgeType.desktop:
        iconSize = 48.0;
        padding = 24.0;
        fontSize = 32.0;
        break;
    }

    return GestureDetector(
      onTap: () async {
        setState(() => isHovered = !isHovered);
        await Future.delayed(const Duration(milliseconds: 300));
        _controller.reset();
        _controller.forward(from: 0.0);
      },
      child: MouseRegion(
        onEnter: (_) async {
          setState(() {
            isHovered = true;
          });
          await Future.delayed(const Duration(milliseconds: 300));
          _controller.reset();
          _controller.forward(from: 0.0);
        },
        onExit: (_) => setState(() => isHovered = false),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(500),
          child: SizedBox(
            height: iconSize + (padding * 2),
            width: iconSize + (padding * 2),
            child: Stack(
              children: [
                // actual icon
                Container(
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 3.0,
                      color: AppTheme.secondaryColor,
                    ),
                  ),
                  child: SvgPicture.asset(
                    widget.icon,
                    height: iconSize,
                    width: iconSize,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                // animated mask
                AnimatedPositioned(
                  duration: _animDuration,
                  curve: _animCurve,
                  top: isHovered ? 0 : iconSize + (padding * 2),
                  left: 0,
                  right: 0,
                  child: Container(
                    height: iconSize + (padding * 2),
                    width: iconSize + (padding * 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.secondaryColor.withOpacity(0.8),
                    ),
                  ),
                ),
                // rating
                Center(
                  child: AnimatedOpacity(
                    opacity: isHovered ? 1.0 : 0.0,
                    duration: _animDuration,
                    curve: _animCurve,
                    child: AnimatedBuilder(
                      animation: _textAnimation,
                      builder: (context, child) {
                        return Text(
                          _textAnimation.value.toStringAsFixed(0),
                          style: textTheme.headline1!.copyWith(
                            fontFamily: 'Victor Mono',
                            color: AppTheme.ternaryColor,
                            fontSize: fontSize,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
