import 'package:flutter/material.dart';

class BulletPoint extends StatelessWidget {
  final String text;
  final double? totalWidth;
  final double? contentWidth;

  const BulletPoint({super.key, required this.text, this.totalWidth, this.contentWidth});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: totalWidth ?? size.width * 0.25,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // bullet point
            Text("-", style: textTheme.bodyLarge!.copyWith(color: Colors.white)),
            // spacing
            const SizedBox(width: 12.0),
            // text content
            SizedBox(
              width: contentWidth ?? size.width * 0.2,
              child: Text(
                text,
                style: textTheme.bodyMedium!.copyWith(color: Colors.white),
                maxLines: 3,
                overflow: TextOverflow.clip,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
