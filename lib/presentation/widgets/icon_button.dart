import 'package:flutter/material.dart';

import '../../core/core.dart';

class AppIconButton extends StatelessWidget {
  final bool isFilled;
  final Widget icon;
  final VoidCallback onPressed;
  final Color color;
  final bool isSmall;

  const AppIconButton({
    Key? key,
    required this.isFilled,
    required this.icon,
    required this.onPressed,
    required this.color,
    required this.isSmall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFilled) {
      return Transform.scale(
        scale: isSmall ? 0.7 : 1.0,
        alignment: Alignment.centerLeft,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: color,
            padding: isSmall ? const EdgeInsets.all(18.0) : const EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          child: icon,
        ),
      );
    } else {
      return Transform.scale(
        scale: isSmall ? 0.7 : 1.0,
        alignment: Alignment.centerRight,
        child: OutlinedButton(
          onPressed: onPressed,
          style: AppTheme.getSquaredOutlinedButtonStyle(isSmall, color),
          child: icon,
        ),
      );
    }
  }
}
