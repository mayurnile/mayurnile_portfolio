import 'package:flutter/material.dart';

import '../../core/core.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color borderColor;
  final bool isSmall;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.borderColor,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: AppTheme.getOutlinedButtonStyle(isSmall, borderColor),
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: borderColor,
              fontSize: isSmall ? 14.0 : 18.0,
            ),
      ),
    );
  }
}
