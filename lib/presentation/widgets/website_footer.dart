import 'package:flutter/material.dart';

import '../../core/core.dart';

class WebsiteFooter extends StatelessWidget {
  const WebsiteFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    if (size.width > DeviceBreakpoints.tabletWidth) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left part
            Text(
              "Designed & Developed by Mayur Nile",
              style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
            ),
            // right part
            Text(
              "Built with Flutter 💙",
              style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
            ),
          ],
        ),
      );
    } else {
      return Column(
        children: [
          // top part
          Text(
            "Designed & Developed by Mayur Nile",
            style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
          ),
          // spacing
          const SizedBox(height: 12.0),
          // bottom part
          Text(
            "Built with Flutter 💙",
            style: textTheme.bodyText2!.copyWith(fontFamily: 'Victor Mono'),
          ),
        ],
      );
    }
  }
}
