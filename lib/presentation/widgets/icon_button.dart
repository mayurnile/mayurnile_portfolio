import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final bool isFilled;
  final Widget icon;
  final VoidCallback onPressed;
  final Color color;

  const AppIconButton({
    Key? key,
    required this.isFilled,
    required this.icon,
    required this.onPressed,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFilled) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          primary: color,
          padding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: icon,
      );
    } else {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          elevation: 0.0,
          side: BorderSide(color: color),
          padding: const EdgeInsets.all(24.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: icon,
      );
    }
  }
}
