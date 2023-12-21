import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../widgets/widgets.dart';

import '../../core/core.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return VisibilityDetector(
      key: const ValueKey('/home-desktop-view'),
      onVisibilityChanged: (visibilityInfo) {
        final double visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage > 25) {
          locator.get<NavBarController>().updateNavBarState(NavBarState.home);
        }
      },
      child: SizedBox(
        height: size.height * 0.9,
        child: Padding(
          padding: EdgeInsets.only(left: size.width * 0.12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: AnimationConfig.columnToAnimatedList(
              children: [
                // title
                Text(
                  '<hello there>',
                  style: textTheme.displaySmall!
                      .copyWith(color: AppTheme.ternaryColor),
                ),
                // spacing
                const SizedBox(height: 22.0),
                // heading
                Text(
                  "I'm Mayur Nile.",
                  style: textTheme.displayLarge,
                ),
                // spacing
                const SizedBox(height: 18.0),
                // sub-heading
                Text(
                  'I build meaningful mobile apps.',
                  style: textTheme.displayLarge!
                      .copyWith(color: AppTheme.fontLightColor),
                ),
                // spacing
                const SizedBox(height: 18.0),
                // body
                SizedBox(
                  width: size.width * 0.4,
                  child: Text.rich(
                    TextSpan(
                      text:
                          "     I'm a software engineer specializing in building (and occasionally designing) exceptional flutter applications. Currently, I'm focused on building accessible, marketing and productivity apps at ",
                      children: [
                        TextSpan(
                          text: "Grappus",
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Utils.openURL(Urls.currentCompanyLink),
                          style: textTheme.bodyLarge!
                              .copyWith(color: AppTheme.ternaryColor),
                        ),
                        const TextSpan(text: "."),
                      ],
                    ),
                    style: textTheme.bodyLarge,
                  ),
                ),
                // spacing
                const SizedBox(height: 22.0),
                // download resume button
                AppButton(
                  onPressed: () => Utils.openURL(Urls.resumeLink),
                  borderColor: AppTheme.secondaryColor,
                  title: 'Download Resume',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
