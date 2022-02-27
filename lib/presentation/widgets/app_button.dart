import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color borderColor;
  final bool isSmall;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.borderColor,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline4!.copyWith(color: borderColor, fontSize: isSmall ? 14.0 : 18.0),
      ),
      style: OutlinedButton.styleFrom(
        elevation: 0.0,
        side: BorderSide(color: borderColor),
        padding: isSmall
            ? const EdgeInsets.symmetric(
                vertical: 22.0,
                horizontal: 22.0,
              )
            : const EdgeInsets.symmetric(
                vertical: 22.0,
                horizontal: 36.0,
              ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    );
  }
}
