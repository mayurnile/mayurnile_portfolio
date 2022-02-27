import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class HomeTablet extends StatelessWidget {
  const HomeTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height,
      child: Padding(
        padding: EdgeInsets.only(left: size.width * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Text(
              '<hello there>',
              style: textTheme.headline3!.copyWith(color: AppTheme.ternaryColor),
            ),
            // spacing
            const SizedBox(height: 22.0),
            // heading
            Text(
              "I'm Mayur Nile.",
              style: textTheme.headline1,
            ),
            // spacing
            const SizedBox(height: 18.0),
            // sub-heading
            SizedBox(
              width: size.width * 0.7,
              child: Text(
                'I build meaningful mobile apps.',
                style: textTheme.headline1!.copyWith(color: AppTheme.fontLightColor),
              ),
            ),
            // spacing
            const SizedBox(height: 18.0),
            // body
            SizedBox(
              width: size.width * 0.5,
              child: Text.rich(
                TextSpan(
                  text:
                      "     I'm a software engineer specializing in building (and occasionally designing) exceptional flutter applications. Currently, I'm focused on building accessible, marketing and productivity apps at ",
                  children: [
                    TextSpan(
                      text: "Digital Trons",
                      style: textTheme.bodyText1!.copyWith(color: AppTheme.ternaryColor),
                    ),
                    const TextSpan(text: "."),
                  ],
                ),
                style: textTheme.bodyText1,
              ),
            ),
            // spacing
            const SizedBox(height: 22.0),
            // download resume button
            AppButton(
              onPressed: () {},
              borderColor: AppTheme.secondaryColor,
              title: 'Download Resume',
            ),
          ],
        ),
      ),
    );
  }
}
