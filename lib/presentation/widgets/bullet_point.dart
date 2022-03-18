import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;

  const BulletPoint({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: size.width * 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // bullet point
            Text("-", style: textTheme.bodyText1!.copyWith(color: Colors.white)),
            // spacing
            const SizedBox(width: 12.0),
            // text content
            SizedBox(
              width: size.width * 0.2,
              child: Text(
                text,
                style: textTheme.bodyText2!.copyWith(color: Colors.white),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
